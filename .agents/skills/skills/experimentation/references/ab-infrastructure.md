# A/B Infrastructure

**Read this when**: provisioning experimentation infrastructure for a
new retainer client or reviewing an existing setup.

**Purpose**: Define the default platform (GrowthBook), approved
alternatives (Statsig, PostHog), and the deterministic-assignment,
event-firing, and data-retention contracts that every experiment
honours.

## Default: GrowthBook

Why GrowthBook is the default:

- Open-source self-hostable (MIT-licensed server and SDKs), which fits
  the engine's licensing posture.
- Good Africa-bandwidth profile: the SDK is small, feature definitions
  cache locally, and the client-side runtime does not require the
  GrowthBook host on the critical path.
- Supports both frequentist and Bayesian analysis.
- Strong GitOps story — feature definitions can live in a JSON file
  under version control.
- No per-seat cost on self-host.

Alternatives (allowed with decision entry):

- **Statsig** — excellent sequential-testing support; hosted only; good
  fit for clients with > 10M events/month.
- **PostHog** — event-store plus experimentation; good when a client
  already uses PostHog for product analytics.

Banned:

- Optimizely (client-side only variants, heavy runtime, pricing not
  friendly to engine margins).
- Home-rolled hash-splitting without analysis tooling.

## Installation — GrowthBook self-host

1. One GrowthBook instance is provisioned per agency, not per client.
   Client projects are tenants within the instance.
2. Each client gets a separate API key; keys are stored in the client
   project environment as `GROWTHBOOK_API_KEY` and never committed.
3. Client SDK is installed via npm; SDK version is pinned per project.
4. Feature definitions are fetched at build time and bundled into the
   static output where possible to keep the critical path short.

## Assignment contract

- Deterministic: a user who gets the treatment once keeps it for the
  duration of the test.
- Hashing key: a stable ID. First choice: a first-party anonymous
  cookie set on first visit. Fallback: URL-derived bucket for non-
  cookie visitors.
- Assignment event fires on first exposure only, not every pageview.
- Assignment events feed the same analytics pipeline as outcome events
  so the attribution is clean.

## Event firing

Every assignment event:

```js
growthbook.on('experimentView', ({ experiment, variation }) => {
  plausible('experiment_exposure', {
    props: {
      experiment: experiment.key,
      variation: variation.value
    }
  });
});
```

Outcome events are the production events (e.g. `primary_cta_click`);
do not invent experiment-specific outcome events. This keeps the
post-test baseline comparable with the pre-test baseline.

## Mutual-exclusion

If two experiments target the same audience and the same primary
metric, they must be mutually exclusive. GrowthBook supports
namespaces; configure a shared namespace per client.

Cross-experiment interaction is always possible; log it in the
hypothesis file under section 9.

## Preview and staging

- Every experiment can be previewed on staging via a query parameter
  that forces a variant.
- QA before launch confirms that:
  - Control ≈ 50% exposure.
  - Treatment ≈ 50% exposure.
  - Assignment event fires once per user.
  - Outcome events fire on both variants.

## Turning tests off

- Pausing a test in GrowthBook stops assigning new users; existing
  assignments persist so the analysis remains interpretable.
- Hard-stopping a test removes the SDK config so no further events
  fire; the code still runs but only the control path.
- Removing the losing variant's code is a follow-up ticket within 14
  days of decision.

## Retention

- Exposure and outcome events share the analytics provider's retention
  (Plausible default 24 months).
- Hypothesis files and experiment logs are retained indefinitely in the
  project log; they are the agency's institutional memory.

## Security

- GrowthBook self-host sits behind the agency's authentication.
- The per-client API key is read-only from the SDK's perspective.
- Definitions are fetched over HTTPS; the server presents a valid cert.

## Verification at launch

- Smoke test both variants on the production site; confirm assignment
  events land in Plausible.
- Confirm fallback behaviour when GrowthBook is unreachable: the site
  continues with control-path behaviour and no users see a broken
  experience.

## Cross-reference

- `hypothesis-template.md` — the file the test writes to.
- `stat-significance-primer.md` — the analysis framework.
- `observability/references/analytics-integration.md` — how events
  reach the analytics provider.
