from pathlib import Path
import re


ROOT = Path(__file__).resolve().parent.parent

GROUPS = {
    "orchestrator": {"website-builder"},
    "build": {
        "i18n",
        "design-reference",
        "sector-strategies",
        "design-system",
        "photo-manager",
        "page-builder",
        "seo",
        "deploy",
        "image-compression",
        "policy-pages",
        "color-selection",
        "email-sender",
        "sectors/legal",
    },
    "cross_cutting": {
        "language-standards",
        "east-african-english",
        "content-writing",
        "brand-alignment",
        "sales-copywriting",
        "form-ux-design",
        "ux-psychology",
    },
    "audit": {"seo-audit", "cro-audit", "skill-safety-audit"},
    "utility": {"skill-writing", "update-claude-documentation"},
}


def rel_id(path: Path) -> str:
    rel = path.relative_to(ROOT).as_posix()
    return rel[:-9]


def group_for(skill_id: str) -> str:
    for group, skills in GROUPS.items():
        if skill_id in skills:
            return group
    return "strategy"


def bullets_for(group: str, name: str, description: str):
    if group == "orchestrator":
        return {
            "use_when": [
                "The user wants a full website build, rebuild, or end-to-end orchestration.",
                f"The task matches this domain: {description}",
            ],
            "do_not_use_when": [
                "The user only needs one narrow subtask and does not need pipeline coordination.",
                "Core project inputs do not exist yet and the task is still discovery-only.",
            ],
            "required_inputs": [
                "Project docs, content, assets, and any language configuration.",
                "A working target project or implementation area.",
            ],
            "workflow": [
                "Read the core project inputs before generating or changing anything.",
                "Route work through sibling skills in the right order using directory-relative names, not a hardcoded install path.",
                "Track outputs from each stage so downstream steps consume the correct artifacts.",
                "Verify the full pipeline before reporting completion or blockers.",
            ],
            "quality": [
                "Preserve the intended build order and artifact handoffs.",
                "Stay portable across Claude Code and Codex installs.",
                "Report clearly what was built, skipped, or blocked.",
            ],
            "anti_patterns": [
                "Do not assume the skills live only under `.claude/skills`.",
                "Do not start generation before reading the project inputs.",
                "Do not skip downstream verification.",
            ],
            "outputs": [
                "Build plan, orchestrated execution notes, generated artifacts, or a blocker report.",
            ],
        }
    if group == "build":
        return {
            "use_when": [
                f"The task matches this domain: {description}",
                "The user needs an implementation-facing skill rather than a general discussion.",
            ],
            "do_not_use_when": [
                "The prerequisite upstream context is missing and the task is not yet execution-ready.",
                "Another narrower skill is the clear better fit for the exact subtask.",
            ],
            "required_inputs": [
                "Project context, current files, and any constraints that affect implementation.",
                "Upstream artifacts produced by earlier skills when this skill is part of a pipeline.",
            ],
            "workflow": [
                "Read only the relevant project inputs and preserved guidance before acting.",
                "Choose the smallest set of references needed for the current job.",
                "Produce the implementation, configuration, or guidance this skill owns.",
                "Validate that the result stays compatible with the rest of the repository workflow.",
            ],
            "quality": [
                "Outputs must be implementation-ready and internally consistent.",
                "Preserve existing behavior unless the task explicitly requires a change.",
                "Avoid host-specific path assumptions so the skill remains portable.",
            ],
            "anti_patterns": [
                "Do not hardcode `.claude/skills` or another single install path.",
                "Do not skip validation against upstream or downstream dependencies.",
                "Do not generate generic output that ignores the actual project context.",
            ],
            "outputs": [
                "Implementation guidance, configuration, generated artifacts, or concrete follow-on steps.",
            ],
        }
    if group == "cross_cutting":
        return {
            "use_when": [
                f"The task matches this domain: {description}",
                "The work needs a quality gate or standard applied across other outputs.",
            ],
            "do_not_use_when": [
                "The task is unrelated to this standard or quality lens.",
                "A more specific execution skill should own the work instead.",
            ],
            "required_inputs": [
                "The content, interface, or artifact being reviewed or improved.",
                "Any brand, audience, regional, or conversion context that affects the judgment.",
            ],
            "workflow": [
                "Read the artifact and the decision context before applying rules.",
                "Use only the parts of the preserved guidance that matter to the current task.",
                "Review or revise the work using this skill as a focused quality lens.",
                "Return actionable changes or acceptance criteria instead of abstract theory.",
            ],
            "quality": [
                "Recommendations must be concrete enough to apply immediately.",
                "Changes should improve consistency, usability, or credibility without flattening the brand.",
                "The standard should support downstream implementation rather than slow it down.",
            ],
            "anti_patterns": [
                "Do not apply every rule mechanically when only a subset is relevant.",
                "Do not give generic critique with no change implications.",
                "Do not override project reality with taste-based preferences alone.",
            ],
            "outputs": [
                "Revisions, review findings, acceptance criteria, or quality guidance tied to the artifact under review.",
            ],
        }
    if group == "audit":
        return {
            "use_when": [
                f"The task matches this domain: {description}",
                "The user needs evaluation, findings, prioritization, or remediation guidance.",
            ],
            "do_not_use_when": [
                "The user needs direct implementation instead of an audit.",
                "There is no target artifact or change set to inspect.",
            ],
            "required_inputs": [
                "The site, page, skill, or workflow being audited.",
                "Any business goals, constraints, or supporting evidence available for prioritization.",
            ],
            "workflow": [
                "Define the audit scope and what success or risk means in context.",
                "Inspect the target using the relevant checklist and preserved guidance.",
                "Summarize the highest-value findings with clear reasoning.",
                "Prioritize remediation so the next actions are obvious.",
            ],
            "quality": [
                "Findings must be evidence-based and ordered by impact.",
                "Recommendations should be specific enough to implement.",
                "The audit should reduce risk or ambiguity for the next person acting on it.",
            ],
            "anti_patterns": [
                "Do not provide generic checklist output with no prioritization.",
                "Do not hide high-severity issues in vague language.",
                "Do not imply certainty when evidence is missing.",
            ],
            "outputs": [
                "Audit report, prioritized findings, remediation notes, or approval status.",
            ],
        }
    if group == "utility":
        return {
            "use_when": [
                f"The task matches this domain: {description}",
                "The user needs repo-maintenance or skill-authoring support rather than project output.",
            ],
            "do_not_use_when": [
                "A build, writing, or audit skill should own the task instead.",
                "There is no repository or skill-maintenance action to perform.",
            ],
            "required_inputs": [
                "The files, changes, or workflow that need maintenance.",
                "Current repository conventions and any behavior that must not regress.",
            ],
            "workflow": [
                "Read the current repository state and the exact maintenance goal.",
                "Use the preserved guidance and any bundled scripts to perform the minimum effective change.",
                "Keep the result aligned with existing repo conventions.",
                "Prepare the output so a follow-on safety review or documentation pass is straightforward.",
            ],
            "quality": [
                "Maintenance changes must reduce ambiguity, not add process noise.",
                "Outputs should preserve portability and existing behavior.",
                "The result should be easy for another agent to continue using.",
            ],
            "anti_patterns": [
                "Do not introduce product-specific assumptions into portable skill rules.",
                "Do not bloat SKILL.md when detail belongs in references or scripts.",
                "Do not leave partially updated conventions behind.",
            ],
            "outputs": [
                "Updated skill structure, repo-maintenance changes, authoring guidance, or synchronized documentation.",
            ],
        }
    return {
        "use_when": [
            f"The task matches this domain: {description}",
            "The user needs domain-specific strategy, writing, or planning in this area.",
        ],
        "do_not_use_when": [
            "Another skill is clearly narrower and better matched to the request.",
            "The task is unrelated to this domain or needs direct implementation instead.",
        ],
        "required_inputs": [
            "Business context, target audience, and the artifact or decision being developed.",
            "Any existing materials, constraints, or supporting references already available.",
        ],
        "workflow": [
            "Read the current business context and the concrete task to solve.",
            "Use only the relevant detailed guidance and references for the request at hand.",
            "Produce the strategy, writing, or framework output this skill is responsible for.",
            "Check the result for clarity, realism, and handoff readiness.",
        ],
        "quality": [
            "Outputs must be specific, usable, and grounded in the available evidence.",
            "Recommendations should support follow-on execution instead of staying abstract.",
            "The result should remain consistent with the broader repository system.",
        ],
        "anti_patterns": [
            "Do not produce generic framework dumps with no decision made.",
            "Do not invent facts to complete the output.",
            "Do not ignore the actual audience, offer, or business constraints.",
        ],
        "outputs": [
            "Strategy notes, writing deliverables, framework outputs, or implementation-facing recommendations.",
        ],
    }


def main() -> None:
    updated = 0
    for path in sorted(ROOT.rglob("SKILL.md")):
        skill_id = rel_id(path)
        group = group_for(skill_id)
        text = path.read_text(encoding="utf-8")
        match = re.match(r"^---\n(.*?)\n---\n?", text, re.S)
        if not match:
            raise ValueError(f"Missing frontmatter in {path}")
        fm = match.group(1)
        name = re.search(r"^name:\s*(.+)$", fm, re.M)
        description = re.search(r"^description:\s*(.+)$", fm, re.M)
        if not name or not description:
            raise ValueError(f"Incomplete frontmatter in {path}")
        skill_name = name.group(1).strip()
        skill_description = description.group(1).strip()
        body = text[match.end():].lstrip("\n")

        references_dir = path.parent / "references"
        references_dir.mkdir(exist_ok=True)
        (references_dir / "legacy-guidance.md").write_text(body, encoding="utf-8")
        has_scripts = (path.parent / "scripts").exists()

        bullets = bullets_for(group, skill_name, skill_description)
        title = skill_name.replace("-", " ").title()
        lines = [
            "---",
            f"name: {skill_name}",
            f"description: {skill_description}",
            "---",
            "",
            f"# {title}",
            "",
            "## Use when",
            *[f"- {item}" for item in bullets["use_when"]],
            "",
            "## Do not use when",
            *[f"- {item}" for item in bullets["do_not_use_when"]],
            "",
            "## Required inputs",
            *[f"- {item}" for item in bullets["required_inputs"]],
            "",
            "## Workflow",
            *[f"{i}. {item}" for i, item in enumerate(bullets["workflow"], 1)],
            "",
            "## Quality standards",
            *[f"- {item}" for item in bullets["quality"]],
            "",
            "## Anti-patterns",
            *[f"- {item}" for item in bullets["anti_patterns"]],
            "",
            "## Outputs",
            *[f"- {item}" for item in bullets["outputs"]],
            "",
            "## References",
            "- Start with `references/legacy-guidance.md` when you need the preserved detailed instructions from the previous skill version.",
            "- Read only the specific files under `references/` that match the current task instead of loading the whole directory.",
            (
                "- Use bundled tools in `scripts/` when they cover the task more reliably than redoing the work manually."
                if has_scripts
                else "- This skill has no bundled scripts by default; keep execution focused on the documented workflow and any existing project files."
            ),
            "",
            "## Notes",
            "- Treat this `SKILL.md` as the portable execution layer for both Claude Code and Codex.",
            "- Preserve existing project behavior unless the current task explicitly requires a change.",
            "",
        ]
        path.write_text("\n".join(lines), encoding="utf-8")
        updated += 1
    print(f"Updated {updated} skills.")


if __name__ == "__main__":
    main()
