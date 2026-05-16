# UX for AI — Greg Nudelman & Daria Kempka
## Complete Book Extraction: Actionable Insights for AI-Powered Interface Design

> **Source:** *UX for AI* by Greg Nudelman with Daria Kempka
> **Scope:** Full cover-to-cover extraction — 23 chapters + guest perspectives
> **Focus:** Design patterns, frameworks, heuristics, and rules for AI UX practitioners

---

## Table of Contents

1. [Core Mental Models & Frameworks](#1-core-mental-models--frameworks)
2. [Value Matrix — Replacing Accuracy Metrics](#2-value-matrix--replacing-accuracy-metrics)
3. [Digital Twin — AI System Framing](#3-digital-twin--ai-system-framing)
4. [Storyboarding for AI Projects](#4-storyboarding-for-ai-projects)
5. [LLM Design Patterns (7 Patterns)](#5-llm-design-patterns-7-patterns)
6. [Communicating AI Capabilities & Limitations](#6-communicating-ai-capabilities--limitations)
7. [Trust-Building in AI Interfaces](#7-trust-building-in-ai-interfaces)
8. [Error States & Uncertainty Communication](#8-error-states--uncertainty-communication)
9. [Onboarding Patterns for AI Tools](#9-onboarding-patterns-for-ai-tools)
10. [Conversational UI & Chatbot Design](#10-conversational-ui--chatbot-design)
11. [AI Copilot Patterns](#11-ai-copilot-patterns)
12. [AI-First Information Architecture](#12-ai-first-information-architecture)
13. [Dashboard & DOI Sort Algorithms](#13-dashboard--doi-sort-algorithms)
14. [Forecasting & Anomaly Detection UI](#14-forecasting--anomaly-detection-ui)
15. [Agentic AI UX](#15-agentic-ai-ux)
16. [Shorthand UX Design Notation](#16-shorthand-ux-design-notation)
17. [User Research for AI Products](#17-user-research-for-ai-products)
18. [RITE Methodology](#18-rite-methodology)
19. [Vision Prototyping](#19-vision-prototyping)
20. [AI Bias — Practical Guidance](#20-ai-bias--practical-guidance)
21. [AI Ethics Frameworks](#21-ai-ethics-frameworks)
22. [The New Normal AI-Inclusive UX Process](#22-the-new-normal-ai-inclusive-ux-process)
23. [Mental Model Alignment for AI Systems](#23-mental-model-alignment-for-ai-systems)
24. [Progressive Disclosure & Feedback Loops](#24-progressive-disclosure--feedback-loops)
25. [How AI Changes Traditional UX Patterns](#25-how-ai-changes-traditional-ux-patterns)

---

## 1. Core Mental Models & Frameworks

### The Three Pillars of AI Product Success
Every AI product depends on three pillars that must evolve together continuously:
- **UI** (user interface and UX design)
- **AI Model** (the underlying ML/predictive engine)
- **Data** (training data, live data, data quality)

**Rule:** Never iterate only one pillar. Poor UX on a great model = failure. Great UX on bad data = worse failure. All three must advance in lockstep.

### The "4-in-a-Box" Team Model
The optimal AI product team structure:
- Product Manager (PM)
- UX Designer
- Developer/Engineer
- Data Scientist / AI Specialist

**Rule:** UX must be present from day one — not brought in after the model is built. Retrospective UX on AI systems fails because the fundamental interactions are already locked.

### 85% AI Project Failure Rate
Per Gartner research, 85% of AI-driven projects fail to achieve desired outcomes. Root causes:
1. Unclear goals
2. Poor data quality
3. Insufficient expertise
4. Lack of user-centered design

**Implication for UX:** You are in the room to prevent failure, not to decorate a product.

### Boeing 737 Max Cautionary Case Study
The MCAS system caused two fatal crashes because:
- Pilots were not informed the system existed
- Pilots were not trained to override it
- The UI gave no feedback when MCAS was overriding pilot inputs

**Rule:** Hidden AI behavior that affects outcomes is not just bad UX — it is dangerous. Every AI action affecting user safety must be visible, interruptible, and overridable.

---

## 2. Value Matrix — Replacing Accuracy Metrics

### Why "AI Accuracy" Is Bullshit for UX
Data scientists measure model performance with accuracy, precision, recall, and F1 score. These metrics are meaningless to business stakeholders and to UX. A model that is "92% accurate" may be completely unacceptable if the 8% errors cause catastrophic outcomes.

### The Value Matrix Framework
A 2×2 grid mapping **AI Prediction** (Positive/Negative) against **Real-World Outcome** (Positive/Negative):

|                         | **AI Says: Positive** | **AI Says: Negative** |
|-------------------------|-----------------------|-----------------------|
| **Actually Positive**   | True Positive (TP)    | False Negative (FN)   |
| **Actually Negative**   | False Positive (FP)   | True Negative (TN)    |

For each cell, the Value Matrix asks: **What is the real-world cost and benefit of this outcome?**

### Four AI Model Archetypes (from Value Matrix analysis)

| Model Type       | Behaviour                         | When to Use                                        |
|------------------|-----------------------------------|----------------------------------------------------|
| **Accurate**     | Balanced FP/FN                    | When all errors cost roughly the same              |
| **Conservative** | Minimises False Positives         | When false alarms are costly (alert fatigue, fines)|
| **Aggressive**   | Minimises False Negatives         | When missing a real event is catastrophic          |
| **Balanced**     | Context-dependent threshold shift | When business can define acceptable error tradeoff |

### How to Build a Value Matrix (Step-by-Step)
1. List all four quadrant outcomes (TP, FP, FN, TN)
2. For each: assign a real-world business cost (£, lives, reputation, legal exposure)
3. For each: assign a real-world business benefit
4. Calculate net value per cell
5. Identify which error type (FP or FN) is more damaging
6. Select model type accordingly
7. Design UI to communicate that model's error tendency to users

**Rule:** Never accept "95% accuracy" as a success criterion without doing the Value Matrix first. The business question is always: "Which errors can we live with?"

### Communicating Model Choice in UI
- **Conservative model:** Show confidence thresholds. Explain why the system is "cautious." Provide manual override to catch missed events.
- **Aggressive model:** Show alert volume controls. Provide mechanisms to dismiss false positives quickly. Show "why triggered" explanation on every alert.
- **Accurate model:** Show overall confidence score. Allow users to drill into the basis for the prediction.

---

## 3. Digital Twin — AI System Framing

### What Is a Digital Twin (for UX Purposes)?
A **Digital Twin** is a model of a physical or operational system showing:
- **Inputs** → what data feeds the AI
- **AI Processing** → what the model does
- **Outputs/Predictions** → what the AI produces
- **Human Actions** → what the user does in response
- **Real-World Outcomes** → what actually happens as a result

**Rule:** Build the Digital Twin as a shared artefact at project start. It creates a common vocabulary between PM, UX, engineers, and data scientists before any design begins.

### Digital Twin Exercise (Run with the Team)
1. Draw a simple diagram: physical system → sensors/data → AI model → prediction → UI → user action → real-world outcome
2. Label every arrow with: "What data is being transferred?" and "Who/what is responsible for this step?"
3. Identify: Where does the AI make decisions without human awareness?
4. Mark: Which steps have the highest failure risk?
5. Design UI interventions at each high-risk AI decision point

### Why Digital Twin Matters for UX
- Forces the team to name the AI's role explicitly
- Reveals hidden AI decisions that need transparency
- Shows where human oversight must be designed in
- Identifies feedback loops: does the system learn from human corrections?

---

## 4. Storyboarding for AI Projects

### Six Required Components of an AI Storyboard
Every AI storyboard must include all six:

1. **Establishing Shot** — Context: who is the user, what environment are they in, what is the situation?
2. **Things** — The physical or digital objects involved (devices, equipment, data, interfaces)
3. **People** — All stakeholders who interact with the system (not just the primary user)
4. **Faces** — Emotional expressions; show what the user feels at each stage
5. **Transitions** — How the story moves from one state to the next (see types below)
6. **Conclusion** — The end state: what value was delivered? What changed?

### Transition Types in AI Storyboards
Standard UX transitions:
- **Action-to-Action** — User takes action A, which leads to action B
- **Action-to-Result** — User takes action, system produces result

New AI-specific transition type:
- **Subject-to-AI** — The physical subject (e.g. a pipe, a patient, a field) is analysed by an AI system, producing a prediction or classification. The transition shows the AI "reading" the real world.

**Rule:** Every AI storyboard must include at least one Subject-to-AI transition — this is where AI adds unique value and where user mental models are most likely to break.

### Storyboarding Best Practices for AI
- Use hand-drawn sketches, not polished Figma frames — rough drawings invite critique
- Each frame = one step in the user's journey
- Annotate each frame with the AI's role: "AI predicts X here," "AI recommends Y here"
- Include the "AI fails" scenario as a required storyboard branch
- Conclusion frame must show tangible value — not just a dashboard, but what changed in the real world

---

## 5. LLM Design Patterns (7 Patterns)

The seven foundational patterns for designing LLM-powered interfaces, applicable to any conversational, generative, or AI-assisted product.

### Pattern 1: Restating
**What:** The AI rephrases or summarises the user's input before responding.
**Why:** Builds trust by showing the AI understood the request. Reduces hallucination risk by exposing misinterpretation early.
**Design rule:** Always show the AI's interpretation of ambiguous queries. Add an "Edit interpretation" affordance for users to correct misunderstandings before the AI proceeds.

### Pattern 2: Autocomplete
**What:** The AI predicts and suggests the completion of a user's in-progress input.
**Why:** Reduces cognitive load, speeds task completion, surfaces options users may not know exist.
**Design rules:**
- Autocomplete suggestions must appear within 200ms or feel broken
- Show 2-3 completions maximum; more creates choice paralysis
- Differentiate AI suggestions visually from user-typed text (greyed out, italic, different colour)
- Allow Tab key to accept; Escape to dismiss; never auto-accept without user confirmation

### Pattern 3: Talk-Back
**What:** The AI provides a natural-language narrative explanation of what it found or did.
**Why:** Translates AI outputs (numbers, classifications, predictions) into human-readable meaning.
**Design rules:**
- Talk-back must lead with the conclusion ("You have 3 critical alerts today"), not the methodology
- Keep talk-back to 2-3 sentences maximum before offering "Learn more"
- Use first-person AI voice consistently ("I found…", "I recommend…")
- Tie talk-back to specific data points; never generate vague summaries

### Pattern 4: Initial Suggestions
**What:** The AI proactively offers starting points before the user has entered any query.
**Why:** Addresses the "blank canvas problem" — users often don't know how to start with AI tools.
**Design rules:**
- Provide 3-5 curated suggestions based on user role, history, or context
- Label them as "suggestions" not "results" — these are starting points, not answers
- Include a variety of suggestion types (operational, strategic, exploratory)
- Refresh suggestions periodically to avoid staleness

### Pattern 5: Next Steps
**What:** After completing a task or showing a result, the AI proposes logical follow-on actions.
**Why:** Keeps users in a productive flow state; surfaces capabilities they may not discover independently.
**Design rules:**
- Show Next Steps as a secondary action area, not the primary CTA
- Limit to 3 next steps — more creates decision paralysis
- Next Steps must be contextually relevant to what just happened
- Each Next Step should have a one-sentence explanation of why it's recommended

### Pattern 6: Regen Tweaks
**What:** Controls that allow users to regenerate AI output with specific adjustments (tone, length, style, focus, specificity).
**Why:** Users rarely accept first-draft AI output; iteration is the norm.
**Design rules:**
- Provide explicit sliders or toggles for the dimensions users care about: length (shorter/longer), tone (formal/casual), detail level (summary/detailed), focus (broad/specific)
- Always show a "Regenerate" button prominently after any AI output
- Preserve the original output until the user explicitly replaces it — never auto-replace
- Show a diff view or before/after comparison when users regenerate

### Pattern 7: Guardrails
**What:** Boundaries that prevent the AI from producing dangerous, off-topic, harmful, or legally problematic outputs.
**Why:** LLMs will generate whatever they are asked if not constrained. Guardrails are a UX responsibility, not just a technical one.
**Design rules:**
- Show guardrail messaging in plain language when they activate: "I can't help with that because…"
- Offer alternative paths when guardrails block a user's legitimate intent
- Never show raw error codes or model-level refusal messages to end users
- Test guardrails adversarially: users WILL attempt to bypass them; design for graceful handling
- Document guardrail boundaries in onboarding so users are not surprised
- Guardrails must be consistent — same query must always produce same guardrail response

---

## 6. Communicating AI Capabilities & Limitations

### The Capability Communication Problem
Users form wrong mental models of AI in two directions:
1. **Over-trust:** "The AI is always right" → they stop thinking critically
2. **Under-trust:** "The AI is just making stuff up" → they ignore valuable outputs

Both failure modes create bad outcomes. UX must calibrate user expectations precisely.

### Rules for Communicating Capabilities
- State the AI's domain of competence explicitly at onboarding: "I analyse [X type of data] to [do Y]"
- Show examples of good and bad prompts during onboarding
- Differentiate AI-generated content from verified data with clear visual treatment
- Never claim higher capability than the AI actually has — overclaiming destroys trust permanently
- Show the AI's knowledge cutoff date or data freshness prominently

### Rules for Communicating Limitations
- Use plain language: "I work best with structured data — I may struggle with informal notes"
- Show confidence scores where meaningful — but explain what they mean
- Distinguish between "I don't know" and "I found nothing" — these are different answers
- Provide an "I'm not sure — verify this" indicator for low-confidence outputs
- Never hide uncertainty — users would rather know the AI is uncertain than discover it was wrong

### The "AI vs. Expert" Framing Problem
AI is often presented as replacing human expertise. Users resist this. Better framing:
- **Wrong:** "The AI knows better than your team"
- **Right:** "The AI surfaces patterns your team would take days to find manually"

**Rule:** Always position AI as augmenting human judgment, not replacing it. This framing increases adoption and is usually more accurate.

---

## 7. Trust-Building in AI Interfaces

### The Five Trust Dimensions (AI Humanifesto)
1. **Reliability & Consistency** — AI performs as expected every time; no random behaviour
2. **Ownership of Mistakes** — System acknowledges when errors occur; doesn't hide failures
3. **Data Responsibility** — Clear explanation of how data is captured, stored, shared, used
4. **Collaboration & Openness** — System actively incorporates user feedback
5. **Accountability** — Users have a path to address grievances when AI decisions harm them

### Trust-Building Design Rules
- **Show your work:** Display the basis for every AI recommendation (which data, which pattern)
- **Make confidence visible:** Always show a confidence indicator alongside AI predictions
- **Acknowledge uncertainty first:** Lead with limitations, not capabilities, in first-time use
- **Provide audit trails:** Users must be able to see the history of AI decisions and their outcomes
- **Consistency is non-negotiable:** Same input must produce same output (within acceptable variation). Inconsistent AI destroys trust faster than incorrect AI.
- **Human override always available:** Every AI decision must have a manual override. No exceptions.
- **Explainable by default:** "Why did the AI recommend this?" must always have an answer available

### Progressive Trust Building Pattern
Trust cannot be established in a single interaction. Design for a trust journey:
1. **First use:** Show small, verifiable AI wins. Let user confirm the AI is correct.
2. **Early use:** Gradually show more complex predictions. Explain reasoning.
3. **Established use:** Allow user to delegate more to AI based on earned trust.
4. **Expert use:** AI operates autonomously in defined zones; user monitors rather than approves every decision.

### Trust Destruction Patterns (Avoid These)
- AI contradicts itself across sessions without explanation
- AI presents uncertain outputs with false confidence
- AI makes errors silently and continues as if nothing happened
- AI cannot explain why it made a recommendation
- User discovers the AI was using their data in a way they didn't consent to

---

## 8. Error States & Uncertainty Communication

### AI Error Taxonomy
Four distinct error types, each requiring different UX treatment:

**1. Data Errors** — The input data is missing, corrupted, or out of range
- UI pattern: Show data quality indicator at input; flag the problematic data point specifically
- Message template: "I couldn't process [X] because the data appears incomplete. Check [specific field]."

**2. Model Confidence Errors** — The AI processed the data but is uncertain about the output
- UI pattern: Show confidence interval or probability range rather than point estimate
- Message template: "I'm not confident about this prediction. The data suggests [range], but there may be factors I'm not seeing."

**3. Guardrail Errors** — The request exceeds defined system boundaries
- UI pattern: Clear, friendly explanation of what the AI can't do; offer alternative
- Message template: "I'm not able to [X] in this context. I can help you [alternative]."

**4. Hallucination Errors** — The AI produces plausible-sounding but factually incorrect output
- UI pattern: Mandatory "verify this" flag on any AI output that cannot be cross-referenced against source data
- Design rule: Never present hallucination-prone outputs (free-form text, summaries) with the same confidence styling as data-grounded outputs

### The Uncertainty Communication Framework
Three levels of uncertainty, each with a distinct visual treatment:

| Confidence Level | Visual Treatment | Language Used |
|-----------------|-----------------|---------------|
| **High (>80%)** | Solid colour, no qualifier | "The analysis shows…" |
| **Medium (40-80%)** | Lighter shade, subtle indicator | "The data suggests…" |
| **Low (<40%)** | Greyed out, warning icon | "Preliminary indication only — verify before acting" |

### Forecasting Error Visualisation (Specific Rules)
- Show **confidence interval as a cone** that widens as time horizon extends
- Use **dashed line** for predicted future values; solid line for historical data
- Add a **"now" vertical line** as an explicit present-moment anchor
- For anomaly detection: annotate anomalous points directly on the chart with a brief explanation
- Never show a forecast without showing the historical baseline alongside it
- Never present a forecast as precise when the model uncertainty is high

### Error State Copy Rules
- Never show raw model error codes to end users
- Never say "AI failed" — say what specifically did not work and what the user can do
- Always offer at least one recovery path from every error state
- Keep error messages under 30 words; link to more detail for users who want it

---

## 9. Onboarding Patterns for AI Tools

### The Blank Canvas Problem
AI tools present an especially severe version of the onboarding problem: users don't know what to ask, what the AI can do, or what "good" looks like. Unlike traditional software with clear workflows, AI tools have open-ended interaction models that users must discover.

### Four Onboarding Anti-Patterns to Avoid
1. **The Feature Dump:** Explaining every capability in a tour. Users don't retain any of it.
2. **The Empty State:** Showing a blank input field with no guidance. Users are paralysed.
3. **The Over-Promise:** Setting capability expectations the AI cannot meet. Creates immediate disillusionment.
4. **The Assumption:** Assuming users understand how LLMs or ML models work. Most don't.

### Effective AI Onboarding Rules
- **Start with a use case, not a feature tour.** Lead with: "Here's what you can do with this." Show a completed example.
- **Provide curated starter prompts.** 3-5 pre-built queries that demonstrate the AI's best capabilities. These reduce blank-canvas anxiety.
- **Define the AI's domain explicitly.** "This AI analyses [data type X] to help you [outcome Y]. It works best when you [behaviour Z]."
- **Set guardrail expectations early.** Tell users what the AI won't do before they hit a guardrail mid-task.
- **Show a real output before asking for real input.** A brief demo or animation of the AI producing a result establishes the mental model.
- **Let users observe before they act.** Progressive onboarding: watch → guided practice → independent use.

### Promptbooks (SaaS Copilot Specific)
For B2B SaaS copilots, **promptbooks** are pre-configured prompt templates relevant to the user's role:
- Organised by job function (analyst, operations, manager, etc.)
- Each prompt shows expected output type
- Allow users to customise and save their own promptbooks
- Surface promptbooks in the copilot UI as a starting point for sessions

---

## 10. Conversational UI & Chatbot Design

### The Spectrum of Conversational AI Interfaces
Not all chatbots are the same. The design approach varies by position on this spectrum:

| Type | Interaction Model | Design Priority |
|------|-------------------|-----------------|
| **Task Bot** | Narrow, structured dialogue; linear flows | Completion rate, error recovery |
| **Q&A Bot** | Open question-answer; knowledge retrieval | Answer quality, confidence display |
| **Generative Copilot** | Open-ended, creative, iterative | Regen tweaks, quality control, iteration speed |
| **Agentic Bot** | Multi-step autonomous task execution | Transparency, human-in-the-loop, reversibility |

### Conversational UI Design Rules

**Context & Memory**
- Stateful conversations are table stakes. Never forget context within a session.
- Show users what the AI "remembers" from earlier in the conversation
- Provide an explicit "Start over / Clear context" affordance
- For SaaS copilots: state must persist across sessions (this requires fine-tuned models, not generic LLMs)

**Turn Design**
- Keep AI responses scannable: bullet points, headers, short paragraphs
- Lead every AI response with the answer/conclusion, then explanation
- Avoid walls of text — a 3-paragraph AI response should be reformatted as 3 short paragraphs with a TL;DR at top
- Use progressive disclosure: short answer first, "Show more" for detail

**Input Design**
- Provide input length guidance (character count, complexity hint)
- Show autocomplete suggestions (Pattern 2)
- Allow voice input where relevant
- Display a typing indicator while AI is processing — silence = broken to users

**Error Recovery in Conversation**
- When AI misunderstands, surface the misunderstanding explicitly (Restating pattern)
- Provide quick rephrase suggestions when a query fails
- Never make the user start the conversation over to fix a misunderstanding

**The Conversational Safety Net**
Every chatbot must have:
- Clear scope statement ("I can help you with…")
- Graceful off-topic handling ("That's outside what I can help with — try…")
- Escalation path to human support
- "I don't know" response that doesn't pretend certainty

---

## 11. AI Copilot Patterns

### Three Copilot Layout Archetypes

| Layout | Screen Real Estate | Use When |
|--------|-------------------|----------|
| **Side Panel** | 25-35% of screen | Copilot is supplementary to primary task; user needs both simultaneously |
| **Large Overlay** | 50-70% of screen | Copilot interaction IS the task; primary content is reference only |
| **Full Page** | 100% of screen | Copilot IS the primary interface; no competing content |

**Rule:** The more important the AI task is relative to the primary task, the more screen real estate the copilot should occupy.

### SaaS Copilot Requirements
A copilot embedded in enterprise SaaS has specific requirements beyond consumer chatbots:
1. **Stateful** — Must remember context across sessions, not just within them
2. **Fine-tuned model** — Generic LLM is insufficient; model must be trained on domain-specific data and terminology
3. **Live data integration via plug-ins** — Must access real-time data (not just training data) to be useful in operational contexts
4. **Promptbooks** — Pre-configured prompt templates for common tasks by user role
5. **Audit trail** — Every AI recommendation must be logged with the data it was based on

### Copilot Interaction Design Rules
- Copilot panel should open/close without disrupting primary workflow
- Copilot output should be directly actionable — include "Apply this recommendation" buttons
- Show source data for every recommendation ("Based on your last 30 days of data…")
- Provide feedback mechanism on every response ("Was this helpful? Yes / No / Why not")
- Allow users to copy, share, and export copilot outputs without leaving the panel

---

## 12. AI-First Information Architecture

### Traditional IA vs. AI-First IA

**Traditional IA:** Browse → Filter → Find → Act
**AI-First IA:** Ask or Get Shown → Understand → Act → Refine

The AI-first IA shifts the primary navigation model from browsing to AI-driven surfacing. Users should rarely need to navigate to find answers — the AI brings relevant information to them.

### The Five Pages of AI-First IA
Framework applied to any AI-enhanced analytical product:

**1. Analysis Overview (AI Landing Page)**
- AI-generated narrative summary of current state ("Your top 3 issues today are…")
- Key metric cards with trend indicators
- Anomaly highlights surfaced by AI automatically
- Recommended next actions (Pattern 5: Next Steps)

**2. Category Analysis Page**
- Drill-down from overview to specific category/segment
- AI-generated summary of this category's performance
- Comparative context ("This category is 23% above baseline")
- LLM search bar pre-seeded with relevant category queries

**3. LLM Search Results Page**
- Natural language query results
- AI restatement of the query (Pattern 1)
- Results grouped by relevance, not just recency
- Confidence indicator on each result
- "Refine this search" affordances

**4. Item Detail Page**
- Full item view with AI-generated narrative
- Contextualised Q&A about this specific item
- Next Steps specific to this item
- Related items surfaced by AI ("You may also want to look at…")

**5. Maintenance / Empty State Pages**
- System status when AI is processing, unavailable, or data is absent
- Progress indicators for long-running AI tasks
- Estimated completion time
- Graceful degradation: show last known state when AI is unavailable

### Amazon.com AI Redesign Case Study
Applied the 5-page AI-first IA to a redesigned Amazon product category:
- Overview page: AI narrative summarising category trends
- Category analysis: LLM summary of product performance by subcategory
- LLM Search: Natural language queries replacing keyword search
- Item Detail: AI-generated product summary + contextualised Q&A
- Hero image position determined by DOI sort algorithm

**Key insight:** DOI (Degree of Interest) sort algorithms should replace alphabetical or date-ordered listing in AI-first IA. Show users what is most relevant to them, not what is most conventional.

---

## 13. Dashboard & DOI Sort Algorithms

### Static vs. Dynamic Dashboards

| Dashboard Type | Ordering Logic | Risk |
|----------------|---------------|------|
| **Static** | Fixed position; same for all users | Users stop seeing items in fixed positions ("banner blindness") |
| **Rule-based Dynamic** | Threshold rules: "If X > Y, move to top" | Gaming; brittle; requires constant rule maintenance |
| **AI-Driven DOI Sort** | Degree of Interest algorithm: weighted multi-factor relevance | Requires thoughtful design to avoid bias and filter bubbles |

### DOI (Degree of Interest) Sort Algorithm Design
A DOI sort ranks dashboard items based on relevance to the current user. Key design decisions:

**Factors to consider weighting:**
- User role and permission level
- Historical interaction (what has this user acted on before?)
- Recency and trend direction (getting better or worse?)
- Severity (critical vs. informational)
- Time sensitivity (expires soon vs. long-term)

**Rules for DOI sort UI:**
- Show users why items are ranked where they are ("Priority because: 3 new events today")
- Provide a manual override: allow users to pin, hide, or reorder items
- Show what changed since last visit ("2 new items appeared since your last session")
- Never let the sort become a black box — users must understand why things are ordered as they are

### Trending Algorithms
A specific type of DOI sort:
- Calculate the rate of change, not just current value
- Show velocity indicators ("up 15% in last 24 hours" is more actionable than a raw number)
- Differentiate between "high and rising" vs "high but falling"
- Display the trend window ("trending over 7 days")

### Bias Risks in DOI/Trending Algorithms
- **Survivor bias:** Items that never appear in the data are never surfaced — design explicit "new and untracked" categories
- **Feedback loop bias:** The algorithm shows what users clicked before → users only see familiar items → they never discover new insights
- **Recency bias:** Recent items over-weighted against persistent important items

**Rule:** Every AI sort algorithm must have a manual override and a "show all" mode. Do not trap users in an algorithmic filter bubble.

---

## 14. Forecasting & Anomaly Detection UI

### Forecasting UI Rules

**Visual Components Required:**
- **Solid line:** Historical actual data
- **Vertical "now" line:** Explicit present-moment anchor
- **Dashed line:** Forecast (predicted future values)
- **Confidence interval cone:** Widening band showing increasing uncertainty as time horizon extends
- **Seasonality overlay:** Show recurring patterns (weekly, monthly, annual cycles) separately from the forecast line

**Design Rules:**
- Never show a point estimate for a forecast — always show a range (confidence interval)
- The confidence interval cone must widen as it extends into the future — a parallel-sided forecast band is dishonest
- Show the model type being used (linear regression, nonlinear, seasonal decomposition) — this sets appropriate expectations
- Provide a "Forecast horizon" control — let users choose 7 days, 30 days, 90 days
- Show accuracy of previous forecasts ("This forecast type was 87% accurate over the past 6 months")

**Regression Types and When to Surface Them:**
- **Linear regression:** Consistent trends; safe to show as a simple line
- **Nonlinear (polynomial) regression:** Accelerating or decelerating trends; must communicate the curve shape
- **Seasonal decomposition:** Recurring patterns; must show seasonal component separately

### Anomaly Detection UI Design

**Four Anomaly Types (Require Different Visual Treatment):**

| Anomaly Type | What It Is | Visual Treatment |
|-------------|-----------|------------------|
| **Point Anomaly** | Single data point far outside normal range | Circle/dot callout annotation directly on chart |
| **Change Point Anomaly** | Sudden shift in the level or trend of the series | Vertical line annotation at the change point |
| **Contextual Anomaly** | Normal value at wrong time (e.g., high sales on a Tuesday vs. always high on Friday) | Highlighted segment with contextual label |
| **Curve Shape Anomaly** | Pattern of values that deviates from expected shape | Shaded region with "pattern change" label |

**Anomaly Detection Rules:**
- Always annotate anomalies directly on the chart — never in a separate list that users must cross-reference
- Show the severity of each anomaly (minor variance vs. statistically significant)
- Provide a brief explanation with each anomaly: "This value is 4.2 standard deviations above the 30-day average"
- Allow users to dismiss false positive anomalies and train the system ("This is expected — mark as normal")
- Show the false positive rate of the anomaly detector in the settings or help text

---

## 15. Agentic AI UX

### What Agentic AI Means for UX
Traditional AI: user asks → AI responds → user acts
Agentic AI: user sets goal → AI plans → AI executes multiple steps autonomously → delivers result

The shift to agentic AI changes the fundamental UX paradigm from synchronous (request/response) to asynchronous (goal-setting/monitoring).

### Supervisor Agent + Worker Agent Architecture
Multi-agent systems for complex tasks use:
- **Supervisor Agent:** Interprets user goal; decomposes it into sub-tasks; coordinates worker agents; synthesises final output
- **Worker Agents:** Specialised agents handling specific sub-tasks (data retrieval, analysis, writing, code execution)

**UX rule:** Show users both levels. The supervisor's plan (which tasks are happening) and the workers' progress (how each task is going) must both be visible.

### Agentic AI UX Design Principles

**1. Asynchronous Workflow Design**
- Users submit a goal and come back — the agent works in the background
- Show clear status: queued → in progress → needs review → complete
- Provide email/push notifications when human review is required
- Never show a loading spinner for multi-minute tasks — use status dashboards

**2. Flexible / Adjustable UI**
- Users must be able to modify the agent's plan mid-execution
- Show the plan as a checklist of steps — allow items to be added, removed, reordered
- Provide "pause" and "cancel" as always-visible controls
- Show completed steps with their outputs before user approves continuation

**3. Human-in-the-Loop Gates**
- Define explicitly which decision points require human approval before the agent continues
- Show these gates clearly in the plan view: "Step 4: Requires your approval before proceeding"
- Design the approval UI to show enough context for an informed decision (not just a yes/no button)
- Default to human-in-the-loop for any irreversible action (sending emails, making purchases, modifying records)

**4. Reversibility**
- Every agentic action should be undoable where technically possible
- Show a clear "Undo last action" for recent agent operations
- For irreversible actions: show a confirmation gate with explicit warning

**5. Transparency of Agent Reasoning**
- Show why the agent made each decision ("I chose this approach because…")
- Provide a log of agent actions with timestamps
- Distinguish between "I decided" (agent autonomous decision) and "I was instructed to" (following user's explicit direction)

### Agentic AI Case Study: CloudWatch Investigation
Amazon CloudWatch AI agent for investigating system alerts:
- User receives alert → agent automatically investigates logs, metrics, traces
- Agent presents: summary of finding + ranked hypotheses + recommended actions
- Human-in-the-loop at: approving remediation action (before agent executes fix)
- Reversibility: agent stages the fix before applying it; user can compare before/after

---

## 16. Shorthand UX Design Notation

### What Is Shorthand UX Notation?
A text-based notation system for describing UI layouts, components, and interactions — designed to be used as prompts to AI code generation tools (e.g., asking Claude or GPT to generate React code from a text description).

### Why It Matters
- Bridges the gap between UX design and AI-generated code
- Enables rapid prototyping without Figma — describe a layout in text, get working code
- Creates a shared vocabulary between UX designers and developers
- Particularly powerful for generating variations quickly

### Notation Principles
- Use indentation to show hierarchy (parent → child components)
- Use brackets `[ComponentType: properties]` to describe each element
- Use `→` to show conditional logic or state transitions
- Use `//` for comments and design intent notes
- Use `|` to show alternative options

### Example Application
Instead of drawing a dashboard in Figma, write:

```
[Dashboard: full-width, dark-mode]
  [Header: sticky]
    [Logo: left]
    [NavBar: centre]
    [UserMenu: right, avatar + dropdown]
  [MainContent: 3-column grid]
    [AIStatusCard: col-1, confidence=high] // AI prediction with confidence score
      [MetricValue: large, trend=up]
      [TalkBack: 2-sentence summary]
      [NextSteps: 3 options]
    [ForecastChart: col-2-3, dashed-future, confidence-cone]
      [NowLine: vertical, labelled]
      [AnomalyAnnotations: on-chart]
```

Feed this to an AI coding tool → receive working React prototype.

---

## 17. User Research for AI Products

### Why AI Products Need Different Research Approaches
Traditional UX research evaluates usability of known interfaces. AI products have additional research challenges:
- Users are interacting with probabilistic, not deterministic, systems
- Outcomes vary — the same input may produce different outputs
- Users form incorrect mental models quickly (both over-trust and under-trust)
- Ethically complex scenarios arise that don't appear in traditional research

### Goal-Directed User Research for AI
Focus research on **what users are trying to achieve**, not on what they think about the interface:
- "What decision are you trying to make?" → maps to Value Matrix
- "What would you do differently if you knew this information earlier?" → reveals AI value opportunities
- "What's the most expensive mistake you make regularly?" → identifies high-value prediction targets

### Research Methods Appropriate for AI Projects

**Contextual Inquiry (Priority 1)**
- Observe users doing their actual jobs, in their actual environment
- Note: when do they make decisions? What data do they consult? What do they miss?
- Specifically look for: decisions where speed matters, high-cost errors, patterns that could be automated

**Diary Studies**
- Have users log decision points over 2-4 weeks
- Ask: "What did you decide? What would have been helpful to know? What were the consequences?"
- AI-specific: ask them to note when they felt uncertain and what would have given them confidence

**Expert Interviews**
- AI domain knowledge requires expert input — interview both users and domain specialists
- Separate sessions: domain experts tell you what good looks like; users tell you what they need

### What AI Research Tools Cannot Replace
The author is explicit: **Synthetic users are "AI Bullshit"** — AI-generated personas or simulated users are not a substitute for real user research. Specific failures:
- AI cannot replicate nuanced domain-specific language
- AI lacks context for the user's emotional state and workflow pressure
- AI-generated research findings contain AI hallucinations that researchers may accept without questioning
- Real observation surfaces unexpected behaviours that no AI model will anticipate

**Rule:** Use AI tools to analyse and synthesise research data. Never use AI tools to generate or replace research data.

### When AI Can Legitimately Assist Research
- Transcription of user interviews
- Affinity mapping of qualitative findings (with human review)
- Synthesis of large volumes of survey responses
- Translation of research materials into multiple languages
- Generating discussion guides (but always have a human review before use)

---

## 18. RITE Methodology

### RITE (Rapid Iterative Testing and Evaluation)
The recommended usability testing approach for AI products. Optimised for the fast iteration cycles that AI development requires.

### RITE vs. Traditional Usability Testing

| Dimension | Traditional Usability | RITE |
|-----------|----------------------|------|
| Participants | 5-12 per round | 3-4 per round |
| Total participants | One round of 5-12 | 3-4 rounds × 3-4 = 9-16 total |
| Prototype fidelity | Usually high-fi | Rough; intentionally unpolished |
| Iteration timing | After all sessions | Between rounds (same day if possible) |
| What changes | Nothing (observation only) | Prototype updated before next round |
| Goal | Document all issues | Fix the most critical issue first |

### RITE Optimal Structure
- **Rounds:** 3-4 rounds
- **Participants per round:** 3-4
- **Total participants:** 9-12
- **Between rounds:** Update prototype to fix critical issues identified in previous round
- **Prototype polish:** Deliberately rough — rough prototypes invite more critique than polished designs

### Why Rough Prototypes for AI Testing
- Polished designs signal "this is decided" — users feel awkward criticising them
- Rough sketches signal "this is work in progress" — users feel free to suggest alternatives
- AI behaviour itself cannot be polished in a prototype — the roughness is honest about the system's current state

### RITE for AI-Specific Test Scenarios
Design test tasks that specifically probe AI interaction:
- Give user an AI prediction with wrong information — how do they handle it?
- Show user an AI recommendation they disagree with — can they override it?
- Show user a low-confidence AI output — do they understand what it means?
- Ask user to correct an AI mistake — how does the correction flow work?
- Show user an AI guardrail activation — do they understand why and what to do next?

### The Future of AI-Assisted RITE
Emerging approach: use AI to observe and annotate sessions (never replace participants):
- AI transcription + sentiment analysis of user responses
- AI highlighting of moments of confusion or delight
- AI synthesis of key issues across rounds
- Human researcher still interprets findings, updates prototype, makes design decisions

---

## 19. Vision Prototyping

### What Is Vision Prototyping?
A design technique for exploring future AI capabilities before technical implementation is possible. Time horizon: 1-2 years to "never." Distinct from tactical prototyping (which addresses current sprint work).

### When to Use Vision Prototyping
- When a stakeholder has an ambitious or unrealistic AI vision that needs grounding
- When exploring a completely new AI use case with no precedent
- When trying to generate patent applications for AI innovations
- When discussing AI ethics and bias in a concrete, creative context
- When "bookending" a design direction (see below)

### Vision Prototyping Best Practices

**1. Time Horizon: 1-2 Years to Never**
Vision prototypes address future states, not current sprints. Anything within 3 sprints is a tactical prototype and does not belong in vision prototyping.

**2. Build as a Flow, Not Screens**
Show the complete use case end-to-end — from problem recognition to real-world value delivery. Do not stop the flow at "the AI shows a result." Show what the user does with that result.

**3. Ideal Delivery: 1-2 Minute Video with Voiceover**
Format: Start with a use case statement in the user's voice → screen-by-screen walk-through → explicit statement of value delivered at the end.

**4. Use Real Content (No Lorem Ipsum)**
Numbers must add up. Names must be realistic. Measurements must be plausible. Use LLMs to generate realistic dummy content for the prototype.

**5. Cover 1-2 Use Cases Only**
Breadth is not the goal. Depth on the primary use case is. Most vision prototypes cover exactly one use case completely, plus one variation.

**6. Cover the Bookends (Disciplined Brainstorming)**
Take the design to its logical extreme in both directions:
- Maximum AI autonomy → what does the interface look like?
- Minimum AI involvement → what does it look like?
- The most radical interpretation → what would be designed for this?
The bookends reveal the design space and prevent premature convergence.

**7. Don't Confuse with Implementation**
Vision prototypes show what could be possible. The MVP will be simpler. Decide separately: what is the minimum version that still demonstrates the core value?

**8. Don't Get Attached to the Outcome**
85% of AI projects fail. Vision prototyping is exploration, not commitment. Present with conviction, but hold conclusions lightly.

### Vision Prototyping Mistakes to Avoid
1. **Aiming too close** — If it could ship in 3 sprints, it's not a vision prototype
2. **Showing disconnected screens** — Must be a flow with a use case, not a feature gallery
3. **Dropping a Figma prototype** — Figma files don't communicate vision; a narrated video does
4. **Using placeholder content** — Fake content destroys credibility; use real-looking data
5. **Covering every corner case** — Focus on the primary use case; edge cases are for implementation
6. **Confusing prototype with implementation** — Don't delve too deep into technical feasibility during vision prototyping
7. **Getting attached to the outcome** — Maintain non-attachment to whether the vision is adopted

---

## 20. AI Bias — Practical Guidance

### The Core Rule
**Always assume all AI is biased. Design accordingly.**

This is not a philosophical statement — it is a design directive. Every AI model, trained on human-generated data, inherits the biases of that data.

### Survivor Bias in AI (Abraham Wald Principle)
Inspired by WWII research: engineers examined planes that returned from combat to find where to add armour. They missed the critical insight — the planes that were shot down never returned. They should have armoured the areas with *no* bullet holes.

**Applied to AI:** The AI only learns from data that was captured. Everything that was not captured is invisible to the model. Ask: "What is *not* in this dataset? Who is *not* represented?"

**Practical rule:** When reviewing AI-generated outputs (images, text, recommendations), train yourself to look first for what is **absent**, not just what is present.

### Common AI Bias Patterns
- **Demographic representation bias:** AI image generators skew heavily toward white males for professional roles; white females for distress/depression images
- **Statistical vs. societal reality mismatch:** Real-world demographics may differ significantly from AI-generated demographics
- **Temporal bias:** Models trained on historical data reflect historical inequalities
- **Feedback loop bias:** Models that learn from user interactions amplify existing user preferences

### Practical Bias Mitigation Techniques for UX Designers

**1. Ask Better Questions**
Instead of: "Generate an image of a biologist"
Use: "Generate an image of a Black transgender biologist in a laboratory"

Specificity overrides the model's default biases. UX designers who use AI tools must actively counteract defaults rather than accepting them.

**2. Train Yourself to See Absence**
After every AI output generation, ask: "Who is missing here? What perspectives are absent? What demographics are underrepresented?"

**3. Use a Different Model as a Judge**
Use one AI model to audit the outputs of another for bias. Ask: "Is this output representative? What demographic groups are missing from these results?"

**4. Test with Diverse User Groups**
Conduct usability testing specifically with underrepresented groups to surface bias that majority-group testing misses.

**5. Document Bias in Your Product**
Include a known limitations section in user documentation that explicitly states the known biases of your AI system.

**6. Design Feedback Mechanisms**
Users should be able to flag biased outputs. This data feeds model improvement.

---

## 21. AI Ethics Frameworks

### AI Humanifesto (Paul Bryan) — Five Core Concepts

**1. Control (Governance, Accountability)**
- Users must be able to modify or opt out of AI functionalities
- Algorithms must be transparent about how decisions are made
- Users retain control over their data: storage, processing, sharing, deletion
- Design requirement: provide explicit consent flows for data collection

**2. Trust (Transparency, Reliability, Explainability)**
- AI must perform consistently; reliability is the foundation of trust
- System must acknowledge errors rather than obscure them
- Data handling must be explained clearly and accessibly
- Design requirement: every AI decision must have an accessible explanation

**3. Diversity (Security, Privacy, Robustness)**
- Training data must be inclusive and representative
- System must actively acknowledge its bias gaps
- Design requirement: document known underrepresented groups in system documentation

**4. Safety (Inclusion, Bias, Equity, Fairness)**
- Privacy and data security are safety requirements, not optional features
- Users must have informed consent before AI affects their lives
- Design requirement: stress-test conversational agents with adversarial inputs

**5. Balance (Sustainability, Harmony, Well-Being)**
- AI should augment human capability, not replace it
- AI development must consider environmental cost (see below)
- Design requirement: always ask "Do we actually need AI for this?" before implementing

### Environmental Cost of AI (Practical Data)
- Sending one 100-word ChatGPT message = consuming one bottle of water or 14 LED bulbs on for one hour
- Design implication: minimise unnecessary AI calls in product design; question whether AI is needed for each feature

### Practical Ethics Implementation for Designers
1. **Understand the incentives** — Corporate pressure to ship fast with AI ROI is real; work with those incentives, not against them
2. **Make ethical design your decision** — Accountability features, feedback mechanisms, explanations — you can design these in without getting sign-off every time
3. **Test for ethical impacts with diverse groups** — Build ethical stress testing into your research plan
4. **Use AI as an ethics checker** — Ask a different AI model to audit your AI's outputs for bias and fairness
5. **Adversarial test guardrails** — Users WILL try to break them; test them systematically

### Three AI Psychological Risks (Chris Noessel)
1. **Halo effect of neutrality:** Users over-trust AI outputs because "machines are objective" — design deliberate friction to encourage critical thinking
2. **Under-reliance:** Users reject AI suggestions as "unfamiliar" — design gradual trust-building interactions
3. **Deskilling:** Users lose capabilities they hand over to AI — design to preserve human skill alongside AI augmentation

---

## 22. The New Normal AI-Inclusive UX Process

### The Three-Pillar Continuous Iteration Model
AI product development cannot follow a linear waterfall:
```
UI Design ←→ AI Model ←→ Data
     ↑                          ↑
     └──────── Continuous ──────┘
               Iteration
```

All three pillars must iterate simultaneously and inform each other.

### The New Normal 4-in-a-Box Team
Required team composition:
- **Product Manager:** Business requirements, success metrics, stakeholder management
- **UX Designer:** User research, interaction design, prototyping, usability testing
- **Engineer/Developer:** Technical feasibility, implementation, front-end code
- **Data Scientist / AI Specialist:** Model selection, training, evaluation, bias analysis

**Critical rule:** All four must be in every key meeting. AI product decisions made without UX are the ones that create the Boeing 737 Max problem. Decisions made without data scientists are the ones that over-promise on AI capability.

### What Changes in AI-Inclusive UX Process

**Discovery Phase:**
- Add Digital Twin exercise before any design work begins
- Add Value Matrix workshop with stakeholders
- Add AI bias audit as part of research planning

**Design Phase:**
- Storyboard all AI interactions with Subject-to-AI transitions
- Design all four LLM error states explicitly
- Design confidence levels and uncertainty communication from the start
- Use Shorthand UX Notation for AI component descriptions

**Validation Phase:**
- Use RITE methodology (3-4 rounds, 3-4 participants per round)
- Include AI-specific test scenarios (wrong predictions, low confidence, guardrail activations)
- Never substitute synthetic users for real research

**Iteration Phase:**
- Update all three pillars (UI, model, data) together
- Track which UI changes caused model performance changes and vice versa
- Maintain audit trail of all AI design decisions

### The "Deadline-Aware Design" Principle
AI UX designers must become full participants in delivery, not observers:
- Design blueprints must be 100% aligned with actual component library
- Mockups should comprise actual front-end code where possible
- UX designers increasingly expected to manage timelines using AI-generated prototypes and working code components

---

## 23. Mental Model Alignment for AI Systems

### The Mental Model Problem in AI
Users build mental models of AI systems rapidly — often incorrectly. Common wrong mental models:
- "The AI reads my data like a human expert would" → over-trust
- "The AI is just autocomplete; it doesn't really understand" → under-trust
- "The AI never makes mistakes on this kind of data" → dangerous overconfidence
- "The AI is neutral and unbiased because it's a computer" → halo effect error

### Mental Model Alignment Techniques

**1. Analogy-Based Framing**
Use analogies users already understand:
- "The AI is like a very fast analyst who reads all your data and highlights anomalies — but you should always verify unusual findings"
- "Think of the AI as auto-suggestions in email — helpful hints you can accept or ignore"
- Avoid: "The AI uses a neural network with 500M parameters" — this builds no useful mental model

**2. Show Failure Modes Proactively**
In onboarding and help documentation, explicitly show what the AI gets wrong:
- "The AI struggles with [specific case type]"
- "In our testing, the AI produces false positives most often when [condition]"
- Showing failure modes proactively does not destroy trust — it builds it, by demonstrating honesty

**3. Make the AI's World Model Visible**
Show users what the AI "sees":
- What data is the prediction based on?
- What time period is the model trained on?
- What types of inputs is it optimised for?
The more users understand the AI's "view of the world," the better they calibrate their trust.

**4. Consistent Personality and Voice**
An AI system with a consistent voice and personality is easier to build a mental model for:
- Define the AI's voice: confident but humble; direct but explains its reasoning
- Use first-person consistently: "I analysed…", "I recommend…", "I'm not confident about…"
- Never switch between "the system", "the AI", and "I" within the same product

**5. The "AI as Colleague" Mental Model (Recommended)**
Design for users to think of the AI as a competent junior colleague:
- It does work you delegate to it; you review and approve
- It makes mistakes; you catch them
- It learns over time; you guide it
- It has domain expertise; you have judgment
This mental model correctly positions AI as augmenting human intelligence, calibrates trust appropriately, and sets realistic expectations for failure.

---

## 24. Progressive Disclosure & Feedback Loops

### Progressive Disclosure in AI Interfaces

**Principle:** AI outputs often contain complex information. Surface the conclusion first; allow users to progressively access detail.

**Three-Layer Progressive Disclosure Model for AI:**
1. **Layer 1 — Headline:** One sentence conclusion ("3 critical alerts today")
2. **Layer 2 — Summary:** Key supporting data ("Alert types: 2 performance, 1 security. Trend: up from 1 yesterday.")
3. **Layer 3 — Full Detail:** Complete data, methodology, confidence intervals, source data

**Rules:**
- Default to Layer 1 or Layer 2 for most users
- Always provide a "Show full analysis" path to Layer 3
- Power users can configure default layer in settings
- Never default to Layer 3 — it creates information overload

### Feedback Loops in AI Interfaces

**Why Feedback Loops Matter**
AI models improve with feedback. UX designers must build feedback mechanisms into every AI interface — not as an afterthought, but as a core interaction pattern.

**Types of Feedback Mechanisms:**
- **Explicit approval:** "Was this recommendation helpful? Yes / No"
- **Explicit correction:** "The AI predicted X; what actually happened?" (train the model with outcome data)
- **Implicit behavioural feedback:** Track whether users accepted, modified, or ignored AI recommendations
- **Correction flow:** When user overrides AI, capture why ("I overrode because: wrong category / outdated data / I have context the AI doesn't")

**Feedback Loop Design Rules:**
- Make feedback frictionless — one click, not a form
- Show users that their feedback matters: "Thanks — this helps improve recommendations"
- Aggregate feedback into a visible improvement cycle: "You've given feedback 47 times. Your model accuracy has improved by 12%."
- Never make feedback feel like a bug report — frame it as model training

### The Reinforcement Learning UX Pattern
In AI systems that update in real time based on user feedback:
- Show users the before/after impact of their corrections
- Show confidence score changing after feedback
- Build a "feedback history" view so users can see what they've taught the AI
- Provide a "reset to default model" escape hatch for users who feel they've made it worse

---

## 25. How AI Changes Traditional UX Patterns

### Navigation Changes
**Before AI:** Hierarchy-based IA; users browse to find
**After AI:** AI-surfaced relevance; most important items come to the user
**Implication:** IA design must include AI surfacing logic as a first-class concern, not just menu structure

### Search Changes
**Before AI:** Keyword matching; users must know the right terms
**After AI:** Natural language; intent-based retrieval; contextualised results
**Implication:** Search UX must handle conversational queries, display confidence on results, allow iterative refinement through dialogue

### Form Design Changes
**Before AI:** Static forms; explicit field-by-field input
**After AI:** AI pre-fills fields; autocomplete on every field; AI validates input intelligently
**Implication:** Forms need to distinguish between AI-populated and user-populated fields; provide easy correction of AI prefills

### Empty States Change
**Before AI:** "No data found. Add some to get started."
**After AI:** Empty states are an opportunity for AI to make suggestions ("You haven't connected any data yet. Here are the three most common starting points for a user like you...")
**Implication:** Redesign every empty state as an AI-driven onboarding opportunity

### Error States Change
**Before AI:** "Error 404: Page not found."
**After AI:** AI interprets what the user was trying to do and offers intelligent recovery paths
**Implication:** Error states must be contextually intelligent, not generic

### Help & Documentation Change
**Before AI:** Static help articles; users must search
**After AI:** Embedded contextual help powered by AI; proactive guidance based on user behaviour
**Implication:** Help is no longer a destination — it is an always-available layer throughout the product

### Data Visualisation Changes
**Before AI:** Static charts; users interpret meaning manually
**After AI:** Charts with AI-generated narrative explaining what the chart means; anomaly annotations; Talk-Back pattern on every visualisation
**Implication:** Every chart needs an AI narrative layer; pure data display is no longer sufficient

### Decision Support Changes
**Before AI:** Dashboards show data; user makes decisions
**After AI:** AI recommends decisions with confidence; user approves or overrides
**Implication:** Every decision-support UI needs an "AI recommendation + human override" pattern, not just a data display

---

## Summary: The 12 Non-Negotiable Rules

These rules appear explicitly in the book as hard requirements, not suggestions:

1. **Always assume all AI is biased.** Design feedback mechanisms and diverse testing accordingly.
2. **Never accept accuracy metrics without a Value Matrix.** Business cost of each error type matters more than model accuracy.
3. **Human override must always be available.** No AI decision should be irreversible without a human confirmation step.
4. **Consistent input must produce consistent output.** Inconsistency destroys trust faster than incorrectness.
5. **Build the Digital Twin before any design work begins.** It is the team's shared mental model.
6. **Real users cannot be replaced by synthetic users.** AI-generated research data is hallucinated research data.
7. **All three pillars (UI, model, data) must iterate together.** Siloed iteration fails.
8. **Storyboard every AI interaction end-to-end.** Include the Subject-to-AI transition and the conclusion frame showing real-world value.
9. **Design all four error states (data error, confidence error, guardrail, hallucination) before launch.** They will happen.
10. **Show confidence levels for every AI prediction.** Never present uncertain outputs with false confidence.
11. **Vision prototypes have a 1-2 year horizon, minimum.** Tactical prototypes are not vision prototypes.
12. **UX is a full team member, not a decorator.** Involvement from day one, in every meeting, with full accountability for outcomes.

---

## Quick Reference: Pattern Index

| Pattern | Chapter | One-Line Description |
|---------|---------|---------------------|
| Value Matrix | Ch. 5 | Replace accuracy with real-world cost/benefit analysis of each error type |
| Digital Twin | Ch. 6 | Map inputs → AI → outputs to align team mental models |
| 6-Component Storyboard | Ch. 3 | Establishing shot, things, people, faces, transitions (incl. Subject-to-AI), conclusion |
| Restating | Ch. 9 | AI rephrases user intent before responding |
| Autocomplete | Ch. 9 | AI suggests completions; visual distinction; Tab to accept |
| Talk-Back | Ch. 9 | Narrative explanation of AI output; lead with conclusion |
| Initial Suggestions | Ch. 9 | 3-5 curated starting points; labels as suggestions |
| Next Steps | Ch. 9 | 3 contextual follow-on actions after AI completes a task |
| Regen Tweaks | Ch. 9 | Controls for tone/length/style/detail; preserve original until replaced |
| Guardrails | Ch. 9 | Plain-language boundary messaging + alternative path |
| AI-First IA (5 pages) | Ch. 11 | Overview, Category, LLM Search, Item Detail, Maintenance |
| DOI Sort | Ch. 12-13 | Multi-factor relevance ranking with user override |
| Confidence Cone | Ch. 15-16 | Dashed future line + widening band + now line |
| 4 Anomaly Types | Ch. 16 | Point, Change Point, Contextual, Curve Shape |
| Copilot Layouts | Ch. 10 | Side panel, Large overlay, Full page |
| Human-in-the-Loop | Ch. 17 | Explicit approval gates before irreversible agentic actions |
| RITE | Ch. 19 | 3-4 rounds × 3-4 participants; update between rounds |
| Shorthand Notation | Ch. 18 | Text-based UI description for AI code generation |
| Vision Prototype | Ch. 20 | 1-2 min video, 1-2 use cases, real content, 1-2 year horizon |
| AI Humanifesto | Ch. 22 | Control, Trust, Diversity, Safety, Balance |
| Progressive Disclosure | Multiple | 3-layer: headline → summary → full detail |
| Feedback Loop | Multiple | Explicit approval + correction capture + implicit tracking |

---

*Extraction complete. Source: UX for AI by Greg Nudelman & Daria Kempka. All frameworks attributed to original authors. Date extracted: 2026-03-21.*
