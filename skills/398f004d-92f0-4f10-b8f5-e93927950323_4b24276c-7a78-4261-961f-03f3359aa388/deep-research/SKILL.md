---
name: deep-research
description: >
  Use multiple research agents working in parallel to compress weeks of market research
  into minutes. Analyze market size, profile competitors, identify gaps, and deliver
  comprehensive go-to-market intelligence. Use this skill when: user needs comprehensive
  market research, user asks "what's the market size for [X]?", user wants competitive
  landscape analysis, user mentions "market opportunity", "TAM/SAM/SOM", "competitive
  intelligence", user is evaluating entering a new market, user needs investor-grade
  market analysis, or user explicitly requests "deep research" or "market research".
  Deploys 5 parallel research agents: Market Sizing (TAM/SAM/SOM, CAGR), Competitive
  Intelligence (leaders, share, positioning), Customer Research (personas, pain points,
  buying process), Trends & Drivers (growth catalysts, headwinds, tech shifts), and
  Opportunity Gap (unmet needs, whitespace, entry points). Produces investor-grade reports
  in 15 minutes vs 75 minutes serial processing.
---

# Deep Research Skill
**Version:** 1.0.0  
**Created:** 2026-05-18  
**Purpose:** Use multiple research agents working in parallel to compress weeks of market research into minutes. Analyze market size, profile competitors, identify gaps, and deliver comprehensive go-to-market intelligence.

---

## When to Use This Skill

Use this skill when:
- User needs comprehensive market research
- User asks "what's the market size for [X]?"
- User wants competitive landscape analysis
- User mentions "market opportunity", "TAM/SAM/SOM", "competitive intelligence"
- User is evaluating entering a new market
- User needs investor-grade market analysis
- User explicitly requests "deep research" or "market research"

**Do NOT use for:**
- Single-source lookups (just use web_search)
- Quick fact-checking (use fact-checker skill)
- Product-specific details (use competitor-profiling skill)
- Opinion or prediction questions (this is factual research only)

---

## Core Strategy: Parallel Multi-Agent Research

Traditional research is serial: Research A → Wait → Research B → Wait → Synthesize.

Deep research is parallel: Launch 5 research threads simultaneously → Synthesize when all complete.

**Research Agents:**
1. **Market Sizing Agent** — TAM, SAM, SOM, growth rates
2. **Competitive Intelligence Agent** — Key players, market share, positioning
3. **Customer Research Agent** — Buyer personas, pain points, buying behavior
4. **Trends & Drivers Agent** — Market dynamics, technology shifts, regulations
5. **Opportunity Gap Agent** — Unmet needs, whitespace, entry points

**Time Savings:** 5 agents × 3 minutes each = 15 minutes total (vs 75 minutes serial)

---

## Execution Protocol

### Step 1: Research Brief

Extract research scope from user query:

```python
research_brief = {
    "market": "What market are we researching?",
    "geography": "Global / US / EU / APAC?",
    "segment": "B2B or B2C? SMB or Enterprise?",
    "depth": "Quick overview (30 min) or deep dive (2 hours)?",
    "use_case": "Why do you need this research?",
    "key_questions": ["Question 1", "Question 2", "Question 3"]
}
```

**If any field is unclear, ask before proceeding.** Bad brief = bad research.

### Step 2: Launch Parallel Research Agents

Each agent has a specific research mandate:

**Agent 1: Market Sizing**

```python
# Research mandate
market_sizing_queries = [
    f"{market} TAM SAM SOM market size",
    f"{market} global market size 2024 2025 2026",
    f"{market} revenue forecast CAGR growth rate",
    f"{market} addressable market total available",
    f"{market} market research report Gartner Forrester"
]

# Execute searches
for query in market_sizing_queries:
    results = web_search(query)
    # Extract market size data from results
    
# Synthesize findings
market_size_report = {
    "TAM": "$X billion (source)",
    "SAM": "$Y billion (source)",
    "SOM": "$Z billion (estimated)",
    "CAGR": "X% (2024-2030)",
    "sources": ["Gartner", "Forrester", "IDC"],
    "confidence": "High / Medium / Low"
}
```

**Agent 2: Competitive Intelligence**

```python
competitive_queries = [
    f"{market} top companies market leaders",
    f"{market} competitive landscape market share",
    f"{market} major players competitors",
    f"who dominates {market} industry leaders",
    f"{market} startup funding acquisitions"
]

# Execute and extract
competitive_report = {
    "leaders": [
        {"name": "Company A", "market_share": "X%", "positioning": "..."},
        {"name": "Company B", "market_share": "Y%", "positioning": "..."},
    ],
    "emerging_players": [...],
    "market_concentration": "Fragmented / Consolidated",
    "competitive_dynamics": "...",
}
```

**Agent 3: Customer Research**

```python
customer_queries = [
    f"{market} buyer persona customer profile",
    f"{market} customer pain points challenges",
    f"{market} buying process decision criteria",
    f"{market} customer reviews complaints feedback",
    f"why do customers buy {market}"
}

customer_report = {
    "buyer_personas": [
        {"title": "CIO", "pain_points": [...], "buying_criteria": [...]},
        {"title": "VP IT", "pain_points": [...], "buying_criteria": [...]},
    ],
    "buying_process": "...",
    "typical_deal_size": "...",
    "sales_cycle": "...",
}
```

**Agent 4: Trends & Drivers**

```python
trends_queries = [
    f"{market} trends 2024 2025 2026",
    f"{market} technology shifts innovations",
    f"{market} regulatory changes policy",
    f"what is driving {market} growth",
    f"{market} future outlook predictions"
}

trends_report = {
    "key_trends": [...],
    "growth_drivers": [...],
    "headwinds": [...],
    "technology_shifts": [...],
    "regulatory_landscape": [...],
}
```

**Agent 5: Opportunity Gap**

```python
gap_queries = [
    f"{market} unmet needs customer problems",
    f"{market} whitespace opportunities",
    f"what is missing in {market}",
    f"{market} startup opportunities gaps",
    f"{market} customer complaints dissatisfaction"
}

gap_report = {
    "unmet_needs": [...],
    "market_gaps": [...],
    "entry_opportunities": [...],
    "innovation_areas": [...],
}
```

### Step 3: Parallel Execution

Launch all agents simultaneously:

```python
import concurrent.futures

def run_agent(agent_func, queries):
    """Execute one research agent"""
    return agent_func(queries)

# Launch all agents in parallel
with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
    futures = {
        executor.submit(run_agent, market_sizing_agent, market_sizing_queries): "market_sizing",
        executor.submit(run_agent, competitive_agent, competitive_queries): "competitive",
        executor.submit(run_agent, customer_agent, customer_queries): "customer",
        executor.submit(run_agent, trends_agent, trends_queries): "trends",
        executor.submit(run_agent, gap_agent, gap_queries): "gap"
    }
    
    # Collect results as they complete
    results = {}
    for future in concurrent.futures.as_completed(futures):
        agent_name = futures[future]
        results[agent_name] = future.result()
        print(f"✓ {agent_name.title()} Agent complete")

print("\n✅ All agents complete. Synthesizing...")
```

**Timeline:**
- Agent 1: 3 minutes
- Agent 2: 3 minutes
- Agent 3: 3 minutes
- Agent 4: 3 minutes
- Agent 5: 3 minutes

**Total time:** ~3 minutes (parallel) vs ~15 minutes (serial)

### Step 4: Cross-Reference & Validate

Check for consistency across agents:

```python
def cross_reference(results):
    """Validate findings across agents"""
    
    # Check if competitive agent's market size matches market sizing agent
    competitive_tam = results['competitive'].get('total_market_size')
    sizing_tam = results['market_sizing']['TAM']
    
    if competitive_tam and abs(competitive_tam - sizing_tam) / sizing_tam > 0.3:
        # 30%+ discrepancy
        warnings.append(f"Market size discrepancy: {competitive_tam} vs {sizing_tam}")
    
    # Check if customer pain points match gap analysis
    customer_pains = set(results['customer']['pain_points'])
    gap_needs = set(results['gap']['unmet_needs'])
    
    overlap = customer_pains & gap_needs
    if len(overlap) / len(customer_pains) < 0.3:
        warnings.append("Customer pain points don't align with identified gaps")
    
    return warnings
```

### Step 5: Synthesize Master Report

Combine all agent findings into comprehensive report:

```python
def synthesize_master_report(results):
    """Create final research deliverable"""
    
    report = {
        "executive_summary": generate_executive_summary(results),
        "market_overview": {
            "size": results['market_sizing'],
            "growth": results['trends']['growth_drivers'],
            "maturity": classify_market_maturity(results)
        },
        "competitive_landscape": results['competitive'],
        "customer_intelligence": results['customer'],
        "trends_and_drivers": results['trends'],
        "opportunity_analysis": results['gap'],
        "recommendations": generate_recommendations(results),
        "data_quality": assess_data_quality(results)
    }
    
    return report
```

---

## Output Format

Present as investor-grade market research report:

```markdown
# Market Research Report: [Market Name]
**Date:** 2026-05-18  
**Research Depth:** Deep Dive  
**Geography:** Global  
**Segment:** B2B SaaS  

---

## Executive Summary

[3-4 paragraph synthesis of key findings]

**Key Takeaways:**
- TAM: $X billion, growing at Y% CAGR
- Market leader: [Company] with Z% share
- Primary buyer: [Persona] with [pain point]
- Key opportunity: [Unmet need]
- Recommendation: [Enter/Don't Enter + Strategy]

---

## 1. Market Sizing

### Total Addressable Market (TAM)
**$X billion** (2024)

**Sources:**
- Gartner: $X.Xb [Link]
- Forrester: $X.Xb [Link]
- IDC: $X.Xb [Link]

**Methodology:** [How TAM was calculated]

### Serviceable Addressable Market (SAM)
**$Y billion** (2024)

**Rationale:** [Why SAM is subset of TAM]

### Serviceable Obtainable Market (SOM)
**$Z billion** (Realistic capture)

**Assumptions:**
- X% market share achievable in 5 years
- Based on [comparable companies]

### Growth Projections

| Year | Market Size | YoY Growth |
|------|-------------|------------|
| 2024 | $X.Xb | — |
| 2025 | $X.Xb | +X% |
| 2026 | $X.Xb | +X% |
| 2030 | $X.Xb | +X% |

**CAGR (2024-2030):** X%

**Data Confidence:** ⭐⭐⭐⭐⭐ (5/5)  
Consistent across 3 tier-1 analyst firms

---

## 2. Competitive Landscape

### Market Leaders

**1. [Company A]**
- **Market Share:** X%
- **Revenue:** $Xb (2024)
- **Positioning:** [How they position]
- **Strengths:** [...]
- **Weaknesses:** [...]

**2. [Company B]**
[...]

### Market Structure
**Concentration:** [Consolidated / Fragmented]  
**Top 3 Market Share:** X%  
**Long Tail:** X companies with <5% share each

### Competitive Dynamics
[Analysis of how companies compete: price, product, distribution, brand]

### Recent M&A Activity
- [Acquisition 1]
- [Acquisition 2]
- [Trend]: [Consolidation / Vertical integration / etc]

---

## 3. Customer Intelligence

### Primary Buyer Personas

**Persona 1: [Title]**
- **Company Size:** [SMB / Mid-market / Enterprise]
- **Industry:** [Primary verticals]
- **Pain Points:**
  1. [Pain point 1]
  2. [Pain point 2]
  3. [Pain point 3]
- **Buying Criteria:**
  1. [Criterion 1]
  2. [Criterion 2]
- **Budget Authority:** [Yes/No/Influencer]

**Persona 2: [Title]**
[...]

### Buying Process

**Typical Timeline:** X months  
**Decision Committee:** [Titles involved]  
**Evaluation Criteria:**
1. [Criterion 1] (weight: X%)
2. [Criterion 2] (weight: X%)

**Average Deal Size:** $X  
**Contract Length:** X months/years

### Voice of Customer

**Common Complaints (from G2, Reddit, Forums):**
- "[Quote from real customer review]"
- "[Quote from real customer review]"

**Top Feature Requests:**
1. [Feature 1]
2. [Feature 2]

---

## 4. Trends & Market Drivers

### Key Trends

**1. [Trend Name]**
**Description:** [What's happening]  
**Impact:** [How it affects the market]  
**Timeline:** [Now / 1-2 years / 3-5 years]

**2. [Trend Name]**
[...]

### Growth Drivers
1. **[Driver 1]** — [Explanation]
2. **[Driver 2]** — [Explanation]

### Headwinds
1. **[Risk 1]** — [Explanation]
2. **[Risk 2]** — [Explanation]

### Technology Shifts
- [Tech shift 1] → [Impact on market]
- [Tech shift 2] → [Impact on market]

### Regulatory Landscape
[Key regulations, compliance requirements, policy changes]

---

## 5. Opportunity Analysis

### Unmet Customer Needs

**1. [Need 1]**
**Evidence:** [Customer quotes, review analysis, search trends]  
**Market Size:** $Xm (estimated)  
**Difficulty:** [Easy / Medium / Hard to solve]

**2. [Need 2]**
[...]

### Market Whitespace

**Gap 1: [Description]**
**Why Gap Exists:** [Incumbent limitations, technology constraints, etc]  
**Opportunity Size:** [Small / Medium / Large]

### Entry Points

**Route 1: [Strategy]**
**Pros:** [...]  
**Cons:** [...]  
**Capital Required:** $X  
**Time to Market:** X months

**Route 2: [Strategy]**
[...]

---

## 6. Strategic Recommendations

### Should You Enter This Market?

**Verdict:** ✅ YES / ⚠️ MAYBE / ❌ NO

**Rationale:**
[2-3 paragraph analysis supporting the verdict]

### Recommended Go-To-Market Strategy

**Phase 1 (0-6 months): [Strategy]**
- [Action item 1]
- [Action item 2]

**Phase 2 (6-18 months): [Strategy]**
- [Action item 1]
- [Action item 2]

**Phase 3 (18-36 months): [Strategy]**
- [Action item 1]
- [Action item 2]

### Critical Success Factors

1. **[Factor 1]** — [Why it's critical]
2. **[Factor 2]** — [Why it's critical]

### Key Risks to Monitor

1. **[Risk 1]** — [How to mitigate]
2. **[Risk 2]** — [How to mitigate]

---

## 7. Data Quality Assessment

**Overall Research Confidence:** ⭐⭐⭐⭐ (4/5)

| Dimension | Confidence | Notes |
|-----------|-----------|-------|
| Market Sizing | High | 3 tier-1 analyst sources |
| Competitive Intel | High | 10+ sources, recent data |
| Customer Research | Medium | Limited primary data, mostly secondary |
| Trends | High | Clear patterns across sources |
| Gaps | Medium | Inferred from customer complaints |

**Data Gaps:**
- [Gap 1: e.g., "No recent customer survey data"]
- [Gap 2: e.g., "Limited data on APAC market"]

**Recommended Follow-Up:**
- [Action 1: e.g., "Commission primary customer research"]
- [Action 2: e.g., "Interview 3 industry analysts"]

---

## Sources Consulted

**Tier 1 Analyst Reports (8):**
- Gartner: [Report name] (2024)
- Forrester: [Report name] (2024)
- IDC: [Report name] (2024)
[...]

**Company Research (15):**
- [Company A] website, investor deck, press releases
- [Company B] website, G2 reviews, Crunchbase
[...]

**Customer Intelligence (20+):**
- G2 reviews (200+ analyzed)
- Reddit r/[industry] (50+ threads)
- Industry forums [...]

**News & Analysis (30+):**
- TechCrunch, VentureBeat, Forbes, WSJ, FT [...]

**Total Sources:** 73  
**Search Queries Executed:** 85  
**Time Investment:** 15 minutes

---

*This research was compiled using parallel multi-agent research methodology. All findings are based on publicly available data as of 2026-05-18. Market sizes are estimates based on multiple sources. For investment-grade diligence, commission primary research.*
```

---

## Advanced Techniques

### Technique 1: Sentiment Analysis on Reviews

Extract sentiment from 100+ customer reviews:

```python
def analyze_review_sentiment(reviews):
    """Extract themes from customer reviews"""
    
    pain_points = Counter()
    feature_requests = Counter()
    
    for review in reviews:
        # Extract negative mentions (pain points)
        if review['rating'] <= 3:
            pain_points.update(extract_topics(review['text']))
        
        # Extract feature requests
        if "wish" in review['text'] or "need" in review['text']:
            feature_requests.update(extract_topics(review['text']))
    
    return {
        "top_complaints": pain_points.most_common(5),
        "top_requests": feature_requests.most_common(5)
    }
```

### Technique 2: Growth Trajectory Modeling

Project market growth with multiple scenarios:

```python
def model_growth_scenarios(base_size, base_cagr):
    """Project market size under different scenarios"""
    
    scenarios = {
        "bull": base_cagr * 1.5,  # 50% higher growth
        "base": base_cagr,
        "bear": base_cagr * 0.5,  # 50% lower growth
    }
    
    projections = {}
    for scenario, cagr in scenarios.items():
        projections[scenario] = []
        current_size = base_size
        for year in range(2024, 2031):
            projections[scenario].append({
                "year": year,
                "size": current_size
            })
            current_size *= (1 + cagr)
    
    return projections
```

### Technique 3: Competitive Positioning Map

Create 2×2 positioning map:

```python
def create_positioning_map(competitors):
    """Map competitors on 2 axes"""
    
    # Define axes
    x_axis = "Price: Low ←→ High"
    y_axis = "Features: Simple ←→ Complex"
    
    # Score each competitor
    positions = []
    for competitor in competitors:
        positions.append({
            "name": competitor['name'],
            "x": competitor['price_index'],  # 0-100
            "y": competitor['feature_index'],  # 0-100
        })
    
    # Identify whitespace
    whitespace = find_sparse_quadrants(positions)
    
    return {
        "positions": positions,
        "whitespace": whitespace
    }
```

---

## Integration with Other Skills

### With `abm-intelligence`
Research market → Identify target accounts → Research specific accounts

### With `campaign-designer`
Research market → Understand buyer → Design campaign for that buyer

### With `competitor-profiling`
Research market → Identify top 3 competitors → Deep-dive on each

### With `office-hours`
Research market → Validate if TAM is large enough for VC funding

---

## Time-Depth Trade-offs

**Quick Overview (15 minutes):**
- 3 agents (market sizing, competitive, customer)
- Top-level findings only
- Good for initial feasibility check

**Standard Deep Dive (30 minutes):**
- 5 agents (all)
- Comprehensive findings
- Good for go/no-go decisions

**Exhaustive Research (2 hours):**
- 5 agents × multiple rounds
- Primary source validation
- Good for investor presentations

---

## Limitations

**Cannot research:**
- Markets with no public data (classified, stealth mode)
- Future markets that don't exist yet (can only extrapolate trends)
- Local markets with no online presence
- B2G markets with procurement data behind paywalls

**When to get human help:**
- Need primary interviews (we can only do secondary research)
- Need proprietary analyst reports (we can't access paywalled content)
- Need financial due diligence (requires audit-level precision)
- Need legal/regulatory deep-dive (requires domain expertise)

---

## Skill Metadata

**Token Cost:** High (15,000–40,000 depending on depth)  
**Time Cost:** Medium-High (15-30 minutes for deep research)  
**Output Type:** Comprehensive market research report  
**Best For:** Market entry decisions, competitive intelligence, investor diligence  
**Dependencies:** web_search (required)  
**Success Metric:** Decision quality (did research lead to right go/no-go call?)

---

## Changelog

**v1.0.0 (2026-05-18)**
- Initial release
- 5-agent parallel research system
- Market sizing + competitive + customer + trends + gaps
- Cross-reference validation
- Investor-grade report template
- Data quality assessment
