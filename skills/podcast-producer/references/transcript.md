# Transcript Reference — TeqTalk Podcast Producer

## Purpose
The transcript is the raw material for every post-production asset. Getting the transcript right — trimmed, flagged, and mapped — is what separates a fast repurposing workflow from a slow, confused one.

**Rule:** Never rewrite transcript content. Trim and flag only. The guest's words are the asset.

---

## Transcript Trimming Protocol

### Step 1 — Full Read First
Read the entire transcript before making any marks. You're looking for:
- The 5–7 moments that are most quotable, surprising, or insight-dense
- The overall narrative arc — what is this episode actually about?
- Sections that are clearly filler vs. sections that are genuinely valuable
- Any moments where the guest says something they may not have intended to be published

### Step 2 — Flag Key Moments
Mark the 5–7 most valuable moments with a comment:

`[KEY MOMENT: reason — e.g., "sharpest insight," "most surprising claim," "best story," "use case example," "future outlook quote"]`

These key moments become the source material for reels, quote cards, LinkedIn posts, and newsletter sections.

### Step 3 — Mark Sections for Trimming
Bold the sections recommended for removal. Do not edit the text — bold only.

**Output format:**
```
[00:02:14] Guest: So I think the thing that most people miss about 
data governance is that it's not actually a technology problem.
[KEY MOMENT: core thesis — most counterintuitive claim of the episode]

[00:02:45] Host: That's interesting. Can you say more about that?

[00:02:50] Guest: **Yeah, so, um, I mean, I've been saying this for 
a while and I think, you know, it's, it's one of those things where 
you kind of have to, um, live through it to really understand it, 
but, uh, the thing is...**
[TRIM: excessive filler — transition into the next point is recoverable]

[00:03:15] Guest: The real issue is that most organizations treat 
governance as an IT checkbox. They assign it to the data engineering 
team and say "make sure the data is clean." But governance is a 
business problem. Who owns the definition of a customer? Who owns 
the definition of revenue? Those are business decisions.
[KEY MOMENT: "governance is a business problem" — quotable + actionable]
```

---

## Trim Criteria

| Trim Type | Description | Action |
|---|---|---|
| **Opening pleasantries** | Extended greetings, "how are you," weather chat, bio recap the host already gave | Bold for trim |
| **Repeated points** | Guest makes the same point 2+ times — keep the best version | Bold weaker instance for trim |
| **Off-topic tangents** | Conversation drifts away from the episode's central theme | Bold for trim — flag what's being removed |
| **Filler clusters** | Dense "um," "you know," "like," "sort of" — normal density is fine, extreme density disrupts readability | Bold for trim |
| **Closing logistics** | "Thanks for having me," "where can people find you," outro logistics | Bold for trim |
| **Sponsor / promo content** | Any promotional content that doesn't belong in repurposed assets | Bold for trim |
| **Technical audio gaps** | "[inaudible]" sections or cross-talk that can't be recovered | Note as `[AUDIO GAP — cannot recover]` |

### What NOT to Trim
- Any moment the guest expresses genuine vulnerability or uncertainty — this is gold
- Disagreement or tension in the conversation — even mild pushback is engaging
- Any specific number, metric, or timeframe the guest mentions — these make reels and quote cards concrete
- Guest stories with a clear beginning, middle, and end — never cut a complete story
- The guest's first answer to a zone 2 or zone 3 question — first answers are usually most honest

---

## Key Moment Summary Output

After trimming, produce a Key Moment Summary — a brief document that maps the episode's best material to potential assets.

```
KEY MOMENT SUMMARY — TeqTalk Episode [#]
Guest: [Name], [Title]
Episode theme: [Central topic]

---

MOMENT 1 — [Timestamp]
Quote: "[Exact or close quote]"
Type: [Core thesis / Surprising claim / Use case story / 
       Future outlook / Contrarian take / Vulnerable moment]
Best for: [Reel script / Quote card / Newsletter hook / 
           LinkedIn post hook]
Why it works: [1 line — what makes this moment special]

MOMENT 2 — [Timestamp]
...

MOMENT 3 — [Timestamp]
...

[Continue for all 5–7 key moments]

---

EPISODE'S SINGLE BEST MOMENT (for lead reel / newsletter hook):
[Timestamp] — [Quote]
[Why this one above the others]

EPISODE'S CENTRAL THESIS (1 sentence):
[What this episode is fundamentally arguing — in the guest's voice]

RECOMMENDED EPISODE TITLE OPTIONS (3):
1. [Sharp, specific, outcome or tension-based]
2. [Alternative angle on the same theme]
3. [Guest-name forward version]
```

---

## Timestamp Preservation Rules

- **Never alter timestamps** — they are reference points for the editing team
- **Preserve the original timestamp format** exactly as received
- **If timestamps are missing** from the raw transcript, flag this: `[NOTE: timestamps not present in source — editor will need to locate moments manually]`
- **When flagging a key moment**, place the flag on the line immediately after the quote, not mid-sentence
