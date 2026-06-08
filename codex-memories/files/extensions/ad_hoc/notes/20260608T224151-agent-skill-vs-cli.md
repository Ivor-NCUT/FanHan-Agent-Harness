User asked how to choose between Agent Skill and CIi/CLI while productizing repeated business workflows to reduce token consumption.

Interpret `CIi` as CLI unless the user later clarifies another tool.

Stable answer:
- Agent Skill is for reusable workflow knowledge: trigger conditions, business judgment, process steps, input/output templates, reference material, scripts to call, validation rules, and known failure fixes.
- CLI is for execution: reading/writing files, running scripts, calling tools such as lark-cli, gh, git, uploading/publishing, batch operations, and verification.
- Skill answers "how should this be done correctly"; CLI answers "perform the real action in the environment".
- Use Skill when the repeated cost is re-explaining context, standards, decision rules, or output format.
- Use CLI when the repeated cost is manual operation, local/environment state, or system-side action.
- Use both when a high-frequency workflow needs reliable real-world delivery: Skill orchestrates the workflow and calls CLI tools for execution and checks.
- Practical rule: repeated explanation more than twice -> Skill; real system writeback/execution -> CLI; frequent workflow plus real delivery -> Skill + CLI.
