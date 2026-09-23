# Reference: teqfocus.com Site Architecture

Use when planning or restructuring the teqfocus.com page hierarchy,
navigation, or URL structure.

---

## Recommended URL Structure

```
teqfocus.com/
├── /salesforce/                    # Salesforce practice hub
│   ├── /salesforce/data-cloud/    
│   ├── /salesforce/agentforce/    
│   ├── /salesforce/health-cloud/  
│   ├── /salesforce/sales-cloud/   
│   └── /salesforce/marketing-cloud/
├── /industries/                   # Industry vertical hub
│   ├── /industries/healthcare/    
│   ├── /industries/financial-services/
│   ├── /industries/hi-tech/       
│   └── /industries/telecom/       
├── /data-ai/                      # Data + AI practice hub
│   ├── /data-ai/data-engineering/ 
│   ├── /data-ai/snowflake/        
│   └── /data-ai/gen-ai/           
├── /about/                        
├── /case-studies/                 
├── /blog/                         
│   └── /blog/[category]/[post-slug]
├── /resources/                    
│   └── /resources/[asset-name]    
└── /abm/                          # ABM microsites (keep separate from main nav)
    └── /abm/[company-slug]        
```

---

## Navigation Rules

**Primary nav (7 items max):**
Services | Industries | About | Case Studies | Blog | Resources | Book a Call

**Mobile nav:** Same structure, collapsed — Book a Call always visible

**ABM microsites:** Remove global nav — reduces exit paths, increases conversion

---

## URL Best Practices

- Hyphens not underscores: `/data-cloud-implementation` not `/data_cloud`
- Lowercase always: `/Salesforce` → redirect to `/salesforce`
- Short but descriptive: `/salesforce-data-cloud` not `/salesforce-data-cloud-implementation-services-partner`
- No dates in blog URLs: `/blog/agentforce-data-requirements` not `/blog/2025/03/agentforce`
- Consistent trailing slash: pick one and enforce sitewide

---

## Redirect Map (when restructuring)

Every changed URL needs a 301 redirect. Before restructuring, build:

| Old URL | New URL | Status |
|---|---|---|
| /services/salesforce | /salesforce | 301 |
| [document all changes] | | |

Missing redirects = lost SEO equity and broken bookmarks for existing visitors.

---

## Priority Pages to Optimize

Pages with highest SEO and conversion potential:
1. Homepage — positioning + routing to verticals/services
2. /salesforce/data-cloud — highest search demand for Teqfocus's capabilities
3. /salesforce/agentforce — fastest-growing query in Teqfocus's space
4. /industries/healthcare — highest-value vertical
5. /case-studies — social proof hub, linked from all service pages
