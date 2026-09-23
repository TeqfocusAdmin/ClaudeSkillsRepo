<#
Sets up automatic Claude -> Git syncing (native PowerShell version).

Direction: whatever is LIVE on your claude.ai account (the Skills settings
screen) becomes a versioned git history, automatically, every time you use
Claude Code. This is one-way only -- it reads what's already on your
machine and pushes to git. It never writes back to Claude or your account.

How it works:
  - Claude Code already downloads your account's enabled skills into
    ~/.claude/skills/synced/ whenever you use it signed into claude.ai.
  - This script writes a small "mirror + commit" script (sync-from-claude.ps1)
    that pulls the latest repo, copies that folder into the repo's
    claude-ai-snapshot/ folder, and commits + pushes only if something
    actually changed. It never touches the repo's own skills/ folder, so
    edits made there are safe.
  - A Claude Code hook runs that script once per session, timed to fire on
    your first prompt (not immediately at session start) so the background
    download from claude.ai has had time to finish.

Requirements: git, PowerShell (built in), python3 (only used to safely edit
settings.json without corrupting any hooks you already have there)

Usage (run in PowerShell -- no admin rights needed):
  powershell -ExecutionPolicy Bypass -File .\setup-claude-to-git-sync.ps1
#>

$ErrorActionPreference = "Stop"

$SyncedDir    = "$HOME\.claude\skills\synced"
$DestRepo     = "$HOME\skills\claude-ai-skills-history"
$RemoteUrl    = "https://github.com/TeqfocusAdmin/ClaudeSkillsRepo.git"   # change if you want a dedicated repo for this
$Branch       = "master"
$SnapshotDir  = "claude-ai-snapshot"   # folder inside the repo that holds the claude.ai mirror
$SyncScript   = "$HOME\skills\sync-from-claude.ps1"
$SettingsFile = "$HOME\.claude\settings.json"

Write-Host "==> Preparing $DestRepo"
New-Item -ItemType Directory -Force -Path $DestRepo | Out-Null
if (-not (Test-Path "$DestRepo\.git")) {
    git -C $DestRepo init -q
    try { git -C $DestRepo remote add origin $RemoteUrl 2>$null } catch { }
    try { git -C $DestRepo fetch origin -q 2>$null } catch { }
    try { git -C $DestRepo pull origin $Branch --allow-unrelated-histories -q 2>$null } catch { }
}

Write-Host "==> Writing $SyncScript"
New-Item -ItemType Directory -Force -Path (Split-Path $SyncScript) | Out-Null

$syncContent = @"
# Mirrors ~/.claude/skills/synced/ into a git repo and commits changes.
`$ErrorActionPreference = "Stop"

`$SyncedDir  = "$SyncedDir"
`$DestRepo   = "$DestRepo"
`$Branch     = "$Branch"
`$DestSkills = "`$DestRepo\$SnapshotDir"

# Give claude.ai's background download a little time if it just started
for (`$i = 0; `$i -lt 5; `$i++) {
    if ((Test-Path `$SyncedDir) -and (Get-ChildItem `$SyncedDir -ErrorAction SilentlyContinue)) { break }
    Start-Sleep -Seconds 1
}

if (-not ((Test-Path `$SyncedDir) -and (Get-ChildItem `$SyncedDir -ErrorAction SilentlyContinue))) {
    exit 0
}

# Catch up with GitHub first so our commit lands on top of the latest history.
# (Git failures are checked via exit code -- try/catch doesn't see them in PS 5.1.)
git -C `$DestRepo pull --rebase -q origin `$Branch
if (`$LASTEXITCODE -ne 0) {
    git -C `$DestRepo rebase --abort *> `$null
    Write-Host "claude-to-git sync: couldn't pull from GitHub -- skipping this run."
    exit 0
}

if (Test-Path `$DestSkills) { Remove-Item -Recurse -Force `$DestSkills }
New-Item -ItemType Directory -Force -Path `$DestSkills | Out-Null

Get-ChildItem -Path `$SyncedDir -Recurse -Filter "SKILL.md" -File | ForEach-Object {
    `$skillFolder = `$_.Directory
    `$skillName = `$skillFolder.Name
    `$target = "`$DestSkills\`$skillName"
    if (Test-Path `$target) {
        Write-Host "  duplicate skill folder name '`$skillName' - keeping the first one found"
    } else {
        Copy-Item -Recurse -Force `$skillFolder.FullName `$target
    }
}

Push-Location `$DestRepo
try {
    `$changes = git status --porcelain
    if (`$changes) {
        git add -A
        git commit -m "Auto-sync from claude.ai - `$(Get-Date -Format 'yyyy-MM-dd HH:mm')" -q
    }

    `$ahead = git rev-list "origin/`$Branch..HEAD"
    if (`$ahead) {
        git push -q origin "HEAD:`$Branch"
        if (`$LASTEXITCODE -ne 0) {
            # Someone pushed in the meantime -- rebase onto it and try once more
            git pull --rebase -q origin `$Branch
            if (`$LASTEXITCODE -eq 0) { git push -q origin "HEAD:`$Branch" }
            if (`$LASTEXITCODE -ne 0) {
                git rebase --abort *> `$null
                Write-Host "claude-to-git sync: commit(s) saved locally, push failed (check your remote/auth)."
            }
        }
    }
} finally {
    Pop-Location
}
"@

Set-Content -Path $SyncScript -Value $syncContent -Encoding UTF8

$hookPath = $SyncScript -replace '\\', '/'
$hookCommand = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$hookPath`""

Write-Host "==> Registering hook in $SettingsFile"
New-Item -ItemType Directory -Force -Path (Split-Path $SettingsFile) | Out-Null

$pythonPatch = @'
import json, os, sys

settings_path, sync_cmd = sys.argv[1], sys.argv[2]

data = {}
if os.path.exists(settings_path):
    with open(settings_path) as f:
        try:
            data = json.load(f)
        except json.JSONDecodeError:
            print("  WARNING: " + settings_path + " isn't valid JSON - leaving it untouched.")
            sys.exit(0)

hooks = data.setdefault("hooks", {})
event = hooks.setdefault("UserPromptSubmit", [])

# Compare commands loosely so C:\x, C:/x and "C:/x" count as the same hook
def norm(cmd):
    return " ".join((cmd or "").replace('"', "").replace("\\", "/").lower().split())

target = norm(sync_cmd)
already = False
for group in event:
    kept = []
    for h in group.get("hooks", []):
        if norm(h.get("command")) == target:
            if already:
                continue  # drop duplicate
            already = True
        kept.append(h)
    group["hooks"] = kept
event[:] = [g for g in event if g.get("hooks")]

if not already:
    event.append({"hooks": [{"type": "command", "command": sync_cmd, "once": True}]})

with open(settings_path, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")

print("  hook registered (" + ("already present" if already else "added") + ")")
'@

$pythonPatch | python3 - $SettingsFile $hookCommand

Write-Host ""
Write-Host "Done."
Write-Host "- Live snapshot of your claude.ai skills will land in: $DestRepo\$SnapshotDir"
Write-Host "- It updates automatically the next time you use Claude Code (fires once, on your first prompt)"
Write-Host "- To force a snapshot right now: powershell -ExecutionPolicy Bypass -File `"$SyncScript`""
Write-Host "- Every auto-commit in that repo IS a version -- 'git log' shows the history"
