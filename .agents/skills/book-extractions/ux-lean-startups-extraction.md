# UX for Lean Startups — Laura Klein
## Comprehensive Extraction: Actionable Insights

**Source:** *UX for Lean Startups: Faster, Smarter User Experience Research and Design* — Laura Klein (O'Reilly, 2013)

---

## PART I: FOUNDATIONAL PHILOSOPHY — LEAN UX DEFINED

### What Lean UX Actually Is (5 Defining Properties)

**1. Hypothesis-Driven, Not Feature-Driven**
- Traditional design: "We need to add comments to product pages." (starts with a feature)
- Lean UX: "We believe adding comments will increase revenue. How do we validate that?" (starts with a hypothesis)
- A feature is not finished when it ships. It is only finished when it has been validated or invalidated against key metrics.
- Every product = a set of hypotheses to validate, not a list of features to build.

**2. User-Centred**
- Borrows from User-Centered Design (UCD): relentless focus on the user
- Unlike pure UCD: adds frequent iteration, hypothesis validation, and Agile teams
- Unlike pure UCD: measures design outcomes quantitatively

**3. Agile**
- Cross-functional teams: designers, engineers, and product owners work together, not in silos
- No waterfall handoffs (months of spec → months of design → engineering)
- Short cycles; get feedback fast
- Feature is never "done" — it is ready for its next iteration

**4. Data-Driven (but Informed, Not Dictated)**
- Test every significant change in production
- Data tells you WHAT is happening; qualitative research tells you WHY
- "Data-informed" not "data-driven" — vision + testing, not testing instead of vision
- Designers still make design decisions; data validates or challenges them

**5. Iterative (Always)**
- Minimum Viable Products + constant iteration
- Flailing ≠ iterating. Abandoning experiments without study or follow-up is waste.
- Kill underperforming features; improve existing ones; add new ones

---

## PART II: VALIDATION — BEFORE YOU BUILD ANYTHING

### The Three-Layer Validation Model

**Layer 1: Validate the Problem**
- Signal of success: you hear specific, recurring complaints from a specific type of person
- Best problems to solve: ones users may not even recognise as problems until you fix them (example: email before fax)
- Don't start with a product idea. Start by observing people in a market and finding pain points.

**Layer 2: Validate the Market**
- Mistake: targeting "women" or "doctors" — too broad
- Correct: "urban moms who work full time and have no nannies" or "oncologists in large practices who don't do their own billing"
- Narrow markets have uniform problems → easier to solve with a small initial product
- Signal of success: you can accurately predict that a particular type of person has a specific problem severe enough to pay to solve

**Layer 3: Validate the Product**
- Just because you have a real problem and a willing market doesn't mean your solution is right
- Signal of success: a large percentage of your target market offers to pay you
- This takes the longest — keep asking: "Does this product really solve the identified problem for the specified market?"

---

## PART III: USER RESEARCH TECHNIQUES

### 1. Ethnographic Studies (Contextual Inquiry)

**When:** Pre-product. To understand how people currently behave, what tools they use, what interrupts them.

**The payroll example:** Watching six users process payroll revealed a completely nonlinear, interrupt-driven process — information no interview could have surfaced. This insight determined the entire data-saving architecture of the product.

**How to do it right now:**
1. Pick a specific market (not "women" — "people who process payroll for small businesses with under 20 employees")
2. Find five people in that market
3. Visit them in person or via screenshare (Skype, GoToMeeting, FaceTime)
4. Ask them to show you how they currently perform tasks related to your problem
5. Ask: why do you do it that way? What have you tried before?
6. Look for patterns across 5 people — patterns = real needs
7. DO NOT tell them what you're building first. You are there to listen, not to sell.

**Critical rule:** The single greatest mistake at this stage is telling the test subject what you're working on. Nothing biases a session faster than trying to sell your idea before you listen.

**What you learn:**
- How they currently solve the problem (existing workarounds)
- When and why they perform tasks in the order they do
- Environmental context (location, interruptions, tools on desk)
- Why collaboration features were waste: in the payroll example, observation revealed only ONE person ever handled payroll at these businesses — killing a planned collaboration feature before it was built

### 2. Landing Page Tests (Sell Before You Build)

**When:** Validating market and product interest before any code is written.

**Purpose:** Get a ballpark number of people willing to pay or give email before building anything.

**How to do it right now:**
1. Build a one-page site describing your product (fictional is fine at this stage)
2. Include a big "Buy" or "Pre-order" or "Sign Up" button
3. Drive traffic with Google AdWords or Facebook ads
4. Track click-through rate on the button with Google Analytics
5. No technical skills? Use LaunchRock, which handles metrics automatically.
6. Test multiple versions → compare which messaging/value proposition converts best

**What you learn:** Whether people are interested enough in your idea to act on it. If nobody clicks, stop building and keep searching.

### 3. Prototype Tests (Show, Don't Tell)

**The core rule:** NEVER ask people if they would use something. SHOW them something and observe their reactions.

**Why asking is useless:** When you describe a product and ask "would you use this?" people answer whether they would use their imagined version of your product, not your actual product. Their mental picture is different from yours.

**What good prototype testing requires:**
- The prototype must be interactive enough that people can explore it independently
- Users must be able to discover features without you explaining them
- The less you intervene, the more accurate the data
- Rough and clickable beats polished and static every time

**What to always prototype (flows that must be tested before engineering):**
- Signup flows with more than one step
- Purchase/checkout flows
- Search and browse experiences
- Sharing experiences
- File uploads and editing
- Full navigation of the product
- Anything requiring more than two steps

**When prototype testing is mandatory:**
- The feature will be difficult or slow to fix if wrong (e.g., shipped software, physical products)
- Wrong design could cause terrible outcomes (medical device, election ballot)
- User flow is more complex than a single click
- Engineers will need to throw away significant work if the design is wrong

### 4. Competitor Testing

**When:** Before building anything. Learn from others' mistakes for free.

**How to do it right now:**
1. Find four to five regular users of a competitor's product (Google/Facebook/Craigslist ads)
2. Schedule at a time they'd naturally use it
3. Watch them use it. Then ask:
   - What do you like about this product?
   - What do you hate about it?
   - What confuses you about it?
   - What's missing from it?
   - How did you learn to use it?
   - Why did you pick this over other options?
   - (Enterprise) What parts of your job do you still do outside this product?

**What you learn:** Major UX failures in the market you're entering. If you isolate the 10% of a complex product people actually use, you can deliver a simpler, more elegant alternative that destroys the bloated incumbent.

### 5. Five-Second Tests (Messaging Validation)

**When:** Testing whether landing pages communicate what you do clearly in the critical first seconds.

**Three questions to answer:**
1. What does the user think this product does?
2. Who does the user think the product is for?
3. Can the user figure out how to get the product?

**How to do it right now (guerilla version):**
1. Go to a coffee shop with your computer/tablet
2. Show landing page versions to strangers for 5 seconds
3. Ask: "What does this product do? Who is it for? What would you do if you came to this page?"
4. Offer to buy them a drink in exchange for 5 minutes

**Tool:** UsabilityHub's FiveSecondTest — post mockup, write 3 questions, request 10-15 test subjects, get tag cloud of most common words within hours.

**What you learn:** Your first impression is wrong. Your messaging that makes perfect sense to you who built the product will fail to communicate to a first-time visitor. Fix the gap before spending money on ads.

### 6. Clickable Prototype Testing

**When:** Testing user flows for complex interactions before engineering starts.

**When to definitely do it:**
- The interaction is multi-step with potential for branching or errors
- It will take significant time to fix in production
- You have more than one viable design approach and need to pick

**When you can skip it:**
- Simple single-CTA landing pages (often faster to ship and test in production)
- Very simple single-step interactions
- Engineer can build and ship the feature in roughly the time it takes to build a prototype

**How to run it:**
1. Build the prototype (HTML/JS is best; Axure works; PowerPoint/Keynote is wrong — too hard to maintain)
2. Recruit 3-5 participants in your target persona
3. Give each participant tasks to complete ("Try to purchase this item")
4. Watch, don't help
5. Note where they get confused
6. Fix the prototype
7. Repeat until users complete tasks without confusion
8. If testing multiple versions, rotate the order each participant sees them (people learn and do better on the 3rd prototype they see)

### 7. Guerilla User Tests

**When:** Fast, cheap sanity checks on new-user experience and onboarding.

**Cost:** A coffee and 10 minutes.

**What they test:** Whether a first-time user can complete a specific task independently.

**What they DON'T test:** Whether people will like or continue using your product.

**How to run it:**
1. Load your prototype or product onto laptop/iPad/phone
2. Go to coffee shop
3. Give one task — only the information the user would have if they found the product themselves
4. Watch silently. Do not help. Do not explain. Do not demo.
5. Listen to questions they ask (don't answer them during the task)
6. Ask how it went when finished
7. After 4-5 participants: if everyone breezes through → pick another task. If everyone fails the same way → that failure is a real design problem.

### 8. Unmoderated Remote Testing

**Tools:** UserTesting.com, Loop11, TryMyUI, OpenHallway

**When it's fantastic:**
- Finding out if a specific task can be performed by a brand-new user with zero background

**When it's useless:**
- Predicting whether people will like your product
- Predicting whether people will use your product
- Finding out how real users use your product on a daily basis
- Figuring out how to fix the problems you find
- Everything else

**Practical use:** Ship a new feature → immediately order 3 UserTesting.com videos → within 2 hours, see if users can find and use it. Consistent failures point to real issues. In the example: all three users went to the same wrong place to start a selling flow → the entry point moved → the feature became the most praised feature of the product.

### 9. Surveys — When to Use and When Not To

**The core problem with surveys:** You set the answer options. You bias the respondents. People won't type long answers. "Other" options are systematically underused.

**Surveys are GOOD for:**
- Validating or invalidating patterns spotted in qualitative research
- Following up with a larger group on specific, factual questions your initial interviews generated
- Confirming that 5 interview findings hold across 500 people

**Surveys are BAD for:**
- Generating new hypotheses
- Understanding why users feel a certain way
- Learning what features to build next
- Anything that requires nuanced, open-ended exploration

**The right process:** 5 qualitative interviews → observe patterns → turn patterns into survey hypotheses → survey to validate/invalidate at scale. Never survey first.

**Survey tips:**
- Include screening questions (ask for gender if you only care about women's responses)
- Use specific, answerable questions — not "what do you like about the site?"
- Keep it short — people hate writing

---

## PART IV: INTERVIEWING — THE "SHUT UP" RULES

### 5 Things Almost Everyone Does Wrong

**1. Talking Too Much (Don't Give a Guided Tour)**
- You are there to LISTEN, not to sell
- Do not describe what the product does before the session
- Give as little background information as possible — only what the user would have if they found the product themselves
- Correct scenario framing: "You are shopping for pants to wear to work. Someone recommended this app. You've just downloaded it from the App Store. Show me what you'd do."
- Wrong: "This product helps you find pants using AI and social proof from your friends based on purchase history..."

**2. Asking Closed Questions**
- BAD: "Do you think this is cool?" / "Was that easy to use?"
- GOOD: "What do you think of this?" / "How'd that go?"
- Open-ended questions = you don't know what the interesting answers will be. Closed questions = you've already assumed what matters.

**3. Not Following Up**
- Most common exchange: User says "It was cool." → Ask "What was cool about it?" → User says something actually useful.
- "Cool," "intuitive," "fun," "confusing" are feeling words, not insight words
- Always follow up on adjectives: "What made it feel that way?"

**4. Not Letting Users Fail**
- Do not grab the mouse. Do not show them what to do at the first sign of hesitation.
- Watching WHERE users fail is the most valuable part of the session
- If 4/4 participants fail a task the same way, the product needs to change to match their natural mental model
- After a visible failure: give a small hint, then a slightly larger one if needed — don't resolve it for them immediately
- Learning from failure > learning from success

**5. Shutting Down Silence Too Early**
- When you first show a screen, resist the urge to start quizzing immediately
- Give people time to form their own first impression
- People who have never seen your product need a few minutes to get their bearings
- You'll get richer comments after they've settled in

---

## PART V: RESEARCH TIMING — QUALITATIVE VS. QUANTITATIVE

### The Master Rule
- **Quantitative tells you WHAT is happening** (traffic drops, funnel exit rate, purchase rate)
- **Qualitative tells you WHY it is happening** (what users find confusing, what motivates them)
- Use them together: quantitative to find the problem, qualitative to diagnose and fix it

### When to Use Qualitative Only

**Single-variable changes:** Moving a button, changing button text, adjusting page layout → just ship it and measure. Qualitative testing adds no value here; the metric will tell you immediately.

**Exception:** If a tiny change produces a surprisingly large positive or negative swing in metrics → run 3 quick UserTesting.com videos to make sure you haven't introduced a bug or broken something for a subset of users.

### When to Use Qualitative + Then Quantitative

**Multi-variable changes or new features:** When you're adding a feature with many interacting components (social connections, purchase flows, search), qualitative test first with prototypes — find the confusing parts — fix them before engineering starts. Then A/B test the shipped version.

### When Qualitative Can't Help

**Predicting future purchase behaviour:** People cannot accurately predict what they will buy. To find out if they'll buy, you have to create conditions where they think they're actually buying (fake buy button, landing page with real payment intent) and measure what they DO.

**Deciding what to build next (quantitative approaches):**
- Look at features used most by your highest-value customers
- Add a "fake" button for a feature you're considering and count how many people press it
- If the fake button gets no clicks, you just saved weeks of engineering time

**Deciding what to build next (qualitative approaches):**
- Watch users with the current product: where do they struggle, where do they look disappointed?
- Talk to users who stopped using the product: what did they expect vs. what they got?
- Watch new users in their first 15 minutes: does the product deliver what they expected from the onboarding?

---

## PART VI: DESIGN FOR VALIDATION — THE 9 TOOLS

### Tool 1: Truly Understand the Problem (NEVER SKIP)
- Never start with a solution. Start with the problem.
- Rephrase from solution language to problem language:
  - Wrong: "We need to add comments"
  - Right: "Users have no way to communicate with each other, which is hurting engagement"
- Ask about your user base: Who are they? How tech-savvy? Are you helping new or existing users?
- Ask about context: Are they on the go or at a desk? Time-sensitive or not?
- Ask about needs: Work use? Personal? Entertainment? Productivity?
- Also listen to internal stakeholders (customer service, sales, engineering) — they see problems you don't

### Tool 2: Design the Test First (Almost Never Skip)
**The rule:** Before you design anything, know how you will measure whether the design worked.

**IMVU example:** Goal was to increase activation (% of new users who returned). Before any design work:
- Defined success: statistically significant increase in % of new users returning within X days
- Defined test method: A/B test, old version to 50%, new version to 50%
- Defined measurement window: several weeks post-launch

**Why this matters:** A design change with no pre-defined success metric is not a hypothesis — it's just a change. You can't learn from it.

**Test design principles:**
- Success metrics must be measurable
- Success metrics must be directly related to business goals
- Sometimes A/B tests aren't possible (e.g., user support tools) → find a proxy metric (support call volume, specific question counts)

### Tool 3: Write Design Stories
- Not Agile engineering stories — design stories
- Describe what should be possible, not how it will work
- GOOD: "Users who are having trouble can quickly figure out how to solve the problem."
- BAD: "Users can ask questions of other users and get immediate responses." (too specific — locks you into one solution too early)
- Include admin stories: "Customer service reps can quickly add new content when new problems arise"
- Even trivial stories can uncover missing design needs (example: "visual change" that turned out to require an admin editing interface)
- Skip for: bug fixes, small messaging changes, visual A/B tests

### Tool 4: Brainstorm with the Team (15 Minutes Maximum)
- Small, targeted group of people who know the problem
- Process:
  1. State the user problem and business reason for solving it
  2. Explain how you will measure success
  3. Everyone writes ideas in 1-2 sentences silently
  4. Go around the room, read aloud, write on whiteboard, NO discussion beyond clarification
  5. Group by: which metric it affects / ease of implementation / which customer problem it solves
  6. Do this in under 15 minutes
- Do not vote on a solution
- Do not let brainstorming lovers run 4-hour strategy sessions

### Tool 5: Make a Decision (NEVER SKIP)
- Use ROI: create a 2x2 grid (Expected Return vs. Expected Cost) for each option
- Include engineering in the cost estimates — they know what's fast vs. slow
- Include marketing, customer service, sales for unexpected costs or benefits
- Pick something. The inability to make decisions is the most common trait of failing startups.
- You don't have to be certain it's right. You just need to pick a direction to validate.

### Tool 6: Invalidate the Approach Before Building It
- Before spending time on design and engineering, ask: can I prove this idea is wrong with minimal effort?
- **Feature Stub:** Add a button for the unbuilt feature. Count clicks. If nobody clicks → strong signal the feature isn't wanted.
- Example: E-commerce gadget resale → add "Sell Your Gadget" button before building the full system. If zero clicks → saved weeks of engineering.
- Skip when: the feature takes less time to build than to test this way

### Tool 7: Sketch Multiple Approaches
- Start sketching only at step 7 (not at step 1 — stops you focusing on details before the problem is understood)
- Tools: Balsamiq, OmniGraffle (NOT PowerPoint/Keynote — too hard to maintain and iterate)
- Goal: figure out what elements belong on a screen and what belongs together
- Include: every interactive state, error states, drop-down contents, what happens when each button is pressed
- Create several versions quickly, then get them in front of 4-5 real users
- Test sketches by asking: "What is this screen for?" / "How would you buy something?" / "How would you share this?"
- Rotate which sketch you show first to different participants
- Skip when: change is better communicated in Photoshop/HTML, or when you're going straight to interactive prototyping

### Tool 8: Create Interactive Prototypes
**Use when:**
- Complex multi-step interaction with many possible failure points
- Will take a long time to fix if wrong (boxed software, physical product, medical device)
- Genuinely unsure between two or more substantially different approaches
- Engineers need precise spec of interaction behaviour

**Skip when:**
- Engineer can build the real feature in roughly the same time as a prototype
- Very simple feature with little interactivity
- You practice continuous deployment (can fix it in production cheaply)

**What makes a prototype interactive enough:**
- Widgets respond to users
- Animations work
- Forms can be filled in and submitted (even without real backend)
- Users can make mistakes and recover from them
- Users often think it's just "an ugly version" of the real product

**Tools:** HTML + CSS + JavaScript (most flexible); Axure (common); NOT Flash, NOT PowerPoint

**The 3-prototype IMVU financial account example:**
- Built 3 prototypes for a complex account-linking feature
- Ran 5 users through each
- Result: 5/5 completed tasks on prototype A easily; slower with prototype B; several couldn't complete with prototype C (which was the existing production feature)
- Also found edge-case questions before any engineering began

### Tool 9: Test and Iterate (NEVER SKIP)
- Your first design will not be perfect
- If you think it will be: you're spending too much time up front
- Build/prototype → get in front of users fast → learn what they like and hate → fix → repeat
- Nothing is ever finished; it's just ready for its next iteration

---

## PART VII: JUST ENOUGH DESIGN — LEAN DISCIPLINE

### Design the Necessary, Not the Neat

**Rule:** Strip out everything that isn't necessary to validate your hypothesis or move your key metric.

**Amazon example:** Amazon's product pages have dozens of features. Each one took significant time to build and test. Startups cannot build the Amazon product page on day one. Start with: reasons someone might want to buy + a way to indicate they want to buy + enough traffic to run an experiment. That's it.

**The feature bloat trap:** A company added a new feature, decided it needed to go in main navigation, which required a complete navigation redesign, which required a full visual redesign. When the feature launched — users didn't care. Zero metric movement. The whole project was scrapped. What they should have done:
1. Added a temporary, non-nav entry point to test whether users wanted the feature
2. Validated with a feature stub first
3. Used a Wizard of Oz test to check interest manually

### Feature Stubs
**What:** The minimum clickable UI needed to measure whether users want a feature. No backend required.

**Example:** Company considering a paid upgrade tier → before building payment system and integration:
1. Add an "Upgrade" button
2. Show a static price + benefits page
3. Count how many people click Upgrade
4. A/B test price and benefit statements on the static page

If nobody clicks Upgrade, the payment integration would have been wasted work.

### Wizard of Oz Features (Concierge Service)
**What:** Do the work manually instead of building the system, to test whether people want the outcome.

**Food on the Table example:**
- Product: meal planning based on local grocery store sales
- Problem: building the data pipeline for thousands of stores was enormously complex
- Solution: didn't build it first. Went to stores, got sale circulars, and manually helped a few potential customers plan meals.
- People loved it → justified building the real product
- If they had hated it, the entire infrastructure investment would have been wasted

**Other Wizard of Oz examples:**
- Use Mechanical Turk to collect data instead of writing code
- Pack and ship products yourself before integrating with a distribution center
- Approve orders manually before building a fraud detection system

### Cup Holders vs. Brakes
**The prioritisation filter:** Before committing to any feature, ask:
1. What problem is this solving?
2. How important is this problem compared to every other problem I could be solving?

**Common cup-holder projects (often lower ROI than they appear):**
- Visual design polish before core flows work
- Retention features before you have users to retain
- Animations that look cool but don't improve usability
- Anything that doesn't move a key metric

**Rule:** If you can't answer "this will move metric X by improving user ability to do Y," it's probably a cup holder.

---

## PART VIII: DESIGN DELIVERABLES — WHEN TO USE WHICH

### The 5 Deliverable Types (and When to Use Each)

**1. Flow Diagrams / Site Maps**
- Use when: figuring out how users move through your product or complete common tasks; estimating engineering scope; communicating navigation to engineers
- Don't use for: validating hypotheses; usability testing (these are internal tools only)
- Tools: Visio, OmniGraffle, Post-It notes on a wall
- Key insight: diagrams WILL change. Don't treat a finished diagram as final.

**2. Sketches**
- Use when: quickly visualising multiple approaches; determining what belongs together on a screen; early team communication
- Don't use for: getting feedback from users (too abstract; users can't fill in the gaps)
- Tools: Balsamiq, Mockingbird, OmniGraffle (NOT pencil and paper — hard to update and share)
- Key insight: sketches must include actual copy, buttons, and CTAs to be useful. A sketch of boxes labelled "some text" is not a sketch — it's rectangles.

**3. Wireframes**
- Use when: working out all details at screen level; includes all copy, all CTAs, all navigation, all states; replaces design specs; communicating to engineers
- Don't use for: finalising visual design
- Tools: Balsamiq (lower fidelity), HTML/CSS (higher fidelity; can convert to prototype)
- Key insight: wireframes with linked screens = 80% of the value of a full interactive prototype at a fraction of the time

**4. Interactive Prototypes**
- Use when: complex interaction that would be expensive to fix later; testing multiple substantially different approaches; giving engineers precise interaction specifications
- Don't use for: impressing investors (any investor who requires a prototype to give funding needs to learn about traction)
- Tools: HTML + CSS + JavaScript (most flexible and most portable to production)
- Key insight: no backend needed. Fake the responses. Users will still react naturally.

**5. Visual Designs / Pixel-Perfect Mockups**
- Use when: visual design phase (after interaction design is validated)
- Don't use for: early-stage interaction testing (visual polish biases usability feedback — users focus on aesthetics and are reluctant to criticise something that looks "done")
- Key insight: premature visual design is the cause of more UX disasters than anything else. Don't make things pretty until you know the design is right.

### Why Paper Prototypes Are (Usually) Wrong
Klein is blunt: paper prototypes for user testing are generally counterproductive.

**Problems:**
- People interact with paper differently than screens (different angle, hands not mouse, shuffling pages = different mental model)
- Can't show interaction states, animations, or error recovery
- Can't test natural exploration
- Users spend cognitive energy figuring out what the paper represents, not reacting to the design

**When paper IS acceptable:**
1. Earliest brainstorming with team members (not users)
2. Designing printed media (brochures, manuals)
3. Mobile interface sketching (slightly more acceptable — but move to real prototypes quickly)
4. Embedded/small screen devices where digital prototype is impractical
5. Showing multiple visual designs side by side for preference testing (but still show on screen)
6. No computer access available at all

**The rule:** The closer the prototype mimics the final product interaction, the fewer problems you'll find after launch.

---

## PART IX: MINIMUM VIABLE PRODUCT (MVP)

### MVP Is Both Minimum AND Viable

**Minimum:** The smallest possible thing you can build
**Viable:** The thing actually works and delivers value

A crappy product is minimum but NOT viable. A limited product is BOTH.

**The MVP spectrum (building incrementally):**

**Stage 1: Landing Page MVP**
- Promise the product → measure interest → collect emails
- Cheapest possible market validation
- Multiple versions = test different positioning and value propositions
- Tool: LaunchRock + Google AdWords
- What you learn: which problem framing resonates; what price points interest people; what messaging converts

**Stage 2: Wizard of Oz MVP**
- Do it manually before building the system
- Validates whether the outcome delivers value before the infrastructure exists

**Stage 3: Feature Stub MVP**
- Add the button/entry point without the backend
- Validates whether users want to engage with the feature before engineering starts

**Stage 4: First Iteration MVP**
- Build exactly the core benefit your landing page promised — nothing more
- Resist the urge to add "one more feature" before launch
- Example: Cloud storage pitched around "secure sharing" → first product should do only secure sharing. Not Facebook sharing, not comments, not ratings.

**Stage 5: Iterate**
- Keep working. MVP is not the end state.
- Talk to users who stopped using the product immediately
- Ask: What were you expecting? What did it offer? How was it different from what you expected?
- Conduct these conversations by PHONE, not email. People say things on the phone they won't type.

### Limited Product vs. Crappy Product

| Limited Product | Crappy Product |
|-----------------|----------------|
| Does few things, does them well | Tries to do many things, does none well |
| Clear UX; user understands what to do | Confusing; user can't figure out how to use it |
| Stable; doesn't crash | Unreliable |
| Doesn't try to be everything | Feature-bloated |
| Users can learn something from using it | Users leave confused |
| Amazon in 1995 (books only, done well) | Half-built everything |

**Amazon's lesson:** Started with one thing — selling books online. Did it well. Didn't try to sell everything immediately. Years later expanded. Instagram: one thing (photo sharing). Google: one thing (search). Facebook: one thing (college social network). Every unicorn started limited.

### When Your MVP Gets No Traction
Don't send a survey. Call them.

Questions to ask non-users:
- What were you expecting from the product when you signed up?
- What do you feel the product offered?
- How was what the product offered different from what you were expecting?
- How much time did you spend with it?
- What was your reaction?
- Where did you learn about it?
- Did you speak with anybody else about it? (Reveals who they think the product is for)

---

## PART X: MEASURING UX — METRICS AND A/B TESTING

### What A/B Testing Is (and Is Not)
- A/B testing = showing two versions of a feature to different user groups in production and measuring which produces better metrics
- It says NOTHING about how you generate design ideas (good design process still required before testing)
- It tests the SIZE of what you're testing — not the quality. Testing two bad ideas gives you the least bad one.
- Can test big things: entire features, full checkout flows, major navigation changes

### When to A/B Test vs. When to Research

**Always A/B test:**
- Single-variable changes (button position, copy changes, colour) — qualitative testing won't help here
- Validating design decisions made based on qualitative research
- Confirming feature value after qualitative usability testing has eliminated the obviously broken versions
- Any time you want to know the QUANTITATIVE impact of a change

**Always do qualitative research first when:**
- Multi-variable changes or entirely new features
- Designing complicated flows with many decision points
- Two substantially different design approaches exist and you need to narrow them
- You want to know WHY users are dropping out of a funnel

**The combined process (most powerful):**
1. Qualitative research → understand the problem and generate ideas
2. Qualitative prototype testing → eliminate the obviously broken approaches
3. A/B test the 1-2 survivors → measure business impact at scale
4. A/B results → inform future qualitative sessions (what metrics changed? → investigate why)

### Metrics for User Happiness — None Alone Is Sufficient

**Retention:** Good indicator, but can be manipulated with contracts and switching barriers. Forced retention ≠ happy users.

**Revenue:** Good indicator, but can be inflated with deceptive tactics (surprise subscriptions, hidden fees). Short-term revenue manipulation ≠ happy users.

**NPS (Net Promoter Score):** Best single indicator of happiness. But: survey bias, small sample sizes, skews toward people who respond to surveys. Hard to collect accurately at scale.

**Conversion to Paying:** Useful for freemium products only. Doesn't measure paying-user happiness.

**Engagement:** Good for entertainment/social/e-commerce. But: can be gamed (prize giveaways inflate engagement temporarily). Dangerous for utility products (high engagement in a payroll app might mean it's too hard to use).

**Registration:** Almost useless for measuring happiness (users haven't used the product yet). Exception: lazy registration (users who register after experiencing value).

**Customer Service Contacts:** Can be manipulated by making it harder to reach support. Decrease in contacts ≠ happier customers.

**The right approach:** Look for positive movement across MULTIPLE metrics simultaneously after a feature launch. Positive correlation across 4-5 metrics = genuine user value creation.

### A/B Testing Mistakes to Avoid

**1. Ignoring Statistical Significance**
- Do not make decisions based on small sample sizes
- Use online significance calculators
- A test showing 3 vs 6 conversions out of 600 is NOT 2x better — it's noise

**2. Judging Short-Term Effects as Final**
- Look at metrics over time, not just immediately after launch
- A 50% off sale that spikes revenue looks great until you measure the month after

**3. Forgetting the Business Goal Behind the Metric**
- "We increased returns to the site" but didn't increase revenue → moved the wrong metric
- "Vanity metrics" (Eric Ries term) = metrics that move without affecting business outcomes
- Always trace metric movement back to the actual business goal

**4. Combining Results from Multiple Independent Tests**
- Red background (won A/B test) + Red button (won separate A/B test) ≠ Red button on red background (will fail)
- Always test the final combined design against a control before shipping

**5. Mistaking Correlation for Causation**
- Don't assume your change caused the metric shift
- Account for: seasonality, marketing campaigns, product launches, external events
- Pre-specify what you expect to see from a change. If you expected 10% increase in over-$10 orders from a promotion but didn't see that → the promotion didn't work, even if total revenue rose (for other reasons)

---

## PART XI: LANDING PAGE AND ONBOARDING UX

### Landing Pages as First-Impression Validators

**The core problem:** Your landing page is your first and sometimes only chance to convert a visitor. Visitors are lost NOT because they don't want your product — but because they don't know what it is.

**Three questions your landing page must answer instantly:**
1. What does this product do?
2. Who is this product for?
3. How do I get it?

**Testing your messaging:**
- Use Five-Second Tests (see above)
- Test multiple versions of the landing page with different value propositions
- Visual design sets tone immediately → cartoon graphics → "this is for kids" → right market leaves immediately

**The visual design tone problem (case study):**
- Company had a product for adults
- Cartoony, anime-style visual design
- User testing revealed: first response was "This is for pre-teens" or "My 12-year-old cousin would love this"
- Adults who would pay left immediately
- Fix: sophisticated visual redesign of landing pages and first-time user experience → dramatically improved adult activation

### First-Time User Experience
- Watch new users with your product and ask what they expected from the first 15 minutes
- If it doesn't match what the product delivers → either fix the product or fix the onboarding
- Companies that struggle with first-time user experience often iterate on the wrong things for months without watching users actually go through registration
- Guerilla tests are perfect for this: 5 people at a coffee shop with a task → you'll find the blocking issue

### Onboarding Design
- The moment someone cannot figure out how to accomplish their first task in your product, they leave
- Use flow diagrams to map all possible onboarding paths (including error recovery)
- Test every path in interactive prototypes before engineering
- Error messages must be in-line, not at the top of the form (see doorbell/sign example — put the message where the action is)
- "Just because users can be shown how to use a product doesn't mean they can figure out how to use it"

---

## PART XII: VISUAL DESIGN — THE RIGHT AMOUNT AT THE RIGHT TIME

### Visual Design vs. Interaction Design (They Are Not the Same)
- **Interaction design:** How something works. Copy on a button. Number of steps in a checkout flow. Which pieces go on which pages.
- **Visual design:** How something looks. Button colour. Font sizes. Gradient styles.
- Most people who say they have "someone who knows Photoshop" are describing visual design, not UX design.

### When Visual Design Matters (and How Much)
Visual design is NOT just making things pretty. It does three critical things:

**1. Enhances information design**
- Simple, clean design (Facebook blue/grey/white) is optimal for information-dense products
- Complex visual design fights with user-generated content
- Simple ≠ no design. Simple = design that makes the content the star.

**2. Reinforces desired user actions**
- CTAs must be visually prominent and associated with the decision information
- Example: buy button must be visually grouped with the price, product name, and photo — not separated by layout rules that "look better"
- A bad visual design can hide important elements that a good interaction design positioned correctly
- A good visual design makes the important things look more important

**3. Sets the tone / builds trust**
- High-price-point e-commerce: sophisticated visual design ↑ conversion significantly
- Enterprise software solving a painful business problem: visual design matters much less than functionality
- The line is blurring as enterprise users become consumer app users

### When NOT to Do Visual Design

**During prototyping and usability testing:**
- Strong visual design is DISTRACTING during usability tests — users focus on aesthetics rather than usability
- Users are less likely to give critical feedback on something that looks "finished" and "done"
- Polished prototypes make you emotionally invested → you're less willing to throw out a fundamentally broken design
- When testing interaction design, use grayscale wireframes or Balsamiq-style sketches

**Early in the design process:**
- Premature beautification is the leading cause of UX disasters
- Don't spend days making pixels perfect before you know the navigation structure is right
- "You might end up getting rid of all the elements you were going to make blue once you realise they're just confusing the hell out of your users"

### The Smartest Visual Design Approach

**Don't:** Spend days on pixel-perfect screens for every new feature (features change; your time is wasted)

**Do:** Invest once in flexible visual standards:
- An attractive colour palette
- Font size and colour standards for headers, subheadings, body text
- Column sizes in grid layouts
- A simple, consistent icon set
- Box, gradient, background, and separator standards
- A flexible header and footer design

**Why this works:**
- Engineers can combine standards with sketches to build decent-looking screens without a visual design phase
- Standards are reusable — killing a feature doesn't waste your visual system
- Forces simpler, cleaner, more consistent design across the product
- Reduces need for expensive visual design review on every iteration

**The best visual design in the world:** The one your users love. Your aesthetic preferences are irrelevant. Test with your actual target market, not designers in Silicon Valley.

---

## PART XIII: PROCESS — MAKING YOUR WHOLE TEAM LEAN

### Cross-Functional Teams vs. Waterfall

**The waterfall failure mode:**
1. Product manager writes full spec (weeks of meetings)
2. Designer produces beautiful mockups from the spec (weeks)
3. Engineers receive spec → immediately find it will take 3x longer than expected
4. Features get slashed → designer has to redo screens → engineers wait
5. Months later: product ships with nobody caring about it
6. Everyone is demoralised; too much time invested to kill it; not enough resources to iterate

**The cross-functional team:**
1. Product owner shares the target metric to improve
2. Quick user research involving designer AND engineers (engineers attend at least some sessions)
3. Team collectively identifies the minimum viable experiment
4. Designer produces sketches/prototypes → engineers begin backend work in parallel
5. Engineers attend prototype testing sessions (they see user confusion firsthand)
6. Feature launches → whole team monitors metrics → team can iterate immediately

**Why cross-functional teams win:**
- No handoffs = no information loss
- Engineers who attend user research make better implementation decisions
- Problems (technical or design) found earlier
- Trust develops across functions; team functions as one unit

### Avoid Engineering as Long as Possible
- Engineers are expensive and busy
- Validate with: landing pages → Wizard of Oz → feature stubs → interactive prototypes → THEN engineering
- Example: children's clothing preorder feature — tested with blog post + PayPal button before building any system. 5 minutes of engineering to test a months-of-engineering feature.

### Shipping Strategies (Reduce Risk Without Killing Iteration)

**Option A — Interactive Prototype:**
- Lowest risk: get a big change in front of users without touching production
- Good for: identifying easy-to-fix problems before writing real code

**Option B — Opt-In:**
- Explicitly invite users who want to see new features
- These users are your most change-tolerant
- If even opt-in users hate it → the feature needs serious work

**Option C — Opt-Out:**
- Show new feature to all, but let them revert
- Measure what % actually reverts
- Vocal 1% who opt out = you're probably fine. 50% opting out = you haven't solved the usability problem.

**Option D — n% Rollout:**
- Show new feature to 10% first; check for server meltdowns and catastrophic user reactions
- Then expand to 50% for proper A/B testing

**Option E — New User Rollout:**
- Show only to new users
- Clean A/B cohorts — perfect for testing things that affect acquisition and first impression
- Weakness: old/power users may react completely differently; data takes months to accumulate

---

## PART XIV: SPECIFIC FRAMEWORKS AND RULES

### Pain-Driven Design (PDD) Framework

**Core analogy:** You are a doctor. You don't ask the patient what disease they have and how to treat it. You ask "where does it hurt?" You observe symptoms. You check for conditions they don't know they have. You prescribe treatment based on expertise, not patient preference. You monitor closely and adjust.

**The PDD process:**
1. Talk to users and potential users → find what causes pain
2. Interview about habits, likes, dislikes
3. Observe using current product or competitors' products
4. Identify pain points
5. Design solutions to eliminate pain
6. Test to see if the pain is gone (and no new pain introduced)
7. Run multiple tests to find the best treatment

**What PDD is NOT:**
- Asking customers to design your product (they're bad at design)
- Blindly accepting every feature request
- Ignoring customers' suggestions entirely

**What PDD IS:**
- When a customer says "I want X" → follow up with "why do you want X?"
- The underlying pain ≠ the solution they requested
- Often a simpler solution addresses the real pain more effectively

**Case study (case studies request):**
Three users all asked for "more case studies." But their underlying pains were different:
- User A: "I don't know what to buy" → real pain = choice overload → better solution = recommendation engine / preset packages
- User B: "I want to know if it's worth it" → real pain = ROI uncertainty → better solution = inline stats ("Customers saw 35% revenue increase after 6 months")
- User C: "I don't know if this company is reputable" → real pain = social proof → better solution = static client logo grid (no carousel — banned by design-system)

By asking WHY, three different targeted solutions emerged — each simpler than "write case studies."

### The 9-Tool Design Process Reference

| Tool | When to Skip |
|------|-------------|
| 1. Understand the problem | NEVER |
| 2. Design the test first | Almost never (can take 5 minutes) |
| 3. Write design stories | Skip for tiny bug fixes, small copy changes |
| 4. Brainstorm (15 min) | Rarely — 15 minutes is cheap insurance |
| 5. Make a decision | NEVER |
| 6. Invalidate the approach | Skip when faster to build than to test |
| 7. Sketch | Skip when change is better shown in Photoshop or HTML |
| 8. Interactive prototype | Skip when single-CTA or simple feature; build directly |
| 9. Test and iterate | NEVER |

### Research Method Decision Matrix

| Question | Right Method |
|----------|-------------|
| Do people have this problem? | Ethnographic studies / contextual inquiry |
| Will people pay to solve this problem? | Landing page test |
| Does my product solve the problem? | Prototype test |
| Does my messaging communicate clearly? | Five-second test |
| Where are users failing in my product? | Guerilla testing / unmoderated testing |
| Why are users failing? | Moderated usability test (qualitative) |
| Which version converts better? | A/B test (quantitative) |
| What features should I build next? | Quant (what are users doing) + Qual (why aren't they doing more?) |
| What pattern did I observe — is it real? | Survey to validate at scale |
| Will users like my new feature? | Prototype test (qualitative can help) |
| Will users BUY my new feature? | Feature stub / fake button / A/B test (NOT qualitative) |

### How Many Users You Need (The Iteration Rule)

**For usability testing:**
- Patterns emerge after 3-5 participants
- After 5: you're hearing the same issues again
- Never run 35 sessions in a row without iterating (waste of time and money)
- Correct process: 3-5 sessions → stop → analyse → fix → test again with 3-5 more

**For surveys / five-second tests:**
- 10-15 participants to see patterns
- These are fast and cheap; slightly larger sample acceptable

**For A/B tests:**
- Must achieve statistical significance before making decisions
- Use online calculators
- A/B/C/D/E tests require exponentially larger samples than simple A/B — understand the math

---

## PART XV: THE THREE RULES OF LEAN UX

Klein's final summary at the end of the book:

1. **Listen to your users. All the time.**
2. **When you make assumptions or create hypotheses, test them before spending lots of time building products around them.**
3. **Iterate. Iterate. Iterate.**

---

## KEY QUOTES (Actionable Principles)

- "Products don't spring fully formed from your brain. Before your product, you have an idea. Sometimes it's a great idea. More often, it's a terrible idea."
- "The problem with this approach is that it starts with a feature rather than a hypothesis."
- "Lean UX isn't about adding features to a product. It's about figuring out which metrics drive a business, understanding what customer problems we can solve to improve those metrics, generating ideas for fixing those customer problems, and then validating whether or not we were correct."
- "Data can tell us things like what people are doing and where people are falling out of funnels, but only good research and design will tell us why that's happening and how to fix it."
- "Nothing is ever really finished. It's just ready for its next iteration."
- "If you don't have time to do user research, you'd better make time to fix your product once you've built it wrong, because I guarantee that is what's going to happen."
- "If you build a limited product, it may not do much, but what it does, it does well."
- "Premature prettification is the cause of more UX disasters than Myspace."
- "Design is not art. If you think that there's some ideal design completely divorced from the effect it's having on your company's bottom line, then you're an artist, not a designer."
- "You are not your user."
- "The best visual design in the world is the one your users love."
- "Correlation does not equal causation."

---

*Extraction completed 2026-03-21. Source: UX for Lean Startups by Laura Klein, O'Reilly Media, 2013. 290 pages, full text read.*
