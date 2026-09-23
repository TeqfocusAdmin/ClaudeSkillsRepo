---
name: find-skill
description: >
  Gateway to entire skill library that automatically finds and loads the right skill for
  any task. Acts as the entry point when user describes a task in plain English without
  naming a specific skill. Use this skill when: user describes a task but doesn't name a
  specific skill (e.g., "help me write a sales email"), user says "what can you help me
  with?" or "what skills do you have?", user's request could map to multiple skills and
  you need to triage, user explicitly asks "find the right skill for [task]", or you're
  unsure which skill to use and want to search the library systematically. Performs semantic
  matching (0-100 score), auto-executes high-confidence matches (>80%), disambiguates close
  races (60-80%), and integrates with skill-creator for gaps.
---

# Find Skill - Library Gateway
**Version:** 1.0.0  
**Created:** 2026-05-18  
**Purpose:** Acts as the entry point to your entire skill library. User describes a task in plain English, Claude scans all available skills and automatically loads + executes the right one.

---

## When to Use This Skill

Use this skill when:
- User describes a task but doesn't name a specific skill (e.g., "help me write a sales email")
- User says "what can you help me with?" or "what skills do you have?"
- User's request could map to multiple skills and you need to triage
- User explicitly asks "find the right skill for [task]"
- You're unsure which skill to use and want to search the library systematically

**Do NOT use for:**
- User explicitly names a skill (e.g., "use the demand-gen skill to write this email")
- Trivial tasks that don't need a skill (e.g., "what's 2+2?")
- Tasks clearly outside your skill library (e.g., "book me a flight")

---

## Core Strategy: Semantic Matching + Auto-Execution

The Find Skill workflow:

1. **Parse user intent** — Extract task type, domain, output format, and constraints
2. **Scan skill library** — Search all SKILL.md files for semantic matches
3. **Rank candidates** — Score each skill by relevance (0-100)
4. **Auto-select** — If top match scores >80, load and execute automatically
5. **Disambiguation** — If top 2-3 skills score 60-80, ask user to choose
6. **Create new skill** — If no match >40, suggest building a new skill

---

## Execution Protocol

### Step 1: Parse User Intent

Extract structured task metadata from user's request:

```python
import json

user_request = """I need to create a personalized landing page for 
a target account in the healthcare vertical"""

# Extract key attributes
task = {
    "task_type": "content_creation",
    "domain": "marketing",
    "output_format": "web_page",
    "audience": "b2b_healthcare",
    "personalization": True,
    "keywords": ["landing page", "personalized", "account", "healthcare"]
}

print(json.dumps(task, indent=2))
```

### Step 2: Scan All Skills

```bash
# Build skill inventory
echo "Scanning skill library..."

# Search all skill descriptions and trigger criteria
for skill_path in /mnt/skills/user/*/SKILL.md /mnt/skills/organization/*/SKILL.md; do
    skill_name=$(basename $(dirname "$skill_path"))
    
    # Extract description (first 200 chars after "## When to Use")
    description=$(grep -A 10 "## When to Use" "$skill_path" | head -15)
    
    echo "=== $skill_name ==="
    echo "$description"
    echo ""
done
```

**Output:** Complete skill catalog with trigger criteria for each.

### Step 3: Semantic Matching Algorithm

Score each skill against user intent:

```python
from pathlib import Path
import re

def score_skill(skill_path, user_keywords, user_task):
    """Score skill relevance (0-100)"""
    
    skill_text = Path(skill_path).read_text().lower()
    score = 0
    
    # Keyword matching (40 points max)
    keyword_matches = sum(1 for kw in user_keywords if kw.lower() in skill_text)
    score += min(keyword_matches * 10, 40)
    
    # Task type matching (30 points)
    task_types = {
        "content_creation": ["write", "create", "draft", "compose"],
        "data_analysis": ["analyze", "research", "intelligence", "data"],
        "automation": ["automate", "workflow", "engine", "sync"],
        "design": ["design", "visual", "brand", "layout"]
    }
    
    if user_task["task_type"] in task_types:
        matches = sum(1 for term in task_types[user_task["task_type"]] 
                     if term in skill_text)
        score += min(matches * 10, 30)
    
    # Domain matching (30 points)
    domains = {
        "marketing": ["campaign", "content", "abm", "demand"],
        "sales": ["presales", "proposal", "sales", "rfp"],
        "product": ["roadmap", "feature", "specs"],
    }
    
    if user_task["domain"] in domains:
        matches = sum(1 for term in domains[user_task["domain"]] 
                     if term in skill_text)
        score += min(matches * 10, 30)
    
    return min(score, 100)

# Score all skills
skill_scores = []
for skill_path in Path('/mnt/skills/user/').glob('*/SKILL.md'):
    score = score_skill(
        skill_path, 
        user_keywords=["landing page", "personalized", "account"],
        user_task={"task_type": "content_creation", "domain": "marketing"}
    )
    skill_scores.append((skill_path.parent.name, score))

# Rank by score
skill_scores.sort(key=lambda x: x[1], reverse=True)

print("Top 5 matching skills:")
for skill, score in skill_scores[:5]:
    print(f"{skill}: {score}/100")
```

### Step 4: Decision Tree

```python
top_score = skill_scores[0][1]
second_score = skill_scores[1][1] if len(skill_scores) > 1 else 0

if top_score >= 80:
    # Clear winner - auto-execute
    print(f"✓ Auto-loading: {skill_scores[0][0]} (confidence: {top_score}%)")
    # Load and execute the skill
    
elif top_score >= 60 and (top_score - second_score) < 15:
    # Close race - disambiguate
    print(f"🤔 I found {len([s for s,sc in skill_scores if sc >= 60])} relevant skills:")
    for skill, score in skill_scores[:3]:
        if score >= 60:
            print(f"  • {skill} ({score}% match)")
    print("\nWhich would you like to use?")
    
elif top_score >= 40:
    # Weak match - suggest modification
    print(f"📋 Best match is {skill_scores[0][0]} ({top_score}% match)")
    print("But it's not a perfect fit. Should I:")
    print("  1. Use this skill anyway (may need adjustments)")
    print("  2. Build a new custom skill for this task")
    
else:
    # No match - build new
    print("🔧 I don't have a skill for this task yet.")
    print("I can build one for you using the skill-creator.")
    print("This will take ~5 minutes. Proceed?")
```

---

## Skill Library Map

Here's your current skill inventory organized by domain:

### 🎯 GTM Strategy & Intelligence
- `teqfocus-gtm` — Master GTM positioning and messaging (use as base for all Teqfocus content)
- `abm-intelligence` — Target account research, buying group mapping
- `competitor-profiling` — Competitive intelligence and battlecard research
- `customer-research` — ICP research, persona development, VOC analysis

### 📝 Content Production
- `content-strategist` — Blog posts, LinkedIn, newsletters, case studies, white papers
- `podcast-producer` — TeqTalk production from guest research to post-production
- `teqtalk-guest-brief` — Guest intelligence and talking points
- `teqtalk-episode-framework` — Interview arc and framework
- `teqtalk-question-guide` — Interview cheat sheet
- `teqtalk-transcript-trim` — Trim transcript with timestamps
- `teqtalk-trailer-arc` — 90-second cinematic trailer script
- `teqtalk-riverside-brief` — Riverside export and edit brief
- `teqtalk-asset-pack` — 9-asset post-production pack
- `teqtalk-thumbnail-formula` — Thumbnail concepts and A/B variants
- `teqtalk-catalogue-recut` — Back-catalogue reactivation

### 🚀 Demand Generation
- `demand-gen` — Email sequences, nurture campaigns, lead magnet copy
- `linkedin-campaigns` — LinkedIn content and outreach
- `events-engine` — Event campaigns (CXO dinners, conferences, webinars)
- `lifecycle-nurture` — Nurture sequences and re-engagement
- `campaign-designer` — Multi-touch campaign architecture

### 💼 Sales Enablement
- `presales-agent` — First-call prep, discovery, objection handling
- `sales-enablement` — Sales decks, battlecards, one-pagers
- `partner-marketing` — Co-marketing with Salesforce/Snowflake

### 🎨 Design & Brand
- `teqfocus-design` — Brand application (colors, typography, logo)
- `frontend-design` — Production-grade web UI and components

### 📊 Marketing Operations
- `abm-microsite` — Personalized WordPress microsites
- `analytics-tracking` — Marketing analytics and attribution
- `clay-engine` — Clay workflow automation (11 use cases)
- `apollo-icp-engine` — Apollo contact sourcing and ICP scoring

### 🔍 SEO & Optimization
- `seo-audit` — Traditional SEO technical audit
- `ai-seo` — AI search optimization (ChatGPT, Perplexity, Claude)
- `page-cro` — Landing page conversion optimization

### 🎓 Research & Psychology
- `marketing-psychology` — Behavioral science and mental models
- `customer-marketing` — Case studies, QBRs, upsell campaigns

---

## Auto-Execution Examples

### Example 1: Clear Winner

**User:** "Write me an email sequence to nurture cold leads from our last webinar"

**Find Skill Analysis:**
```
Scanning 44 skills...
Top matches:
1. demand-gen: 92/100 ✓ AUTO-LOAD
2. lifecycle-nurture: 78/100
3. events-engine: 65/100

Loading demand-gen skill...
```

**Output:** Immediately execute demand-gen skill, no user confirmation needed.

---

### Example 2: Disambiguation

**User:** "Help me create content for LinkedIn"

**Find Skill Analysis:**
```
Scanning 44 skills...
Top matches:
1. linkedin-campaigns: 85/100
2. content-strategist: 82/100
3. partner-marketing: 68/100

🤔 I found 2 highly relevant skills:

• linkedin-campaigns (85% match)
  → For LinkedIn-native posts, carousels, DMs, connection requests
  
• content-strategist (82% match)
  → For repurposing other content (blog → LinkedIn post)

Which fits better, or should I use both?
```

**Output:** Ask user to clarify intent before proceeding.

---

### Example 3: New Skill Needed

**User:** "Help me write a proposal for a $500K Salesforce + Data Cloud implementation"

**Find Skill Analysis:**
```
Scanning 44 skills...
Top matches:
1. presales-agent: 58/100
2. sales-enablement: 52/100
3. teqfocus-gtm: 45/100

📋 Best match is presales-agent (58% match), but it's designed for 
first-call prep, not full proposal writing.

I don't have a dedicated proposal-writing skill yet. I can:
1. Use presales-agent + sales-enablement together (80% coverage)
2. Build a new "proposal-creator" skill (5 mins, permanent solution)

Which would you prefer?
```

**Output:** Suggest building new skill if gap is significant.

---

## Integration with Skill Creator

When no skill matches, auto-trigger skill creator:

```python
if top_score < 40:
    print("🔧 Building new skill for this task...")
    print("I'll use the skill-creator to build a custom skill.")
    
    # Auto-generate skill spec
    new_skill_spec = {
        "name": "proposal-creator",
        "description": "Create comprehensive SOW/proposal documents",
        "triggers": ["proposal", "SOW", "statement of work"],
        "outputs": ["docx proposal with pricing, scope, timeline"],
        "references": ["presales-agent", "sales-enablement", "teqfocus-gtm"]
    }
    
    print(f"\nProposed skill: {new_skill_spec['name']}")
    print(f"Purpose: {new_skill_spec['description']}")
    print("\nProceed with creation? (This will take ~5 minutes)")
```

---

## Skill Library Health Monitoring

Track skill usage to identify gaps:

```python
import json
from datetime import datetime
from pathlib import Path

USAGE_LOG = Path('/home/claude/skill_usage_log.json')

def log_skill_usage(skill_name, user_query, success=True):
    """Track which skills are used most"""
    
    log = json.loads(USAGE_LOG.read_text()) if USAGE_LOG.exists() else {}
    
    if skill_name not in log:
        log[skill_name] = {
            "total_uses": 0,
            "success_rate": [],
            "common_queries": []
        }
    
    log[skill_name]["total_uses"] += 1
    log[skill_name]["success_rate"].append(success)
    log[skill_name]["common_queries"].append(user_query)
    
    USAGE_LOG.write_text(json.dumps(log, indent=2))

def skill_usage_report():
    """Generate skill usage report"""
    log = json.loads(USAGE_LOG.read_text())
    
    print("📊 Skill Usage Report (Last 30 Days)")
    print("="*50)
    
    # Sort by usage
    sorted_skills = sorted(log.items(), 
                          key=lambda x: x[1]["total_uses"], 
                          reverse=True)
    
    print("\nTop 10 Most-Used Skills:")
    for skill, data in sorted_skills[:10]:
        success_rate = sum(data["success_rate"]) / len(data["success_rate"]) * 100
        print(f"  {skill}: {data['total_uses']} uses ({success_rate:.0f}% success)")
    
    print("\n\nBottom 10 (Underutilized):")
    for skill, data in sorted_skills[-10:]:
        print(f"  {skill}: {data['total_uses']} uses")
        if data['total_uses'] == 0:
            print(f"    ⚠️  Never used - consider archiving or improving description")
```

---

## Natural Language Skill Search

Users can search skills conversationally:

**User:** "What do you have for customer research?"

**Find Skill:** Searches library and returns:
```
🔍 Found 3 skills related to "customer research":

1. customer-research (EXACT MATCH)
   → ICP research, persona development, VOC analysis, G2 mining
   
2. abm-intelligence 
   → Includes account research and buying group mapping
   
3. competitor-profiling
   → Research competitors before customer meetings

Want details on any of these?
```

---

## Skill Recommendations

Based on user patterns, suggest skills they might not know about:

```python
def recommend_skills(user_query_history):
    """Suggest skills user hasn't tried yet"""
    
    # User writes a lot of LinkedIn content
    if user_query_history.count("linkedin") > 5:
        if "linkedin-campaigns" not in user_query_history:
            print("\n💡 Did you know I have a linkedin-campaigns skill?")
            print("   It's optimized for LinkedIn-native content (vs generic posts)")
    
    # User does a lot of research
    if user_query_history.count("research") > 3:
        if "token-optimizer" not in user_query_history:
            print("\n💡 Try the token-optimizer skill for multi-source research")
            print("   It can analyze 20+ documents using 90% fewer tokens")
```

---

## Advanced: Multi-Skill Workflows

Some tasks need multiple skills chained:

**User:** "Prepare me for a first call with a new target account"

**Find Skill Analysis:**
```
This requires 3 skills in sequence:

1. abm-intelligence → Research the account
2. competitor-profiling → Understand their current vendor
3. presales-agent → Prep discovery questions and pitch

Execute all 3? (5-7 mins total)
```

**Auto-chain:** Load skills in sequence, pass output of one as input to next.

---

## Output Format

Always tell user which skill you selected and why:

```markdown
✓ **Skill Selected:** demand-gen (92% confidence match)

**Why this skill:** Your request for "email nurture sequence" maps to:
- Content type: Email sequences ✓
- Goal: Lead nurturing ✓
- Channel: Email marketing ✓

**Executing skill now...**

[Demand-gen skill output follows]
```

---

## Skill Metadata

**Token Cost:** Low (1,000–2,000 for library scan + selection)  
**Time Cost:** Low (<30 seconds to scan and select)  
**Output Type:** Skill selection + auto-execution  
**Best For:** First-time users, ambiguous requests, skill discovery  
**Dependencies:** Access to all skill SKILL.md files  
**Success Metric:** % of requests that auto-match vs. require disambiguation

---

## Changelog

**v1.0.0 (2026-05-18)**
- Initial release
- Semantic matching algorithm
- Auto-execution for high-confidence matches
- Disambiguation for close matches
- Integration with skill-creator for gaps
- Usage tracking and recommendations
