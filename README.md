# FanHan Agent Harness

一套给 Agent 使用的个人工作流 Harness：包含 system prompt、核心 skills、skill 迭代依赖，以及一键安装脚本。

这个仓库适合给朋友快速复用你的 Agent 工作方式：

- 中文内容创作时自动套用「内容风格守门」。
- 开发任务时自动套用「codex-dev-good-taste」。
- skill 产出满意后，用「skill-迭代工作流」把反馈沉淀回原 skill。
- 新 skill 创建完成后，用「skill-github-publisher」发布到 GitHub。

## 一键安装

```bash
git clone https://github.com/Ivor-NCUT/FanHan-Agent-Harness.git
cd FanHan-Agent-Harness
bash scripts/install.sh
```

默认安装到：

```text
~/.agents/skills
```

如果你的 Agent 使用其他 skills 目录：

```bash
AGENT_SKILLS_DIR="$HOME/.codex/skills" bash scripts/install.sh
```

安装完成后，把 [system-prompt.md](system-prompt.md) 里的内容复制到你的 Agent system prompt。

## 仓库结构

```text
FanHan-Agent-Harness/
├── system-prompt.md
├── skills/
│   ├── core/
│   │   ├── 内容风格守门/
│   │   ├── codex-dev-good-taste/
│   │   ├── skill-迭代工作流/
│   │   └── skill-github-publisher/
│   └── dependencies/
│       ├── skill-creator/
│       └── 达尔文skill/
├── scripts/
│   └── install.sh
└── docs/
    └── skills-manifest.json
```

## Core Skills

- `内容风格守门`：中文内容创作、润色、改写、标题、脚本和内容诊断的风格守门。
- `codex-dev-good-taste`：开发、修 bug、代码审查、重构和架构文档同步的工程规范。
- `skill-迭代工作流`：用户确认满意后，把本轮反馈沉淀回原 skill。
- `skill-github-publisher`：新 skill 创建完成后，发布到 GitHub skill 仓库。

## Dependencies

- `skill-creator`：创建、修改、评测和优化 skill。
- `达尔文skill`：对已有 skill 做质量审查和迭代优化。

## 使用方式

安装后不用手动点名每个 skill。把 `system-prompt.md` 放进 Agent 的 system prompt 后，Agent 会按任务类型触发对应 skill。

如果你的 Agent 不支持自动触发 skill，也可以在提示词里直接写：

```text
请使用 codex-dev-good-taste 帮我 review 这个项目。
```

或：

```text
请使用 内容风格守门 帮我润色这篇公众号文章。
```

## 注意

- `skill-github-publisher` 里的默认仓库是 `https://github.com/Ivor-NCUT/fanhan-agent-skills`。朋友使用时需要改成自己的仓库地址。
- GitHub 发布依赖本机认证状态。若 GitHub CLI 不可用，需要先配置 token。
- `system-prompt.md` 包含 OpenViking memory 规则。没有 OpenViking 的 Agent 可以保留规则，也可以删掉长期记忆段落。

