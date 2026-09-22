---
name: token-optimizer
description: >
  Process large numbers of documents and sources using a fraction of normal token usage,
  enabling deep multi-source analysis without hitting daily limits. Use this skill when:
  user uploads 10+ documents and asks for analysis across all of them, user requests
  comparative analysis of multiple sources (e.g., "compare these 20 competitor websites"),
  user mentions "I have a lot of files" or "analyze all of these", user wants to synthesize
  information from many sources but has limited tokens remaining, user explicitly asks to
  "use fewer tokens" or "optimize for token usage", or you need to process a large corpus
  but want to preserve token budget for iteration. Achieves 85-95% token savings through
  multi-pass hierarchical processing: Index → Triage → Strategic Sampling → Incremental Synthesis.
---

# Token Optimizer Skill
**Version:** 1.0.0  
**Created:** 2026-05-18  
**Purpose:** Process large numbers of documents and sources using a fraction of normal token usage, enabling deep multi-source analysis without hitting daily limits.

---

## When to Use This Skill

Use this skill when:
- User uploads 10+ documents and asks for analysis across all of them
- User requests comparative analysis of multiple sources (e.g., "compare these 20 competitor websites")
- User mentions "I have a lot of files" or "analyze all of these"
- User wants to synthesize information from many sources but has limited tokens remaining
- User explicitly asks to "use fewer tokens" or "optimize for token usage"
- You need to process a large corpus but want to preserve token budget for iteration

**Do NOT use for:**
- Single document analysis (just read it normally)
- Tasks under 5 sources (normal processing is fine)
- Tasks requiring deep line-by-line analysis of every file (token optimization trades depth for breadth)

---

## Core Strategy: Multi-Pass Hierarchical Processing

Token optimization works by **never loading all content at once**. Instead:

1. **Index Pass** — Get file metadata only (names, sizes, types) — ~50 tokens per file
2. **Triage Pass** — Read first 500 chars of each file to categorize — ~200 tokens per file  
3. **Strategic Sampling** — Load only the most relevant sections based on user query
4. **Incremental Synthesis** — Build answer progressively, loading additional context only as needed

**Token Savings:** 85–95% reduction vs. loading all files in full context

---

## Execution Protocol

### Step 1: Index and Triage (First Tool Call)

```bash
# Get file inventory without reading content
ls -lh /mnt/user-data/uploads/

# For each file, read ONLY the first 500 characters
for file in /mnt/user-data/uploads/*; do
  echo "=== $(basename "$file") ==="
  head -c 500 "$file" 2>/dev/null || echo "[Binary file]"
  echo -e "\n---"
done
```

**Output:** File type catalog (PDFs, spreadsheets, docs, images) with topic hints from first 500 chars.

### Step 2: Strategic Load Plan

Based on user query + file triage, decide:
- **High Priority** — Files that directly answer the query (load in full)
- **Medium Priority** — Files that provide context (load excerpts only)
- **Low Priority** — Files unlikely to be relevant (skip unless user asks)

**Example:**
- User query: "What are the common themes across all customer feedback?"
- Triage shows: 15 PDFs, 10 are customer interviews, 3 are internal memos, 2 are financial reports
- Load plan: Interviews (high), memos (medium - excerpts only), financial (skip)

### Step 3: Targeted Extraction

For high-priority files, use targeted extraction instead of full load:

```bash
# PDF: Extract only pages with keywords
pdfgrep -n "customer pain points|challenges|frustration" file.pdf | head -20

# DOCX: Extract only sections matching query
python3 << 'EOF'
from docx import Document
doc = Document('/mnt/user-data/uploads/file.docx')
for para in doc.paragraphs:
    if any(kw in para.text.lower() for kw in ['feedback', 'issue', 'problem']):
        print(para.text)
EOF

# Spreadsheet: Load only relevant columns
python3 << 'EOF'
import pandas as pd
df = pd.read_excel('/mnt/user-data/uploads/data.xlsx')
# Load only columns matching query context
relevant_cols = [col for col in df.columns if 'feedback' in col.lower()]
print(df[relevant_cols].head(20).to_string())
EOF
```

### Step 4: Incremental Synthesis

Build the answer in layers:
1. **First Pass** — Answer based on high-priority files only
2. **User Follow-up?** — If user asks for more detail, load medium-priority excerpts
3. **User Drill-down?** — If user asks about specific file, load that file in full

**Never load all content preemptively.** Wait for user signal that more depth is needed.

---

## Token Budget Allocation

For a typical 20-file analysis:

| Phase | Tokens/File | Total for 20 Files | % of Budget |
|-------|-------------|-------------------|-------------|
| Index + Triage | 250 | 5,000 | 10% |
| High Priority (5 files) | 2,000 | 10,000 | 20% |
| Medium Priority (10 files) | 500 | 5,000 | 10% |
| Low Priority (5 files) | 0 | 0 | 0% |
| **Synthesis** | — | 5,000 | 10% |
| **Reserve for iteration** | — | 25,000 | 50% |
| **Total** | — | **50,000** | **100%** |

**Normal approach:** Load all 20 files = 200,000+ tokens (4x over budget)  
**Optimized approach:** 50,000 tokens with 25,000 held in reserve for follow-ups

---

## Special Techniques

### Technique 1: Batch Extraction with `grep`

Instead of opening files, extract matching lines only:

```bash
# Find all lines mentioning "pricing" across all files
grep -rih "pricing\|price\|cost" /mnt/user-data/uploads/ | sort | uniq
```

**Tokens saved:** 95% (only matching lines loaded, not full files)

### Technique 2: Statistical Summaries for Structured Data

For spreadsheets, show statistics instead of raw data:

```python
import pandas as pd
df = pd.read_csv('/mnt/user-data/uploads/data.csv')

# Instead of showing all rows, show summary stats
print(df.describe())
print(df['category'].value_counts())
print(df.groupby('segment')['revenue'].sum())
```

**Tokens saved:** 90% (100-row dataset → 10 lines of stats)

### Technique 3: Sampling for Qualitative Data

For large text corpora (e.g., 50 customer interviews), sample strategically:

```python
import random
files = list(Path('/mnt/user-data/uploads/').glob('interview*.txt'))

# Read 20% of files in full, remainder as excerpts
sample_full = random.sample(files, k=len(files)//5)
sample_excerpt = [f for f in files if f not in sample_full]

for f in sample_full:
    print(f"=== {f.name} (FULL) ===")
    print(f.read_text())

for f in sample_excerpt:
    print(f"=== {f.name} (EXCERPT) ===")
    print(f.read_text()[:500])
```

**Tokens saved:** 80% (read 20% fully, 80% as excerpts)

### Technique 4: Chunked Processing with State

For iterative analysis, maintain state file to avoid re-reading:

```python
import json
from pathlib import Path

STATE_FILE = '/home/claude/analysis_state.json'

# Load previous state if exists
if Path(STATE_FILE).exists():
    state = json.loads(Path(STATE_FILE).read_text())
    processed_files = state['processed']
else:
    state = {'processed': [], 'themes': []}
    processed_files = []

# Process only new files
all_files = list(Path('/mnt/user-data/uploads/').glob('*.pdf'))
new_files = [f for f in all_files if str(f) not in processed_files]

for f in new_files:
    # Extract themes from this file
    themes = extract_themes(f)
    state['themes'].extend(themes)
    state['processed'].append(str(f))

# Save state for next iteration
Path(STATE_FILE).write_text(json.dumps(state))

# Return only new insights
print(f"Analyzed {len(new_files)} new files")
print(f"Found {len([t for t in state['themes'] if t not in processed_files])} new themes")
```

**Tokens saved:** 95% on subsequent runs (only process new files, not entire corpus again)

---

## Output Format

When using token optimization, tell the user what you did:

```markdown
📊 **Token-Optimized Analysis Complete**

**Files Processed:** 18 of 20 uploaded
- **Analyzed in full:** 4 files (highest relevance to your query)
- **Excerpt analysis:** 14 files (supporting context)
- **Skipped:** 2 files (financial reports - not relevant to customer feedback query)

**Token Usage:** ~12,000 tokens (vs. ~180,000 for full load)
**Token Savings:** 93%

**Key Findings:**
[Your analysis here]

---

💡 **Want more detail?** I can:
- Load any specific file in full if you want deeper analysis
- Analyze the 2 skipped files if you think they're relevant
- Re-run with different prioritization if I missed something
```

**Critical:** Always disclose what you loaded and what you skipped. User needs to know the analysis boundaries.

---

## Quality Guardrails

### When Token Optimization is NOT Appropriate

Do **not** use token optimization for:
1. **Legal document review** — Every clause matters, can't sample
2. **Code debugging** — Need full context to find the bug
3. **Financial audit** — Every transaction must be checked
4. **Contract analysis** — Can't skip sections
5. **Medical records** — Liability requires full review

**If user query requires exhaustive analysis, tell them:**

> "This task requires analyzing every file in full for accuracy. Token optimization would risk missing critical details. I recommend either:
> 1. Breaking this into smaller batches (analyze 5 files at a time)
> 2. Using this analysis across multiple days to stay within token limits
> 3. Prioritizing the most critical files first
> 
> Which approach would you prefer?"

### Validation Protocol

After token-optimized analysis:
1. **Sanity check** — Do the findings make sense given what was skipped?
2. **Coverage report** — What % of total content was analyzed?
3. **Confidence score** — How confident are you in the conclusions?

**Example disclosure:**

> ⚠️ **Analysis Coverage:** This analysis is based on 30% of total content (6 of 20 files read in full, 14 sampled). Confidence level: **Medium**. If this is a high-stakes decision, I recommend analyzing remaining files for validation.

---

## Integration with Other Skills

### With `content-strategist`
Token-optimize research phase (read 50 competitor blogs) → then write in full detail

### With `abm-intelligence`
Token-optimize account research (scan 20 news articles) → synthesize into brief

### With `customer-research`
Token-optimize review mining (analyze 200 G2 reviews) → extract top themes

### With `competitor-profiling`
Token-optimize competitive intelligence (scan 10 competitor sites) → synthesize positioning

---

## Advanced: Parallel Processing

For extremely large corpora (100+ files), process in parallel:

```python
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

def extract_themes(filepath):
    """Extract themes from a single file (simplified)"""
    content = Path(filepath).read_text()[:1000]  # First 1000 chars only
    # Run extraction logic
    return themes

files = list(Path('/mnt/user-data/uploads/').glob('*.txt'))

with ThreadPoolExecutor(max_workers=10) as executor:
    all_themes = list(executor.map(extract_themes, files))

# Deduplicate and rank themes
from collections import Counter
theme_counts = Counter([t for themes in all_themes for t in themes])
top_themes = theme_counts.most_common(10)

print("Top 10 themes across all files:")
for theme, count in top_themes:
    print(f"{theme}: {count} mentions")
```

**Tokens saved:** 90% (process all files, but only extract themes, not full content)

---

## Real-World Example

**User:** "I've uploaded 25 customer feedback PDFs. What are the top 3 pain points?"

**Without optimization:**
- Load all 25 PDFs in full → 150,000 tokens
- Hit daily limit
- Can't iterate on findings

**With optimization:**
1. **Index pass** — List 25 files, read first page of each → 8,000 tokens
2. **Triage** — Identify 10 files mentioning "pain points" / "challenges" / "issues"
3. **Targeted extraction** — Extract only paragraphs with those keywords → 12,000 tokens
4. **Synthesis** — Analyze extracted text, identify top 3 themes → 5,000 tokens
5. **Reserve** — Keep 25,000 tokens for user follow-up questions

**Total:** 25,000 tokens used, 25,000 reserved  
**Result:** User gets answer + can ask 3–4 follow-ups before hitting limit

---

## Skill Metadata

**Token Cost:** Low (5,000–15,000 per analysis, regardless of corpus size)  
**Time Cost:** Medium (requires strategic planning before processing)  
**Output Type:** Analysis + methodology disclosure  
**Best For:** Multi-source synthesis, competitive intelligence, research compression, review mining  
**Dependencies:** None  
**Success Metric:** Token savings % + user satisfaction with depth/coverage balance

---

## Changelog

**v1.0.0 (2026-05-18)**
- Initial release
- Core multi-pass hierarchical processing
- Batch extraction techniques
- Parallel processing for large corpora
- Quality guardrails and disclosure protocol
