---
name: feishu-doc-comment-writeback
description: Write review, diagnosis, or optimization feedback directly into a Feishu doc as comments. Use whenever the user wants comments left on a Feishu wiki/doc link instead of a chat-only report, especially for AI diagnosis, content critique, or multi-skill review.
argument-hint: "[feishu_url] [review_goal]"
disable-model-invocation: true
user-invocable: true
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Feishu Doc Comment Writeback

Use this skill when the user wants feedback written onto a Feishu document itself, not just summarized in chat.

Do not use this skill for full-document rewrites unless the user explicitly asks to rewrite the doc. This workflow is for comments, diagnosis, critique, and anchored suggestions.

## Inputs to gather first

1. The target Feishu URL.
2. What kind of review is needed:
   - AI fingerprint diagnosis
   - content critique
   - multi-skill review
   - title/hook/structure optimization
3. Whether the user wants:
   - anchored inline comments
   - a mix of anchored comments and full-document comments
   - only a summary comment
4. Whether the user named specific skills/frameworks that should each appear in the comments.

## Procedure

1. Verify local Feishu auth first.
   - Run `lark-cli auth status --verify`.
   - Stop if auth is invalid or missing.

2. Resolve the Feishu URL to the real file target.
   - If it is a wiki URL, run `lark-cli wiki spaces get_node --params '{"token":"<wiki_token>"}'`.
   - Capture `obj_type` and `obj_token`.
   - If the target is `docx`, use the real doc token for verification later.

3. Fetch the document in the two formats that matter.
   - Readable body: `lark-cli docs +fetch --api-version v2 --doc "<url>" --doc-format markdown --detail simple`
   - Block IDs when needed: `lark-cli docs +fetch --api-version v2 --doc "<url>" --doc-format xml --detail with-ids`
   - Only fetch XML when block IDs or exact anchors are actually needed.

4. Decide the review shape before writing comments.
   - If the user asked for diagnosis only, stay in diagnosis mode. Do not rewrite.
   - If the user named several skills/frameworks, split findings by skill and keep that label in each comment where practical.
   - Prefer short, actionable comments anchored to specific sentences or sections over one long report.
   - For single-piece diagnosis, default to a small set of anchored comments plus one full-document summary comment unless the user explicitly asks for comments-only or summary-only.

5. Draft comments in a stable structure.
   - Each comment should contain one clear point.
   - Use direct language.
   - Keep comments easy to process in-doc.
   - If reviewing by skill, prefix the comment with the skill label.

6. Write comments with the safest anchor available.
   - Preferred: `drive +add-comment --selection-with-ellipsis ...`
   - If you already have block IDs and need precise placement, use `--block-id`.
   - If anchoring fails, fall back to `--full-comment` so the advice is still preserved.
   - Comment content should be passed as reply elements JSON, for example:
     - `[{"type":"text","text":"[dbs-ai-check] 这里的结论太顺，像模板化总结，建议补边界条件。"}]`

7. Verify that comments actually landed.
   - Run `lark-cli drive file.comments list --params '{"file_token":"<doc_token>","file_type":"docx","is_solved":false}' --format json`.
   - Confirm the expected count and spot-check a few comment bodies.

8. Report back briefly.
   - Tell the user how many comments were written.
   - Mention any fallback behavior, such as full-document comments used because anchors failed.
   - Mention any unresolved limitation.

## Efficiency plan

- Start with markdown fetch only; add XML fetch only if block IDs or exact anchors are necessary.
- Reuse the resolved `obj_token` for all later comment and verification calls.
- Batch drafting first, then batch comment creation, then one final comments-list verification.
- If the user named multiple skills, build the review outline once and fan it into comment-sized units instead of rereading the doc per skill.
- For diagnosis tasks, plan the whole comment set before writing: local anchors first, one summary comment last.
- Stop exploring once auth is valid, doc resolution is confirmed, and you have enough text to anchor comments safely.

## Pitfalls and fixes

- Symptom: `--detail with-ids is only supported with --doc-format xml`
  - Cause: tried to get block IDs from markdown.
  - Fix: switch that fetch to XML.

- Symptom: `VALIDATION:1101 未找到匹配的内容`
  - Cause: the anchor text is not uniquely matchable, often the title text.
  - Fix: anchor to the opening body sentence or a longer text span; otherwise fall back to `--full-comment`.

- Symptom: comments appear to send but cannot be confirmed
  - Cause: verification was skipped or the wrong token was used.
  - Fix: verify with `drive file.comments list` using the resolved docx token, not the wiki token.

- Symptom: the doc only gets one long summary and loses location value
  - Cause: skipped local anchors and wrote only a full-document comment.
  - Fix: leave several block-level comments first, then add one concise summary comment.

- Symptom: the agent starts rewriting the article
  - Cause: the task goal drifted from diagnosis/commenting into editing.
  - Fix: return to comment mode unless the user explicitly asks for rewrite.

## Verification checklist

- `lark-cli auth status --verify` shows a valid user session.
- The Feishu URL has been resolved to the correct doc target.
- The fetched content matches the document being reviewed.
- All intended comments were written.
- `drive file.comments list` confirms the comments exist.
- Any anchor failures or full-comment fallbacks are reported back to the user.
