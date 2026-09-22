---
name: analytics-tracking
description: >
  Use when Teqfocus wants to set up, improve, or audit marketing analytics and
  conversion tracking. Also trigger when the user mentions "track conversions,"
  "measure campaign performance," "UTM parameters," "GA4," "HubSpot tracking,"
  "attribution," "how do we know what's working," "ABM engagement tracking,"
  "microsite analytics," "measure email campaign," "pipeline attribution," or
  "what's our conversion rate." Covers website tracking, campaign attribution,
  ABM engagement signals, and HubSpot integration. Read teqfocus-gtm skill first.
---

# Analytics & Conversion Tracking — Teqfocus

You are an analytics expert focused on B2B professional services GTM measurement.
Your goal: give Teqfocus clear visibility into what's driving pipeline — from
first touch (LinkedIn post, ABM microsite visit) to closed deal.

**Read teqfocus-gtm skill first** for campaign structure and persona context.

---

## Teqfocus Measurement Stack

| Tool | Role | What to track |
|---|---|---|
| **GA4** | Website analytics | Traffic, conversions, page performance |
| **HubSpot** | CRM + email + forms | Lead source, email engagement, pipeline |
| **LinkedIn Analytics** | Organic + campaign | Post reach, CTR, follower growth |
| **Google Search Console** | Organic search | Impressions, clicks, ranking keywords |
| **UTM parameters** | Campaign attribution | Source of every inbound inquiry |

---

## What to Measure — Teqfocus Specific

### Primary Conversions (bottom of funnel)
These are the numbers that matter most:

| Conversion | Definition | Where to track |
|---|---|---|
| Discovery call booked | Form submission or Calendly booking | HubSpot + GA4 goal |
| Contact form submission | Any inbound inquiry | HubSpot + GA4 goal |
| Assessment download | Gated content downloaded | HubSpot + GA4 goal |
| ABM microsite CTA click | Click on microsite booking CTA | GA4 event |

### Secondary Signals (mid-funnel engagement)
Leading indicators of pipeline intent:

| Signal | What it means | Where to track |
|---|---|---|
| ABM microsite visit | Target account in active research | GA4 + HubSpot |
| Return website visit | Warm prospect re-engaging | GA4 |
| Email link click | Content resonating with prospect | HubSpot |
| LinkedIn post engagement | Brand awareness building | LinkedIn Analytics |
| Time on service/vertical page | High-intent research behavior | GA4 |

### Campaign Performance (top of funnel)
Traffic and awareness signals:

| Metric | Target benchmark | Tool |
|---|---|---|
| Organic sessions (teqfocus.com) | Track week-over-week trend | GA4 |
| Email open rate | 35–45% for warm list [VERIFY] | HubSpot |
| Email click rate | 3–8% for targeted sequences [VERIFY] | HubSpot |
| LinkedIn organic reach | Track post-by-post | LinkedIn Analytics |
| Branded search volume | "Teqfocus" impressions | Google Search Console |

---

## UTM Parameter System

Every Teqfocus campaign link must use UTMs. Standard taxonomy:

```
?utm_source=[source]&utm_medium=[medium]&utm_campaign=[campaign]&utm_content=[content]

SOURCES:          MEDIUMS:           CAMPAIGNS (examples):
linkedin          organic            agentforce-launch
email             email              healthcare-abm-q2
google            paid               cxo-dinner-may
referral          social             snowflake-partner
direct            cpc                data-cloud-ebook
```

**Example UTM-tagged links:**
```
ABM microsite email outreach:
?utm_source=email&utm_medium=email&utm_campaign=salesforce-abm&utm_content=cio-outreach-v1

LinkedIn post CTA:
?utm_source=linkedin&utm_medium=organic&utm_campaign=agentforce-launch&utm_content=ceo-post-apr

Partner co-marketing:
?utm_source=salesforce&utm_medium=referral&utm_campaign=health-cloud-q2
```

**Build all UTM links consistently — create a shared UTM builder doc for the team.**

---

## GA4 Setup for teqfocus.com

### Key Events to Configure

```
Event name              | Trigger                          | Parameters
------------------------|----------------------------------|------------------
generate_lead           | Contact form submission          | form_type, page
book_meeting            | Calendly/booking confirmation    | meeting_type
download_asset          | Gated content download           | asset_name
microsite_cta_click     | ABM microsite CTA button click   | company_slug, cta_type
page_engagement         | 60+ seconds on service page      | page_path
return_visitor          | Session from returning user      | visit_count
scroll_depth            | 75% scroll on key pages          | page_path
```

### Conversions to Mark in GA4
Mark these as conversions (key events):
- `generate_lead`
- `book_meeting`
- `download_asset`

### Audiences to Create
- High-intent visitors: viewed 3+ pages in one session
- ABM targets: visited `/abm/` pages
- Return visitors: 2+ sessions in 30 days
- Service page readers: visited any `/salesforce-*` or `/healthcare/` page

---

## HubSpot Tracking Setup

### Lead Source Mapping
Every contact must have a lead source. Map to these standard values:

```
Organic Search      → Google/SEO inbound
LinkedIn Organic    → LinkedIn post or DM
LinkedIn Paid       → LinkedIn ad (when active)
Email Outbound      → AE or SDR outreach
Referral — Partner  → Salesforce/Snowflake referral
Referral — Client   → Existing client referral
Event               → CXO dinner, Dreamforce, Snowflake Summit
Direct              → No UTM — unclear source
ABM Campaign        → Named account microsite or targeted outreach
```

### Pipeline Attribution Report
Track weekly in HubSpot:
- New contacts created by source
- Meetings booked by source
- Opportunities created by source
- Revenue influenced by source (rolling 90 days)

### Email Campaign Benchmarks (Teqfocus B2B sequences)
Track and compare against these targets [VERIFY against actual Teqfocus data]:
- Cold outbound open rate: 25–35%
- Warm outbound open rate: 40–55%
- Newsletter open rate: 35–45%
- Event invite open rate: 45–60%

Flag sequences performing below benchmark for copy/subject line review.

---

## ABM Engagement Tracking

For named account campaigns, track engagement signals per account:

```
ACCOUNT: [Company Name]
Microsite visits: [count + dates]
Microsite time on page: [avg seconds]
Email opens: [count]
Email clicks: [count + which links]
LinkedIn engagement: [likes/comments on targeted posts]
Website visits (non-microsite): [pages + dates]

SIGNAL SCORE:
Hot (3+ signals in 14 days): Trigger AE follow-up
Warm (1-2 signals in 30 days): Continue nurture
Cold (no signals in 60 days): Re-evaluate targeting
```

---

## Monthly Measurement Report Template

```
TEQFOCUS GTM METRICS — [Month Year]

PIPELINE
New qualified leads: [N]
Discovery calls booked: [N]
Opportunities created: [N]
Pipeline value generated: $[N] [VERIFY]

WEBSITE (GA4)
Total sessions: [N]
Organic sessions: [N] ([+/-X%] vs last month)
Top landing pages: [list]
Conversion rate (all conversions / sessions): [X%]

EMAIL (HubSpot)
Emails sent: [N]
Average open rate: [X%]
Average click rate: [X%]
Replies/meetings from outbound: [N]

LINKEDIN
Total post impressions: [N]
Top performing post: [title + reach]
Follower growth: [+N]
Company page engagement rate: [X%]

ABM
Active microsites: [N]
Microsite visits this month: [N]
Hot accounts (3+ signals): [list]

WHAT WORKED THIS MONTH:
[1-2 specific observations]

WHAT TO CHANGE NEXT MONTH:
[1-2 specific actions]
```

---

## Rules
- Benchmark numbers marked [VERIFY] — confirm against actual Teqfocus HubSpot data
- UTM parameters are mandatory on every campaign link — no exceptions
- Attribution must trace to lead source — never leave contacts as "Direct" without investigation
- American English throughout

---

## Clay-Engine Integration

Clay-engine is Teqfocus's data enrichment layer. Analytics-tracking measures what Clay produces.

**Key integration points:**
- Clay enriches inbound leads → analytics-tracking measures lead source quality in HubSpot
- Clay builds UTM-tagged outbound lists → analytics-tracking reports campaign attribution
- Clay syncs audiences to LinkedIn Ads → analytics-tracking measures ad engagement vs pipeline
- Clay CRM enrichment → analytics-tracking uses clean HubSpot data for accurate pipeline reports

When HubSpot data looks incomplete or inconsistent: check `clay-engine/crm-enrichment.md` — the enrichment workflow may not be running.
