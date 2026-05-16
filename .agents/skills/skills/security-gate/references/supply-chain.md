# Supply-Chain Checks

What the supply-chain component of the security gate looks at, and how to
respond to each finding.

## What We Check

1. **Lockfile integrity.** `npm ci` fails if `package.json` and
   `package-lock.json` disagree. The gate re-verifies after install.
2. **Install-script scan.** Any dependency with `preinstall`, `install`, or
   `postinstall` is flagged. Most are rejected; exceptions are documented.
3. **Typosquat detection.** Every package name is compared against a list
   of known-good packages and common typosquats (colors → colors-1,
   discord.js → discord-js, etc.).
4. **Maintainer review.** For new direct dependencies, the maintainer count
   and last release date are surfaced.
5. **Binary planting.** Native modules that install binaries (e.g. sharp,
   esbuild, swc) are allowed; other binary installs are flagged.
6. **Registry override.** Any `registry` override to a non-public registry
   is flagged.

## Implementation

```bash
bash .claude/skills/scripts/supply-chain-check.sh
```

Output: `reports/security/supply-chain.txt` and
`reports/security/supply-chain.json`.

## Response Table

| Finding | Default action |
|---|---|
| Lockfile mismatch | rebuild lockfile from intentional change; never allow CI to regenerate silently |
| Unknown install script | block; review the script; approve only with signed-off `project-log/decisions/` entry |
| Typosquat match | block; remove the offending package; use the canonical name |
| Single-maintainer dependency | warn; explore alternatives; document acceptance if no alternative |
| Native binary install from unknown author | block; review the source; approve only with documented reason |
| Registry override to private registry | allow only if the private registry is the engine's own; otherwise block |

## Known-Bad List

A minimal `.supply-chain-bad` list ships with the engine:

```
event-stream  # 2018 cryptocurrency compromise (historical; modern versions OK but the name is a flag)
colors.js     # 2022 author sabotage; use colors@1.4.0
node-ipc      # 2022 author sabotage
left-pad      # operational fragility
```

Projects extend this list in their own `.supply-chain-bad` file; the gate
reads both.

## Known-Typosquat List

```
crossenv      # cross-env typosquat
cross-env.js  # cross-env typosquat
lodashs       # lodash typosquat
discord.js.rb # not a real package
```

Extend in project-level `.supply-chain-typosquats`.

## Dependency Graph Hygiene

- Every ~6 months, run `npm dedupe` and commit the result.
- Remove unused dependencies with `depcheck` or `npm-check`.
- Review transitive dependency count; if it doubles between minor releases,
  investigate.

## Reading

- "Securing the Software Supply Chain" (ENISA, 2024 update).
- "Open Source Security and Risk Analysis" (Synopsys annual reports).
- Snyk and Sonatype advisories.
