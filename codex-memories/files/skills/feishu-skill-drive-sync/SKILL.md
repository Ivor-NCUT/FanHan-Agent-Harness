---
name: feishu-skill-drive-sync
description: Package a local Agent skill, keep its local/cloud names aligned, and upload or overwrite it in a Feishu Drive folder. Use when the user asks to "传到网盘/飞书文件夹" or wants English skill names changed to Chinese everywhere.
argument-hint: "[local_skill_dir] [feishu_folder_url_or_token] [optional-display-name]"
disable-model-invocation: true
user-invocable: true
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Feishu Skill Drive Sync

Use this skill for local skill delivery from `/Users/fanhan/.agents/skills` into a Feishu Drive folder, especially when the user wants:

- a complete skill package uploaded to Feishu
- English skill names changed to Chinese
- the local folder name, `SKILL.md` `name:`, and uploaded zip filename kept in sync
- an existing Feishu file overwritten in place

Do not use this skill for chat-only summaries or for GitHub publishing with no Feishu delivery target.

## Inputs / context to gather first

1. The local skill directory path.
2. The Feishu folder URL or folder token.
3. Whether this is:
   - a first upload
   - an overwrite of an existing Feishu file
   - a rename plus upload
4. The desired display name if the user gave one.
5. Whether the skill directory is a Git repo and may contain `.git`, `.venv`, caches, or large runtime/vendor folders.

## Procedure

1. Confirm the target folder before packaging anything.
   - Run `lark-cli drive +inspect --url "<folder_url>"` when given a URL.
   - Capture the folder `token`, `type`, and visible title.
   - Stop if the target is not a folder.

2. Inspect the local skill shape.
   - Verify the directory contains `SKILL.md`.
   - List non-git files you expect to deliver, typically `SKILL.md`, `README.md`, `references/`, `evals/`, `templates/`, `examples/`.

3. Normalize names before packaging when the user asked for a rename.
   - If the user gave a Chinese-facing skill name, update `SKILL.md` `name:` first.
   - Rename the local directory if the user wants the folder name changed too.
   - Decide the uploaded filename as `<display-name>.skill.zip` unless the user asked otherwise.
   - Keep these three layers aligned:
     - local directory name
     - `SKILL.md` `name:`
     - uploaded zip filename

4. Build a clean zip from the skill root.
   - Package from the skill repo/root, not from a parent directory.
   - Exclude at least:
     - `.git/`
     - `.venv/`
     - `__pycache__/`
     - caches
     - temp/output/transcript/media/model-download artifacts
   - Use a temp staging directory if needed so the final upload path can be relative.

5. Upload with the correct Feishu path rules.
   - `lark-cli drive +upload` requires `--file` to be a relative path inside the current directory.
   - `cd` into the temp staging directory before uploading.
   - For a new upload:
     - `lark-cli drive +upload --as user --folder-token <folder_token> --file ./<zip> --name <zip>`
   - For an overwrite of an existing file:
     - `lark-cli drive +upload --as user --file-token <existing_file_token> --file ./<zip> --name <zip>`

6. Verify with a folder listing, not guesswork.
   - Run `lark-cli drive files list --as user --params '{"folder_token":"<folder_token>","page_size":100}'`.
   - Confirm the final filename appears.
   - If overwriting, confirm the expected token/name pairing is still present.

7. Report the delivery briefly.
   - State the final local directory name if it changed.
   - State the uploaded filename and folder.
   - Mention whether it was a new upload or an overwrite.

## Efficiency plan

1. Resolve the folder token once and reuse it.
2. Inspect the skill contents once before zipping so you do not re-run large packaging loops.
3. Rename locally before zipping; avoid building archives twice.
4. Stop exploring after:
   - the folder token is confirmed
   - the zip contents are known
   - upload verification shows the expected file

## Pitfalls and fixes

- Symptom: `unsafe file path: --file must be a relative path within the current directory`
  - Cause: passed an absolute path to `drive +upload`.
  - Fix: `cd` into the staging directory and upload `./filename.zip`.

- Symptom: the user asks for Chinese names after an English-named upload already exists
  - Cause: the name layers were not aligned up front.
  - Fix: update `SKILL.md` `name:`, rename the local directory, rebuild the zip, then overwrite or re-upload with the Chinese filename.

- Symptom: the archive is huge or contains runtime junk
  - Cause: `.git`, `.venv`, caches, or media outputs were included.
  - Fix: package from the skill root with explicit exclusions.

- Symptom: upload succeeded but you cannot tell whether the right file is in the folder
  - Cause: verification used the wrong command.
  - Fix: use `drive files list` or `drive +inspect`, not `drive files get --file-token`.

## Verification checklist

- The target Feishu object is confirmed to be a folder.
- The local skill directory contains `SKILL.md`.
- The final zip excludes VCS/runtime junk.
- The uploaded filename matches the intended display name.
- If renaming was requested, local directory name, `SKILL.md` `name:`, and cloud filename are aligned.
- `drive files list` confirms the file exists in the expected folder.

