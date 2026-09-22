---
name: fact-checker
description: >
  Analyze claims, posts, or articles against authoritative sources and return a verdict
  with confidence score for each claim to combat misinformation. Use this skill when:
  user shares a claim and asks "is this true?", user forwards a social media post and
  asks you to verify it, user mentions "fact check this" or "verify this information",
  user asks "did [person] really say this?" or "did [event] really happen?", user is
  about to share information and wants to verify accuracy first, or user asks "is there
  evidence for [claim]?". Performs multi-source verification with 3-tier source hierarchy
  (gov/academic > major news > social), cross-references 3+ independent sources, checks
  timestamps, calculates confidence score 0-100, and assigns verdict: TRUE / FALSE /
  MISLEADING / UNVERIFIABLE.
---

# Fact Checker Skill
**Version:** 1.0.0  
**Created:** 2026-05-18  
**Purpose:** Analyze claims, posts, or articles against authoritative sources. Return a verdict and confidence score for each claim to combat misinformation.

---

## When to Use This Skill

Use this skill when:
- User shares a claim and asks "is this true?"
- User forwards a social media post and asks you to verify it
- User mentions "fact check this" or "verify this information"
- User asks "did [person] really say this?" or "did [event] really happen?"
- User is about to share information and wants to verify accuracy first
- User asks "is there evidence for [claim]?"

**Do NOT use for:**
- Opinion verification (e.g., "is this a good movie?" — opinions aren't factual claims)
- Future predictions (e.g., "will Bitcoin hit $100K?" — can't fact-check the future)
- Subjective experiences (e.g., "was I justified in being angry?" — not a factual claim)
- Mathematical computations (just calculate directly)

---

## Core Strategy: Multi-Source Verification with Confidence Scoring

Fact-checking methodology:

1. **Extract claims** — Break down statement into individual verifiable assertions
2. **Source authority** — Search for primary sources (not opinion pieces)
3. **Cross-reference** — Find 3+ independent sources
4. **Time-stamp** — Check if claim is outdated
5. **Confidence score** — Rate 0-100 based on source quality + consensus
6. **Verdict** — TRUE / FALSE / MISLEADING / UNVERIFIABLE

---

## Execution Protocol

### Step 1: Claim Extraction

Break the statement into atomic claims:

**Example Input:**  
"Elon Musk sold all his Bitcoin in 2023, causing the price to crash 40%"

**Extracted Claims:**
1. Elon Musk owned Bitcoin
2. He sold all of it
3. The sale happened in 2023
4. Bitcoin price crashed
5. The crash was 40%
6. Musk's sale caused the crash (causal claim)

**Output:**
```python
claims = [
    {
        "id": 1,
        "claim": "Elon Musk owned Bitcoin",
        "type": "factual",
        "verifiable": True
    },
    {
        "id": 2,
        "claim": "He sold all his Bitcoin in 2023",
        "type": "factual",
        "verifiable": True
    },
    {
        "id": 3,
        "claim": "Bitcoin price crashed 40%",
        "type": "factual",
        "verifiable": True
    },
    {
        "id": 4,
        "claim": "Musk's sale caused the crash",
        "type": "causal",
        "verifiable": False  # Causation hard to prove
    }
]
```

### Step 2: Source Search

For each claim, search for authoritative sources:

```python
# Priority order for sources:
SOURCE_HIERARCHY = {
    "tier_1": [
        "Government databases", "Academic journals", "SEC filings",
        "Corporate financial statements", "Court records"
    ],
    "tier_2": [
        "Reputable news organizations", "Industry trade publications",
        "Company blogs", "Expert interviews"
    ],
    "tier_3": [
        "Social media", "Opinion blogs", "Unverified forums"
    ]
}

def verify_claim(claim_text):
    """Search for authoritative sources"""
    
    # Search using web_search tool
    search_results = web_search(claim_text)
    
    # Categorize sources by tier
    sources = []
    for result in search_results:
        tier = categorize_source(result['url'])
        sources.append({
            "url": result['url'],
            "tier": tier,
            "snippet": result['snippet'],
            "date": result.get('date')
        })
    
    return sources

def categorize_source(url):
    """Determine source authority tier"""
    
    # Tier 1: Government, academic, official
    tier_1_domains = [
        '.gov', '.edu', 'sec.gov', 'census.gov',
        'nih.gov', 'nature.com', 'science.org'
    ]
    
    # Tier 2: Major news, industry publications
    tier_2_domains = [
        'reuters.com', 'bloomberg.com', 'wsj.com',
        'nytimes.com', 'ft.com', 'economist.com'
    ]
    
    for domain in tier_1_domains:
        if domain in url:
            return 1
    
    for domain in tier_2_domains:
        if domain in url:
            return 2
    
    return 3  # Default to tier 3
```

### Step 3: Cross-Reference Verification

Check if multiple independent sources confirm the claim:

```python
def cross_reference(claim, sources):
    """Check consensus across sources"""
    
    tier_1_sources = [s for s in sources if s['tier'] == 1]
    tier_2_sources = [s for s in sources if s['tier'] == 2]
    
    # Extract verdict from each source
    verdicts = []
    for source in tier_1_sources + tier_2_sources:
        # Analyze snippet for confirmation/denial
        if claim.lower() in source['snippet'].lower():
            verdicts.append("confirm")
        elif "not" in source['snippet'].lower() or "false" in source['snippet'].lower():
            verdicts.append("deny")
        else:
            verdicts.append("unclear")
    
    # Calculate consensus
    confirmations = verdicts.count("confirm")
    denials = verdicts.count("deny")
    
    if confirmations >= 2 and denials == 0:
        return "CONFIRMED"
    elif denials >= 2 and confirmations == 0:
        return "DENIED"
    elif confirmations > 0 and denials > 0:
        return "CONFLICTING"
    else:
        return "INSUFFICIENT_DATA"
```

### Step 4: Time-Stamp Validation

Check if claim is current or outdated:

```python
from datetime import datetime, timedelta

def check_recency(claim, sources):
    """Validate if information is current"""
    
    # Extract dates from sources
    source_dates = [s['date'] for s in sources if s.get('date')]
    
    if not source_dates:
        return "UNKNOWN_DATE"
    
    most_recent = max(source_dates)
    oldest = min(source_dates)
    
    # Check if claim might be outdated
    if (datetime.now() - most_recent) > timedelta(days=365):
        return "POTENTIALLY_OUTDATED"
    
    # Check if sources have consistent timeframe
    if (most_recent - oldest) > timedelta(days=180):
        return "TIME_SENSITIVE"  # Claim may have changed over time
    
    return "CURRENT"
```

### Step 5: Confidence Scoring

Rate confidence 0-100 based on:

```python
def calculate_confidence(claim_verification):
    """Calculate confidence score 0-100"""
    
    score = 0
    
    # Source tier quality (40 points max)
    tier_1_count = len([s for s in claim_verification['sources'] if s['tier'] == 1])
    tier_2_count = len([s for s in claim_verification['sources'] if s['tier'] == 2])
    
    score += min(tier_1_count * 20, 30)  # Tier 1 sources worth 20pts each
    score += min(tier_2_count * 5, 10)   # Tier 2 sources worth 5pts each
    
    # Cross-reference consensus (30 points max)
    if claim_verification['consensus'] == "CONFIRMED":
        source_count = len(claim_verification['sources'])
        score += min(source_count * 10, 30)  # 10pts per confirming source
    elif claim_verification['consensus'] == "DENIED":
        source_count = len(claim_verification['sources'])
        score += min(source_count * 10, 30)
    elif claim_verification['consensus'] == "CONFLICTING":
        score += 15  # Partial credit for having data
    
    # Recency (20 points max)
    if claim_verification['recency'] == "CURRENT":
        score += 20
    elif claim_verification['recency'] == "TIME_SENSITIVE":
        score += 10
    elif claim_verification['recency'] == "POTENTIALLY_OUTDATED":
        score += 5
    
    # Direct quote vs inference (10 points max)
    if claim_verification.get('has_direct_quote'):
        score += 10
    
    return min(score, 100)
```

### Step 6: Verdict Assignment

Map confidence score to verdict:

```python
def assign_verdict(confidence, consensus):
    """Assign final verdict"""
    
    if consensus == "CONFIRMED":
        if confidence >= 80:
            return "TRUE"
        elif confidence >= 60:
            return "LIKELY TRUE"
        else:
            return "INSUFFICIENT EVIDENCE"
    
    elif consensus == "DENIED":
        if confidence >= 80:
            return "FALSE"
        elif confidence >= 60:
            return "LIKELY FALSE"
        else:
            return "INSUFFICIENT EVIDENCE"
    
    elif consensus == "CONFLICTING":
        return "MISLEADING"  # Some truth, but mixed with falsehood
    
    else:
        return "UNVERIFIABLE"
```

---

## Output Format

Present results in structured report:

```markdown
# Fact Check Report
**Statement:** "Elon Musk sold all his Bitcoin in 2023, causing the price to crash 40%"

---

## Individual Claims

### Claim 1: "Elon Musk owned Bitcoin"
**Verdict:** ✓ TRUE  
**Confidence:** 95/100

**Evidence:**
- Tesla SEC filing (Feb 2021): Purchased $1.5B Bitcoin [Tier 1 Source]
- Musk Twitter post (May 2021): "Tesla has sold 10% of its holdings" [Tier 1 Source]

**Assessment:** Strong evidence from primary sources that Musk/Tesla owned Bitcoin.

---

### Claim 2: "He sold all his Bitcoin in 2023"
**Verdict:** ✗ FALSE  
**Confidence:** 90/100

**Evidence:**
- Tesla Q2 2024 earnings: Still holds ~9,720 BTC ($647M value) [Tier 1 Source]
- No SEC filing documenting complete sale in 2023 [Tier 1 Source]

**Assessment:** Tesla/Musk did NOT sell all Bitcoin. This claim is false.

---

### Claim 3: "Bitcoin price crashed 40%"
**Verdict:** ⚠ MISLEADING  
**Confidence:** 75/100

**Evidence:**
- Bitcoin price in 2023: Ranged from $16,500 (Jan) to $44,000 (Dec) [Tier 2 Source: CoinMarketCap]
- No single "crash" event in 2023
- Multiple corrections: -15% (Mar), -12% (Aug), -8% (Nov) [Tier 2 Source]

**Assessment:** Bitcoin had corrections but no 40% crash in 2023. Price actually UP 160% for the year.

---

### Claim 4: "Musk's sale caused the crash"
**Verdict:** ⚠ UNVERIFIABLE  
**Confidence:** 20/100

**Evidence:**
- No documented sale to analyze causal relationship
- Causal claims require controlled analysis, not available for market events

**Assessment:** Cannot verify causation even if sale had occurred.

---

## Overall Assessment

**VERDICT:** **FALSE / MISLEADING**  
**Overall Confidence:** 82/100

**Summary:**
The core claim is false. Musk/Tesla did NOT sell all Bitcoin in 2023 (still hold ~10K BTC as of Q2 2024). Bitcoin did not crash 40% in 2023 (actually rose 160%). The causal claim is unverifiable due to false premise.

**Red Flags:**
- ❌ No credible news reports of this sale
- ❌ No SEC filings documenting the sale
- ❌ Market data contradicts crash narrative
- ❌ Classic misinformation structure: False + emotionally charged

**Recommendation:** DO NOT SHARE. This is misinformation.

---

**Sources Checked:** 8 sources (3 Tier 1, 5 Tier 2)  
**Date Checked:** 2026-05-18  
**Fact-Checker:** Claude Sonnet 4.5
```

---

## Special Scenarios

### Scenario 1: Quote Verification

**User:** "Did Einstein really say 'Everyone is a genius'?"

**Protocol:**
1. Search "Einstein quote everyone genius"
2. Check quotation databases: Quote Investigator, Wikiquote
3. Look for original source (letter, speech, book)
4. Check for misattributions

**Common Finding:** Many Einstein quotes are misattributed. Look for:
- Original German text (if applicable)
- Date of quote
- Context of quote

### Scenario 2: Statistical Claims

**User:** "I saw a post saying '80% of startups fail in the first year'"

**Protocol:**
1. Search for primary source (SBA, CB Insights, academic studies)
2. Check definition of "failure" (close, pivot, zombie?)
3. Verify time period and geography
4. Look for methodology

**Red Flags for Stats:**
- No source cited
- Round numbers (80%, 90%) — often made up
- "Studies show" without naming the study
- Old data presented as current

### Scenario 3: Out-of-Context Media

**User:** "This video shows [politician] saying [controversial thing]"

**Protocol:**
1. Reverse image/video search
2. Find full clip, not just excerpt
3. Check date of original
4. Look for deepfake indicators (if video)
5. Check if quote is real but context changes meaning

### Scenario 4: Scientific Claims

**User:** "New study proves coffee causes cancer"

**Protocol:**
1. Find the original study (not news coverage)
2. Check journal reputation (Nature vs predatory journal)
3. Check sample size and methodology
4. Look for peer review
5. Check for conflicts of interest
6. See if results have been replicated

**Red Flags:**
- "Study shows" but can't find the study
- Small sample size (n < 100)
- Correlation presented as causation
- Results contradict decades of prior research

---

## Common Misinformation Patterns

### Pattern 1: "Proof by Screenshot"
A screenshot of a headline/tweet presented as evidence, but:
- URL not visible or cropped out
- Date not visible
- Could be photoshopped

**Check:** Always search for the original source, don't trust screenshots alone.

### Pattern 2: "Misleading Graph"
Graph shows dramatic change, but:
- Y-axis doesn't start at zero
- X-axis has irregular intervals
- Cherry-picked time period

**Check:** Find the raw data and look at full trend.

### Pattern 3: "Expert Says"
Claims "experts agree" or "doctors recommend" but:
- No expert named
- Expert is not credible (chiropractor commenting on vaccines)
- Expert is quoting opinion, not evidence

**Check:** Find the actual expert's words in their own publication.

### Pattern 4: "Old News as Breaking News"
Real event, but happened years ago, presented as current.

**Check:** Always verify date of original event.

### Pattern 5: "Technically True, But Misleading"
Each individual fact is true, but:
- Facts arranged to imply false conclusion
- Critical context omitted
- Causation implied from correlation

**Check:** Look for what's NOT being said.

---

## Integration with Web Search

Always use web_search to find authoritative sources:

```python
# Search for primary sources
search_results = web_search(f"{claim_text} site:gov OR site:edu OR site:reuters.com")

# Search for fact-checks already done
existing_checks = web_search(f"{claim_text} fact check site:snopes.com OR site:politifact.com")

# Search for the original source
original = web_search(f"{claim_text} original source")
```

---

## Confidence Score Calibration

**90-100:** Multiple Tier 1 sources, direct quotes, current data  
**70-89:** Mix of Tier 1/2 sources, good consensus, recent data  
**50-69:** Tier 2 sources only, some consensus, might be outdated  
**30-49:** Few sources, conflicting data, or indirect evidence  
**0-29:** No credible sources, hearsay, or purely speculative

**Never say 100% certain** — always allow for possibility of error.

---

## Red Flags Checklist

When evaluating a claim, watch for:

- [ ] No credible source cited
- [ ] Source is a screenshot, not a link
- [ ] Claim uses emotional language ("shocking", "they don't want you to know")
- [ ] Claim asks you to "share before it's deleted"
- [ ] Statistics with no methodology
- [ ] "Everyone knows" or "it's obvious" (appeal to common knowledge)
- [ ] Extraordinary claim with ordinary evidence
- [ ] Source is politically biased or has financial motive
- [ ] Can't find any major news outlet reporting it
- [ ] Only found on social media, not journalism

**If 3+ red flags:** High chance of misinformation.

---

## Output Variants

### Quick Check (Simple claim)
```
✓ TRUE (Confidence: 85/100)
Tesla did purchase $1.5B Bitcoin in Feb 2021 per SEC filing.
```

### Medium Check (Multiple claims)
```
Claim 1: TRUE (90/100)
Claim 2: FALSE (85/100)
Claim 3: MISLEADING (70/100)

Overall: MISLEADING - Contains some truth but key facts are wrong.
```

### Deep Check (Complex statement)
Full report format shown in Output Format section above.

---

## Limitations

**Cannot fact-check:**
- Future predictions
- Subjective opinions
- Personal experiences
- Classified information
- Events with no public record
- Claims about what someone "thinks" or "believes" (unless they said it publicly)

**When to decline:**
```markdown
❌ Cannot Verify

This claim is about [future event / personal opinion / subjective experience].

Fact-checking requires:
1. Verifiable facts
2. Available evidence
3. Authoritative sources

This claim doesn't meet those criteria. I can help you:
- Evaluate the logic of the argument
- Identify assumptions
- Find related factual information

But I cannot definitively fact-check this statement.
```

---

## Ethical Guidelines

1. **Never claim certainty** — Always express confidence as a score
2. **Show your work** — Always cite sources used
3. **Update if wrong** — If user provides better evidence, revise verdict
4. **No political bias** — Fact-check all sides equally
5. **Distinguish fact from opinion** — Be clear what's verifiable vs subjective

---

## Skill Metadata

**Token Cost:** Medium (5,000–15,000 depending on claim complexity)  
**Time Cost:** Medium (2-5 minutes for thorough check)  
**Output Type:** Structured fact-check report with confidence scores  
**Best For:** Verifying viral claims, checking quotes, validating statistics  
**Dependencies:** web_search tool (required)  
**Success Metric:** % of fact-checks that are later validated by professional fact-checkers

---

## Changelog

**v1.0.0 (2026-05-18)**
- Initial release
- Multi-source verification protocol
- Confidence scoring algorithm
- Common misinformation patterns
- Red flags checklist
- Ethical guidelines
