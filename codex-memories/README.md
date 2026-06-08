# Codex Memories Snapshot

- Snapshot date: 2026-06-08
- Source directory: `/Users/fanhan/.codex/memories`
- Source database: `/Users/fanhan/.codex/memories_1.sqlite`
- Target repository: `Ivor-NCUT/FanHan-Agent-Harness`

## Contents

- `files/`: Markdown memory files copied from the local Codex memory directory.
- `sqlite-export/schema.sql`: schema exported from `memories_1.sqlite`.
- `sqlite-export/stage1_outputs.json`: exported `stage1_outputs` rows.
- `sqlite-export/jobs.json`: exported memory job rows.

## Exclusions

- `.git/` metadata from the local memory directory.
- `xcrun_db`, a local binary cache file.

## Use

Treat these files as historical memory. Before relying on any path, account, document token, repository state, tool behavior, or authentication detail, verify it against the current environment.
