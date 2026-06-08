---
name: feishu-job-strategy-report
description: Create or revise a Feishu 求职策略报告 from a Feishu wiki/doc, attached resumes, and optional consultation minutes transcripts. Use when the user gives a Feishu link and asks for a complete report or says “根据这个修改一下他的/她的报告”.
argument-hint: "[feishu-link] [candidate-name-or-note]"
disable-model-invocation: true
user-invocable: false
---

# Feishu Job Strategy Report

## When to use

Use this when:
1. The user gives a Feishu wiki/doc link for a candidate.
2. The source doc contains resume attachments or says “文档里有 ta 的简历”.
3. The deliverable should be a complete job-search strategy report in Feishu.
4. The user also gives a Feishu minutes link or says “这是完整录音转的文字，你根据这个修改一下他的/她的报告”.

Do not use this for:
1. Course-outline design.
2. Plain resume screening across many emails.
3. Cases where the user explicitly wants writeback into an existing source doc and has named the exact target section.

## Inputs to gather

1. Confirm the working directory and the exact Feishu link.
2. Confirm whether the user wants a new standalone doc or a writeback into an existing doc section.
3. Check whether the source has embedded media/file attachments.
4. Check whether the user supplied one or more Feishu minutes links for transcript-driven revision.
5. Decide whether the local draft should be Markdown or XML before creation/update.

## Procedure

1. Resolve the source link to a real doc object.
   - Prefer `lark-cli drive +inspect --url '<wiki-url>'`.
   - `lark-cli wiki +node-get --node-token '<wiki-url-or-token>'` is also valid for wiki links.
2. Read the source doc body with `lark-cli docs +fetch --api-version v2 --doc <token-or-url>`.
   - Scan for attachment/media tokens inside preview/source blocks.
3. Download attached resumes before writing any analysis.
   - Use `lark-cli docs +media-download --token <file_token> --type media --output <relative_filename> --overwrite`.
   - Run this from a temp/work directory so `--output` can stay relative.
4. Extract readable text from each PDF with `pdftotext -layout`.
5. Synthesize the report from both the form text and the resumes.
   - Keep the report concrete: candidate profile, role positioning, portfolio plan, story packaging, outreach strategy, action plan, interview prep.
   - Base role recommendations on transferable evidence in the resume, not on generic “AI” ambition.
6. If the user supplied consultation minutes, read the full transcript before finalizing positioning.
   - Prefer `lark-cli vc +notes --minute-tokens <minute_token>`.
   - If transcript access fails for missing scope, run a minimal auth flow for `minutes:minutes:readonly minutes:minutes.artifacts:read`, then retry.
   - Use the transcript to extract “明确不喜欢什么” and “真正兴奋什么”; let those signals override a too-generic first-pass positioning.
7. Create or update the deliverable doc.
   - Default to a new standalone Feishu doc unless the user explicitly asked for writeback into the original doc.
   - Use `lark-cli docs +create --api-version v2 --content @<local_file>`.
   - For transcript-driven revisions of an existing standalone report, use `lark-cli docs +update --api-version v2 --doc <target_doc> --command overwrite --content @<local_file>`.
   - If the local draft is Markdown, add `--doc-format markdown` when needed.
8. Verify the created or updated doc.
   - Use `lark-cli docs +fetch --api-version v2 --doc <doc_token> --scope outline` or `--format pretty`.
   - Confirm the title and that the main sections are present.

## Efficiency plan

1. Read the source doc once, capture all attachment tokens, then batch the download/extraction work in one temp folder.
2. Use outline fetches for quick verification instead of rereading the full created doc.
3. Reuse the stable report structure instead of inventing a new layout each time.
4. Stop exploring alternate download methods once `docs +media-download` works.
5. For transcript-driven revision, stop once the full transcript is available locally and you have extracted: target positioning, supporting evidence, explicit dislikes, and direct next-step recommendations.

## Pitfalls and fixes

- Symptom: `download failed: HTTP 403`
  - Likely cause: using `drive +download` on a doc-embedded media token.
  - Fix: switch to `docs +media-download`.
- Symptom: `unsafe output path`
  - Likely cause: absolute path passed to `--output`.
  - Fix: change into the target temp directory and use a relative filename.
- Symptom: `--content is required` or `unknown flag: --format`
  - Likely cause: wrong `docs +create` flags for this CLI version.
  - Fix: use `--content @file` and drop invalid creation flags.
- Symptom: `docs +update` validation fails with `--markdown` or other write flags
  - Likely cause: this CLI version wants overwrite content from a local file.
  - Fix: use `--command overwrite --content @file`.
- Symptom: user objects to editing the original “求职策略” section.
  - Likely cause: assumed writeback target without confirmation.
  - Fix: default to a new deliverable doc unless writeback was explicit.
- Symptom: transcript access fails even though the minute exists
  - Likely cause: missing `minutes:minutes:readonly` or `minutes:minutes.artifacts:read`.
  - Fix: run the minimal scope auth flow, then retry `vc +notes`.
- Symptom: first-pass report positioning feels generic or wrong after reading consultation material
  - Likely cause: relied on form text/resume only.
  - Fix: re-anchor on transcript evidence, especially explicit dislikes and the strongest repeated career-direction cues.

## Verification checklist

1. The source doc was resolved to a real doc token.
2. Every relevant resume attachment was downloaded and converted to readable text.
3. The report uses evidence from both the source form and the resume text.
4. If minutes were supplied, the final positioning reflects the full transcript rather than just the auto-summary.
5. The final doc was created or updated successfully and the link/token was captured.
6. An outline or content fetch confirms the final doc is not empty.
