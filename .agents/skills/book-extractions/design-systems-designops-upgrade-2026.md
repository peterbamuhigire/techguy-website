# Design Systems And DesignOps Upgrade 2026

Internal synthesis of the reviewed EPUBs for `website-skills`.

## Primary sources used

- *Design Systems Handbook*
- *DesignOps Handbook*

## Limited-source note

- *Psychology of Web Design (Smashing Magazine)* and *The Web Design Book. Volume 6* were packaged as image-only EPUB scans with no reliable text layer in the local files provided, so they could not be critically mined the same way without a separate OCR pass.

## Durable principles worth encoding

### 1. Audit first

- Run a UI audit before redesigning or extending the system.
- The first problem is usually uncontrolled variation, not lack of ideas.

### 2. Systems need standards and reusable components together

- Standards explain the why.
- Components embody the what.
- One without the other creates drift.

### 3. Token layers matter

- Primitive, semantic, and component tokens should be distinct.
- Raw values in page code are usually a governance failure.

### 4. The source of truth must be explicit

- A design system should have a clear, maintained reference point for components, states, and usage rules.
- If code, docs, and design files disagree, the system is already drifting.

### 5. The system is a living product

- It needs maintenance, contribution rules, and cleanup.
- “One and done” is a myth.

### 6. DesignOps is more than process theatre

- Workflow, people, governance, and business support determine whether a system scales.
- Good design work needs operational support, not just better taste.

## Repository changes driven by this synthesis

- strengthen audit-first design-system guidance
- require clearer token and component structure
- strengthen governance around reuse, ownership, and source-of-truth parity
