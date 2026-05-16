# Observability Baseline

This is the minimum monitoring and issue-detection standard for launched agency websites.
Static sites still need operations discipline because the failures clients feel are often outside
the build step itself.

## Objectives

- know quickly when the site is down
- know when forms stop delivering
- know when analytics is missing or broken
- know when a release introduced visible regressions
- shorten the time between failure and detection

## Minimum Signals

### 1. Uptime

Track:

- homepage availability
- contact page availability

Minimum expectation:

- uptime checks every 5 minutes
- alert owner named

### 2. Form Delivery

Track:

- successful test submission at launch
- inbox or CRM receipt
- spam or failure behavior

Minimum expectation:

- manual live verification at launch
- manual re-check within 24 hours

### 3. Analytics Verification

Track:

- page view collection
- primary CTA event
- form success event if configured

Minimum expectation:

- debug verification on launch day
- week-one validation against expected traffic

### 4. Error Visibility

For static or low-JS sites:

- browser console spot-check on priority pages
- third-party form or script provider error visibility if used

For more dynamic sites:

- client-side error logging
- endpoint error logging

### 5. Review Window

Define:

- launch-day review window
- 7-day review window
- 30-day review window

## Observability Questions

Every project should be able to answer:

- Did the site stay up?
- Did leads still reach the client?
- Did the release damage page experience?
- Did the main conversion path still work?
- If something failed, how would we know?

## Suggested Tool Categories

- uptime monitoring
- analytics/debug view
- form inbox or CRM confirmation
- error logging where applicable

## Anti-Patterns

- assuming static means risk-free
- only checking if the page loads
- discovering broken forms from the client
- using alerts no one owns

## Minimal Monitoring Record

```md
# Monitoring Record

Project:
Launch date:
Monitoring owner:

## Uptime checks
- Tool:
- URLs:
- Frequency:

## Form checks
- Form endpoint:
- Delivery inbox/CRM:
- Verification owner:

## Analytics checks
- Platform:
- Core events:
- Verification owner:

## Review windows
- Launch day:
- Day 7:
- Day 30:
```
