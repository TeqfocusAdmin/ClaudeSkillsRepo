<#
Sets up automatic sync: GitHub -> Claude Code's local skills folder.
Native PowerShell version -- no admin rights, no Developer Mode needed.

Direction: Git -> Claude Code. Edit a skill file in the repo (on GitHub.com,
or locally + commit + push), and Claude Code picks up that exact file on its
next session -- because ~/.claude/skills/<name> is an NTFS *junction*
pointing straight at your repo clone, not a copy. There's only one real
copy of the file; Claude Code and your git clone are reading the same bytes.

Junctions (not symlinks) on purpose: directory symlinks on Windows normally
require Administrator rights or Developer Mode enabled. Junctions don't --
they work out of the box for any user, which matters on a locked-down machine.

What it does:
  1. Clones (or updates) your repo into ~/skills/claude-skills
  2. Creates a junction for each <skill-name>/ folder into ~/.claude/skills/
  3. Installs a Claude Code SessionStart hook that runs `git pull` at the
     start of every session, so new sessions always see your latest commits.

Requirements: git, PowerShell (built in), python3 (only for safely editing
settings.json without disturbing any hooks already there)

Usage (no admin rights needed):
  powershell -ExecutionPolicy Bypass -File .\setup-git-to-claude-code.ps1

Re-run any time -- safe to run repeatedly.
#>

$ErrorActionPreference = "Stop"

$RepoUrl      = "https://github.com/TeqfocusAdmin/ClaudeSkillsRepo.git"
$RepoDir      = "$HOME\skills\claude-skills"
$SkillsDir    = "$HOME\.claude\skills"
$SettingsFile = "$HOME\.claude\settings.json"
$SyncScript   = "$HOME\skills\claude-skills-sync.ps1"
$LinkSkills   = $false   # $true junction-links repo skills into ~/.claude/skills

Write-Host "==> Cloning/updating $RepoUrl"
if (Test-Path "$RepoDir\.git") {
    try {
        git -C $RepoDir pull --ff-only
    } catch {
        Write-Host "  pull failed -- continuing with whatever's already cloned locally"
    }
} else {
    New-Item -ItemType Directory -Force -Path (Split-Path $RepoDir) | Out-Null
    git clone $RepoUrl $RepoDir
}

if (-not $LinkSkills) {
    Write-Host "==> Skipping skill linking (`$LinkSkills is off)"
} else {
    Write-Host "==> Linking skills into $SkillsDir"
    New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null
    $linkedAny = $false

    # Skills can live at the repo root (<repo>/<name>/SKILL.md) or under a
    # skills/ folder (<repo>/skills/<name>/SKILL.md) -- look in both
    $skillRoots = @($RepoDir)
    if (Test-Path "$RepoDir\skills" -PathType Container) { $skillRoots += "$RepoDir\skills" }

    Get-ChildItem -Path $skillRoots -Directory | ForEach-Object {
        $name = $_.Name

        if ($name -eq ".git") { return }
        if ($name -eq "skills" -and $_.FullName -eq "$RepoDir\skills") { return }  # container, scanned above
        if ($name -eq "synced") {
            Write-Host "  Skipping 'synced' (reserved name -- used by claude.ai-synced skills)"
            return
        }
        if (-not (Test-Path "$($_.FullName)\SKILL.md")) {
            Write-Host "  Skipping '$name' (no SKILL.md found)"
            return
        }

        $target = "$SkillsDir\$name"
        $existing = Get-Item -Path $target -Force -ErrorAction SilentlyContinue
        if ($existing) {
            if ($existing.LinkType -eq "Junction" -or $existing.LinkType -eq "SymbolicLink") {
                # Safe removal of just the link, not its target contents.
                # (Remove-Item -Recurse on a reparse point has a history of
                # deleting the TARGET's contents in some PowerShell versions --
                # cmd's rmdir has always handled this correctly.)
                cmd /c rmdir "$target"
            } else {
                Write-Host "  WARNING: $target already exists and is NOT a link -- leaving it alone."
                Write-Host "           Move or delete it manually if you want it replaced by the repo version."
                return
            }
        }

        New-Item -ItemType Junction -Path $target -Target $_.FullName | Out-Null
        Write-Host "  linked $name"
        $script:linkedAny = $true
    }

    if (-not $linkedAny) {
        Write-Host "  (no new skills linked -- check that your repo has <skill-name>/SKILL.md folders)"
    }
}

Write-Host "==> Writing sync helper to $SyncScript"
New-Item -ItemType Directory -Force -Path (Split-Path $SyncScript) | Out-Null

$syncContent = @"
`$ErrorActionPreference = "Stop"
try {
    git -C "$RepoDir" pull --ff-only --quiet
} catch {
    Write-Host "git-to-claude sync: pull failed, using whatever was last cloned"
}
"@
Set-Content -Path $SyncScript -Value $syncContent -Encoding UTF8

$hookPath = $SyncScript -replace '\\', '/'
$hookCommand = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$hookPath`""

Write-Host "==> Registering SessionStart hook in $SettingsFile"
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
session_start = hooks.setdefault("SessionStart", [])

# Compare commands loosely so C:\x, C:/x and "C:/x" count as the same hook
def norm(cmd):
    return " ".join((cmd or "").replace('"', "").replace("\\", "/").lower().split())

target = norm(sync_cmd)
already = False
for group in session_start:
    kept = []
    for h in group.get("hooks", []):
        if norm(h.get("command")) == target:
            if already:
                continue  # drop duplicate
            already = True
        kept.append(h)
    group["hooks"] = kept
session_start[:] = [g for g in session_start if g.get("hooks")]

if not already:
    session_start.append({"hooks": [{"type": "command", "command": sync_cmd}]})

with open(settings_path, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")

print("  hook registered (" + ("already present" if already else "added") + ")")
'@

$pythonPatch | python3 - $SettingsFile $hookCommand

Write-Host ""
Write-Host "Done."
Write-Host "- Repo cloned at: $RepoDir"
if ($LinkSkills) {
    Write-Host "- ~/.claude/skills/<name> now junction-links straight into that clone"
} else {
    Write-Host "- Skill linking is off (set `$LinkSkills = `$true to turn it on)"
}
Write-Host "- New Claude Code sessions will 'git pull' automatically"
Write-Host "- To sync immediately without starting a new session, run:"
Write-Host "  powershell -ExecutionPolicy Bypass -File `"$SyncScript`""
