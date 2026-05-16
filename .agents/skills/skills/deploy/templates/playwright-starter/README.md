# Playwright E2E Starter

Use this starter in client website projects to cover the highest-value launch flows.

This starter is intentionally narrow:

- smoke coverage for site availability
- navigation coverage for core routes
- form coverage for primary contact flow

It is not a full test suite. It is the minimum E2E baseline for Phase 6.

## Recommended Project Structure

```text
playwright.config.ts
tests/
  smoke.spec.ts
  navigation.spec.ts
  forms.spec.ts
```

## Installation

```bash
npm install -D @playwright/test
npx playwright install
```

## Required Environment Variables

Use a `.env.test` or CI environment:

```bash
PLAYWRIGHT_BASE_URL=http://127.0.0.1:4321
E2E_CONTACT_SUCCESS_TEXT=Thank you
```

## What To Customize

- page URLs
- navigation labels
- form selectors
- success message text
- language switcher selectors if multilingual

## Minimum Flows To Keep

- homepage renders
- top navigation works
- primary CTA routes correctly
- contact form validates
- contact form success state appears
- language switching works if the site is multilingual

## CI Advice

- run E2E only after build succeeds
- start the built site or dev server predictably
- fail the pipeline on smoke-test or form-test failure
