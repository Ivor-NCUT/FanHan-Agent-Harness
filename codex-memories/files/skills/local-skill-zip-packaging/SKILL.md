---
name: local-skill-zip-packaging
description: Package one local Agent skill into a clean shareable zip in Downloads or a temp delivery folder. Use when the user says “打包成压缩包” or when GitHub/Feishu delivery is blocked and a zip fallback is enough.
argument-hint: "[local_skill_dir] [optional-output-name]"
disable-model-invocation: true
user-invocable: true
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Local Skill Zip Packaging

Use this skill when the user wants a local skill bundled into a ready-to-share archive.

Do not use this skill when the real target is Feishu Drive upload or GitHub publish and the user still expects that full destination flow. In those cases, this is only the fallback or prep step.

## Inputs / context to gather first

1. The local skill directory path.
2. Whether the skill lives under `/Users/fanhan/.codex/skills` or `/Users/fanhan/.agents/skills`.
3. Whether the user wants:
   - a zip only
   - a zip plus later upload/share
4. Whether the directory contains `.venv`, caches, models, temp outputs, rendered media, or large runtime folders.
5. The desired output filename if the user named one.

## Procedure

1. Inspect the skill root before packaging.
   - Confirm `SKILL.md` exists.
   - List the files and subfolders you actually want to ship.
   - Treat `agents/`, `references/`, `templates/`, `examples/`, `evals/`, and `scripts/` as likely keepers when present.

2. Build the exclusion list early.
   - Exclude at least:
     - `.git/`
     - `.venv/`
     - `__pycache__/`
     - `.cache/`
     - `.DS_Store`
     - `models/`
     - temp media or render artifacts such as `*TEMP_MPY*`
   - Add any obvious runtime clutter discovered in the local directory.

3. Normalize the top-level archive folder when needed.
   - If the source folder name is Chinese or likely to display poorly across unzip tools, stage the deliverable into an English slug folder first.
   - Keep the inner file layout intact.

4. Create the archive from the staged or source folder.
   - Default destination is `~/Downloads/<name>.zip` unless the user gave another local destination.
   - Prefer a concise English filename when the archive is meant for outside sharing.

5. Verify the archive contents.
   - Run `unzip -l` or an equivalent listing check.
   - Confirm the archive contains only the intended skill assets and no runtime junk.

6. Report the artifact path briefly.
   - Include the final zip path.
   - Mention the top-level folder name if it was normalized.

## Efficiency plan

1. Read the skill tree once and decide keep/exclude lists before zipping.
2. If the first archive only has a naming problem, re-stage and rebuild without re-auditing the whole tree.
3. Stop after archive listing confirms the expected files.

## Pitfalls and fixes

- Symptom: the zip is huge or takes too long to build
  - Cause: `.venv`, models, caches, or temp outputs were included.
  - Fix: rebuild with an explicit exclusion list.

- Symptom: the archive opens, but the top-level folder name is unreadable or awkward
  - Cause: the original directory name is not portable enough for the target recipient.
  - Fix: stage to an English slug folder and rebuild.

- Symptom: the zip technically exists but contains extra artifacts
  - Cause: packaging was done directly from a messy working directory.
  - Fix: stage only the deliverable files or tighten exclusions before re-zipping.

## Verification checklist

- The source directory contains `SKILL.md`.
- The final zip excludes runtime and cache junk.
- The archive top-level folder name is suitable for sharing.
- `unzip -l` confirms only the intended skill assets are present.
- The final local artifact path is reported clearly.
