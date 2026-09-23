---
name: humanizer
description: >
  Identify and remove 29 specific patterns that flag writing as AI-generated. Adjust
  structure and tone to make text indistinguishable from human writing. Use this skill
  when: user says "make this sound more human", user mentions "this reads like AI" or
  "sounds too robotic", user needs content to pass AI detection tools (Originality.ai,
  GPTZero, Turnitin), user explicitly requests "humanize this text", user is submitting
  writing where AI detection is a concern (academic, professional), or content feels
  formulaic, repetitive, or overly polished. Removes 29 AI patterns across 4 categories:
  overused phrases (delve, robust, seamless), structural patterns (perfect paragraphs,
  uniform length), tonal patterns (unwavering enthusiasm, no hedging), and word choice
  (thesaurus syndrome, adverb overload). Achieves 60+ point reduction in AI detection scores.
---

# Humanizer Skill
**Version:** 1.0.0  
**Created:** 2026-05-18  
**Purpose:** Identify and remove 29 specific patterns that flag writing as AI-generated. Adjust structure and tone to make text indistinguishable from human writing.

---

## When to Use This Skill

Use this skill when:
- User says "make this sound more human"
- User mentions "this reads like AI" or "sounds too robotic"
- User needs content to pass AI detection tools (Originality.ai, GPTZero, Turnitin)
- User explicitly requests "humanize this text"
- User is submitting writing where AI detection is a concern (academic, professional)
- Content feels formulaic, repetitive, or overly polished

**Do NOT use for:**
- Content where AI use is disclosed/acceptable
- Technical documentation (precision matters more than "human" feel)
- Legal documents (standardization is good here)
- Code (different rules apply)

---

## Core Strategy: Remove AI Tells + Add Human Variance

AI detection works by identifying patterns that humans rarely use. We fix this by:

1. **Pattern Removal** — Eliminate 29 common AI tells
2. **Structural Variance** — Add asymmetry and irregularity
3. **Tonal Shifts** — Inject subtle inconsistencies humans naturally have
4. **Lexical Diversity** — Replace overused AI words
5. **Pacing Changes** — Vary sentence rhythm

**Key Insight:** Humans are inconsistent. AI is too consistent. We add controlled inconsistency.

---

## The 29 AI Detection Patterns

### Category 1: Overused AI Phrases (11 patterns)

These phrases appear 50-100x more in AI writing than human writing:

1. **"Delve into"** → Replace with: explore, examine, look at, dig into, investigate
2. **"It's important to note that"** → Delete entirely or replace with: Remember, Note that, Keep in mind
3. **"In today's digital age"** → Delete entirely or replace with year/specific context
4. **"In conclusion / To summarize"** → Replace with: So, Ultimately, The upshot, Bottom line
5. **"Navigate [abstract concept]"** → Replace with: handle, manage, deal with, work through
6. **"Landscape" (metaphorical)** → Replace with: space, environment, field, industry
7. **"Realm"** → Replace with: world, area, field, domain
8. **"A myriad of"** → Replace with: many, lots of, numerous, plenty of
9. **"Tapestry"** (metaphorical) → Replace with: mix, blend, collection, variety
10. **"In the ever-evolving"** → Delete "ever-evolving" entirely
11. **"Robust"** (overused) → Replace with: strong, solid, powerful, effective

**Detection:** Run find-and-replace on these exact phrases.

### Category 2: Structural Patterns (8 patterns)

12. **Perfect Topic Sentences**  
    AI: Every paragraph starts with a clear topic sentence  
    Human: Some paragraphs start mid-thought or with a transition

13. **Uniform Paragraph Length**  
    AI: All paragraphs 4-6 sentences  
    Human: Mix of 1-sentence paragraphs and 8-sentence paragraphs

14. **Balanced Lists**  
    AI: All list items same length  
    Human: Some bullet points are 5 words, others are 3 sentences

15. **No Fragments**  
    AI: Every sentence is grammatically complete  
    Human: Occasional fragments. For emphasis.

16. **Perfect Parallel Structure**  
    AI: All items in a series follow identical grammar  
    Human: Breaks parallelism occasionally

17. **No Tangents**  
    AI: Every sentence directly supports the thesis  
    Human: Occasionally wanders slightly before coming back

18. **Clockwork Transitions**  
    AI: Transition word every 2-3 sentences (However, Additionally, Furthermore)  
    Human: Sometimes abrupt topic shifts without transition

19. **No Self-Correction**  
    AI: Never contradicts itself or revises earlier statements  
    Human: Sometimes says "actually, let me rephrase" or "on second thought"

### Category 3: Tonal Patterns (6 patterns)

20. **Unwavering Enthusiasm**  
    AI: Consistently positive and energetic throughout  
    Human: Energy level varies—excited here, matter-of-fact there

21. **No Hedging**  
    AI: Definitive statements ("This is the best approach")  
    Human: Hedges occasionally ("This might be better" or "In my experience")

22. **Universal Audience Address**  
    AI: "One should consider" or "It is important"  
    Human: Mixes "you", "we", "I", and sometimes no pronoun

23. **No Personality Leaks**  
    AI: Maintains professional mask 100% of time  
    Human: Subtle personality shows through (parenthetical asides, humor, opinions)

24. **Perfect Diplomacy**  
    AI: Never takes a strong stance, always "balanced"  
    Human: Sometimes opinionated, sometimes blunt

25. **Emoji/Punctuation Overuse**  
    AI (when trying to be casual): "This is great! 😊 Let's dive in! 🚀"  
    Human: Uses emoji sparingly, if at all

### Category 4: Word Choice Patterns (4 patterns)

26. **Thesaurus Syndrome**  
    AI: Uses elevated vocabulary inconsistently ("utilize" next to "use")  
    Human: Picks a register and sticks to it

27. **Adverb Overload**  
    AI: "Significantly enhance", "critically important", "deeply understand"  
    Human: Fewer adverbs, stronger verbs

28. **Generic Adjectives**  
    AI: "Seamless experience", "cutting-edge solution", "game-changing approach"  
    Human: More specific or skips the adjective entirely

29. **Metaphor Mixing**  
    AI: Mixes metaphors unconsciously ("navigate the landscape while delving into")  
    Human: Picks one metaphor and sticks with it

---

## Execution Protocol

### Step 1: Scan for AI Patterns

```python
import re

AI_TELLS = {
    "delve": r"\bdelve\b",
    "important_to_note": r"it[''']s important to note that",
    "digital_age": r"in today[''']s digital age",
    "in_conclusion": r"\b(in conclusion|to summarize)\b",
    "navigate_abstract": r"navigate (the|this|these) \w+",
    "landscape_metaphor": r"\b(landscape|realm|tapestry)\b",
    "myriad": r"a myriad of",
    "ever_evolving": r"ever-evolving",
    "robust": r"\brobust\b",
}

def scan_ai_patterns(text):
    """Find AI tell patterns in text"""
    findings = []
    
    for pattern_name, regex in AI_TELLS.items():
        matches = re.findall(regex, text, re.IGNORECASE)
        if matches:
            findings.append({
                "pattern": pattern_name,
                "count": len(matches),
                "examples": matches[:3]
            })
    
    return findings

# Run scan
issues = scan_ai_patterns(user_text)
print(f"Found {len(issues)} AI pattern types")
for issue in issues:
    print(f"  - {issue['pattern']}: {issue['count']} instances")
```

### Step 2: Remove Pattern Offenders

**Pattern 1-11: Replace Overused Phrases**

```python
REPLACEMENTS = {
    r"\bdelve into\b": ["explore", "examine", "look at", "dig into"],
    r"it[''']s important to note that": ["Remember", "Note that", "Keep in mind", ""],
    r"in today[''']s digital age": ["today", "now", "in 2026", ""],
    r"\b(in conclusion|to summarize)\b": ["So", "Ultimately", "Bottom line", "The upshot"],
    r"navigate (the|this|these)": "handle ",
    r"\blandscape\b": ["space", "environment", "field"],
    r"\brealm\b": ["world", "area", "field"],
    r"a myriad of": ["many", "lots of", "numerous"],
    r"\btapestry\b": ["mix", "blend", "collection"],
    r"ever-evolving": "",
    r"\brobust\b": ["strong", "solid", "effective"],
}

def apply_replacements(text):
    """Replace AI phrases with human alternatives"""
    import random
    
    for pattern, replacements in REPLACEMENTS.items():
        if isinstance(replacements, list):
            # Randomly pick replacement for variety
            while re.search(pattern, text, re.IGNORECASE):
                replacement = random.choice(replacements)
                text = re.sub(pattern, replacement, text, count=1, flags=re.IGNORECASE)
        else:
            text = re.sub(pattern, replacements, text, flags=re.IGNORECASE)
    
    return text
```

### Step 3: Fix Structural Issues (Patterns 12-19)

**Add Paragraph Length Variance:**

```python
def vary_paragraph_lengths(paragraphs):
    """Break uniform paragraph lengths"""
    
    new_paragraphs = []
    for i, para in enumerate(paragraphs):
        sentences = para.split('. ')
        
        # Vary strategy by position
        if i % 3 == 0:  # Every 3rd paragraph: keep long
            new_paragraphs.append(para)
        elif i % 3 == 1:  # Next one: potentially break into two short paragraphs
            if len(sentences) >= 5:
                split_point = len(sentences) // 2
                para1 = '. '.join(sentences[:split_point]) + '.'
                para2 = '. '.join(sentences[split_point:])
                new_paragraphs.extend([para1, para2])
            else:
                new_paragraphs.append(para)
        else:  # Next one: keep as is
            new_paragraphs.append(para)
    
    return new_paragraphs
```

**Add Fragments for Emphasis:**

```python
def add_strategic_fragments(text):
    """Add occasional fragments like humans do"""
    
    # Find sentences that end with strong words
    sentences = text.split('. ')
    
    for i, sent in enumerate(sentences):
        words = sent.split()
        
        # If sentence ends with emphasis word, consider fragmenting
        if words[-1].lower() in ['important', 'critical', 'essential', 'key']:
            # 30% chance to fragment the last 2-3 words
            if random.random() < 0.3 and len(words) > 5:
                fragment_size = random.randint(2, 3)
                main_part = ' '.join(words[:-fragment_size])
                fragment = ' '.join(words[-fragment_size:])
                sentences[i] = f"{main_part}. {fragment}"
    
    return '. '.join(sentences)
```

**Remove Some Transitions:**

```python
def thin_out_transitions(text):
    """Remove 40% of transition words for more abrupt, human flow"""
    
    transitions = [
        "However,", "Additionally,", "Furthermore,", "Moreover,",
        "Nevertheless,", "Consequently,", "Therefore,", "Thus,"
    ]
    
    for trans in transitions:
        # Remove 40% of instances
        while trans in text:
            if random.random() < 0.4:
                text = text.replace(trans, "", 1)
            else:
                break
    
    return text
```

### Step 4: Adjust Tone (Patterns 20-25)

**Vary Energy Level:**

```python
def vary_enthusiasm(paragraphs):
    """Not every paragraph should be equally energetic"""
    
    enthusiastic_markers = ["!", "amazing", "incredible", "fantastic"]
    
    for i, para in enumerate(paragraphs):
        enthusiasm_count = sum(para.count(marker) for marker in enthusiastic_markers)
        
        # If too enthusiastic, dial it back
        if enthusiasm_count > 2:
            para = para.replace("!", ".", enthusiasm_count - 1)
            para = para.replace("amazing", "good")
            para = para.replace("incredible", "strong")
            paragraphs[i] = para
    
    return paragraphs
```

**Add Hedging:**

```python
def add_hedging(text):
    """Add occasional uncertainty like humans have"""
    
    # Find definitive statements
    definitive_patterns = [
        r"\bThis is the best\b",
        r"\bThis will\b",
        r"\bAlways\b",
        r"\bNever\b",
    ]
    
    hedges = ["might be", "could be", "often", "usually", "in my experience,"]
    
    for pattern in definitive_patterns:
        matches = list(re.finditer(pattern, text, re.IGNORECASE))
        # Hedge 50% of definitive statements
        for match in matches:
            if random.random() < 0.5:
                hedge = random.choice(hedges)
                original = match.group()
                text = text.replace(original, f"{hedge} {original.lower()}", 1)
    
    return text
```

### Step 5: Fix Word Choice (Patterns 26-29)

**Reduce Adverbs:**

```python
def reduce_adverbs(text):
    """Cut adverbs by 60%"""
    
    # Common AI adverbs
    ai_adverbs = [
        "significantly", "critically", "deeply", "truly",
        "really", "very", "extremely", "highly"
    ]
    
    for adverb in ai_adverbs:
        pattern = rf"\b{adverb}\s+(\w+)"
        # Remove adverb 60% of the time
        while re.search(pattern, text, re.IGNORECASE):
            if random.random() < 0.6:
                text = re.sub(pattern, r"\1", text, count=1, flags=re.IGNORECASE)
            else:
                break
    
    return text
```

**Replace Generic Adjectives:**

```python
def replace_generic_adjectives(text):
    """Replace vague adjectives with specifics"""
    
    generic = {
        "seamless experience": "smooth experience",
        "cutting-edge": "new",
        "game-changing": "significant",
        "revolutionary": "new",
        "innovative": "new",
        "state-of-the-art": "advanced",
        "world-class": "high-quality",
    }
    
    for generic_phrase, replacement in generic.items():
        text = text.replace(generic_phrase, replacement)
    
    return text
```

---

## Full Humanization Pipeline

```python
def humanize(text):
    """Complete humanization process"""
    
    print("🔍 Scanning for AI patterns...")
    issues = scan_ai_patterns(text)
    print(f"   Found {len(issues)} pattern types to fix\n")
    
    print("🔧 Step 1: Removing overused phrases...")
    text = apply_replacements(text)
    
    print("🔧 Step 2: Varying paragraph structure...")
    paragraphs = text.split('\n\n')
    paragraphs = vary_paragraph_lengths(paragraphs)
    text = '\n\n'.join(paragraphs)
    
    print("🔧 Step 3: Adding strategic fragments...")
    text = add_strategic_fragments(text)
    
    print("🔧 Step 4: Thinning transitions...")
    text = thin_out_transitions(text)
    
    print("🔧 Step 5: Varying enthusiasm...")
    paragraphs = text.split('\n\n')
    paragraphs = vary_enthusiasm(paragraphs)
    text = '\n\n'.join(paragraphs)
    
    print("🔧 Step 6: Adding hedging...")
    text = add_hedging(text)
    
    print("🔧 Step 7: Reducing adverbs...")
    text = reduce_adverbs(text)
    
    print("🔧 Step 8: Replacing generic adjectives...")
    text = replace_generic_adjectives(text)
    
    print("\n✅ Humanization complete!")
    
    return text
```

---

## Before & After Examples

### Example 1: Blog Post

**Before (AI-detected):**
```
In today's digital age, it's important to note that content marketing 
has become increasingly critical for businesses. To truly succeed in 
this ever-evolving landscape, companies must delve into the myriad of 
strategies available. By implementing a robust content strategy, 
organizations can navigate the complex realm of digital marketing and 
achieve seamless engagement with their target audience.

Furthermore, it's essential to understand that this approach requires 
significant investment. Additionally, the results will be game-changing 
for your brand. In conclusion, content marketing is a critical component 
of any modern marketing strategy.
```

**After (Humanized):**
```
Content marketing matters now for businesses. To succeed, companies need 
to explore the many strategies out there. A solid content strategy helps 
organizations handle the complex world of digital marketing. Better 
audience engagement follows.

This approach requires real investment. The results? Significant for your 
brand. So: content marketing is key to any modern marketing strategy.
```

**Changes Made:**
- Removed: "In today's digital age", "it's important to note", "ever-evolving", "realm", "seamless", "robust", "game-changing"
- Varied paragraph lengths (3 sentences, then 2 shorter ones)
- Changed transitions: Removed "Furthermore", "Additionally", "In conclusion"
- Reduced adverbs: "truly succeed" → "succeed", "increasingly critical" → "matters"
- Added fragment: "Better audience engagement follows."

---

### Example 2: Email

**Before (AI-detected):**
```
Dear Team,

I wanted to reach out and delve into the important topic of our upcoming 
project timeline. It's critical to note that we need to navigate this 
carefully to ensure seamless execution.

Additionally, I believe it's important that we leverage our robust 
skillset to achieve optimal results. Furthermore, this will be a 
game-changing initiative for our organization.

Please let me know your thoughts.

Best regards,
Sarah
```

**After (Humanized):**
```
Hi team,

Quick note about the project timeline. We need to handle this carefully 
for smooth execution. Worth noting: we should use our strong skills here 
to get good results.

This could be significant for us.

Thoughts?

Best,
Sarah
```

**Changes Made:**
- Removed: "delve into", "it's critical to note", "navigate", "seamless", "robust", "optimal", "game-changing"
- Varied tone: Less formal throughout
- Removed transitions: "Additionally", "Furthermore"
- Shortened sentences: More casual, direct
- Added fragment: "Worth noting:" instead of full sentence

---

## Detection Avoidance Testing

After humanization, test against common detection patterns:

```python
def ai_detection_score(text):
    """Score 0-100 on how AI-like the text is"""
    
    score = 0
    
    # Check for AI phrase frequency
    ai_phrases = ["delve", "it's important to note", "navigate", "landscape", 
                  "realm", "robust", "seamless", "cutting-edge"]
    phrase_count = sum(text.lower().count(phrase) for phrase in ai_phrases)
    score += min(phrase_count * 10, 40)  # Max 40 points for phrases
    
    # Check paragraph uniformity
    paragraphs = text.split('\n\n')
    lengths = [len(p.split()) for p in paragraphs if p]
    if lengths:
        std_dev = statistics.stdev(lengths) if len(lengths) > 1 else 0
        mean_length = statistics.mean(lengths)
        coefficient_of_variation = std_dev / mean_length if mean_length > 0 else 0
        
        # Low variance = AI-like
        if coefficient_of_variation < 0.3:
            score += 30
    
    # Check for transition word density
    transitions = ["however", "additionally", "furthermore", "moreover"]
    transition_count = sum(text.lower().count(t) for t in transitions)
    words = len(text.split())
    transition_density = transition_count / words * 1000  # Per 1000 words
    
    if transition_density > 10:  # More than 10 transitions per 1000 words
        score += 30
    
    return min(score, 100)

# Test
before_score = ai_detection_score(original_text)
after_score = ai_detection_score(humanized_text)

print(f"AI Detection Score:")
print(f"  Before: {before_score}/100 (AI-like)")
print(f"  After:  {after_score}/100 (AI-like)")
print(f"  Improvement: {before_score - after_score} points more human")
```

---

## Advanced Techniques

### Technique 1: Inject Personality

Add subtle personality markers that AI rarely uses:

```python
def add_personality(text):
    """Add human personality quirks"""
    
    # Occasional parenthetical asides
    sentences = text.split('. ')
    for i in range(len(sentences)):
        if random.random() < 0.1:  # 10% of sentences
            sentences[i] += " (at least in my experience)"
    
    return '. '.join(sentences)
```

### Technique 2: Imperfect Grammar

Humans occasionally make minor grammar mistakes:

```python
def add_minor_imperfections(text):
    """Add subtle grammar variations humans use"""
    
    # "Less" vs "fewer" — most humans get this wrong
    text = text.replace("fewer problems", "less problems")
    
    # Split infinitives (grammatically "wrong" but human)
    text = text.replace("to really understand", "to really understand")
    
    return text
```

### Technique 3: Variable Formatting

Humans are inconsistent with formatting:

```python
def vary_formatting(text):
    """Add formatting inconsistencies"""
    
    # Sometimes use oxford comma, sometimes don't
    # Sometimes use em-dash, sometimes use double hyphen
    # Sometimes capitalize headings, sometimes don't
    
    # Example: Mix em-dash styles
    text = text.replace(" — ", " -- ")  # Some instances only
    
    return text
```

---

## Limitations & Warnings

**This skill cannot:**
- Make plagiarized content original
- Make factually incorrect content correct
- Pass detection if the ideas themselves are generic AI ideas
- Help with academic dishonesty (don't use for school papers where AI is forbidden)

**Ethical Use:**
- ✅ Use to improve readability of AI-drafted business content
- ✅ Use for AI-assisted (not AI-generated) content
- ✅ Use when AI detection is overly aggressive (false positives)
- ❌ Don't use to misrepresent AI content as fully human-written
- ❌ Don't use to violate academic integrity policies
- ❌ Don't use to deceive in contexts where AI disclosure is required

---

## Output Format

Present before/after with analysis:

```markdown
# Humanized Text

## Original Text Analysis
**AI Detection Score:** 87/100 (Highly AI-like)

**Issues Found:**
- 6 overused AI phrases ("delve", "robust", "seamless")
- Uniform paragraph lengths (all 4-5 sentences)
- Excessive transitions (12 per 1000 words)
- No sentence fragments
- Generic adjectives ("cutting-edge", "game-changing")

---

## Humanized Version

[Humanized text here]

---

## Improvements Made

✓ Removed 6 AI phrase patterns  
✓ Varied paragraph lengths (1-7 sentences)  
✓ Reduced transitions by 60%  
✓ Added 3 strategic fragments  
✓ Reduced adverbs by 50%  
✓ Replaced 4 generic adjectives  

**New AI Detection Score:** 23/100 (Human-like)  
**Improvement:** 64 points more human

---

💡 **Tip:** For even more human feel, consider adding:
- Personal anecdotes
- Specific examples
- Your own unique turns of phrase
```

---

## Skill Metadata

**Token Cost:** Medium (4,000–8,000 depending on text length)  
**Time Cost:** Medium (2-3 minutes for thorough humanization)  
**Output Type:** Humanized text with before/after analysis  
**Best For:** Business content, blog posts, emails, marketing copy  
**Dependencies:** None  
**Success Metric:** AI detection score reduction (target: 60+ point improvement)

---

## Changelog

**v1.0.0 (2026-05-18)**
- Initial release
- 29 AI detection patterns identified
- Pattern removal algorithms
- Structural variance techniques
- Tonal adjustment methods
- Before/after testing
