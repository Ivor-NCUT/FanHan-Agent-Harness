2026-05-22 22:03:10 CST

- 这次增量 consolidation 只吸收了 `phase2_workspace_diff.md` 里的 3 处 authoritative 变更：`Automation 22` 在 2026-05-18、2026-05-19、2026-05-20 三条 rollout 的 `rollout_path` 全部从 `/Users/fanhan/.codex/sessions/...` 同步改成 `/Users/fanhan/.codex/archived_sessions/...`。
- [`/Users/fanhan/.codex/memories/MEMORY.md`](/Users/fanhan/.codex/memories/MEMORY.md) 已做最小 patch，只更新 `Feishu work-system maintenance from minutes and task routing` block 中对应 3 个 task 的 provenance，没有改动其他 task clustering 或偏好结论。
- [`/Users/fanhan/.codex/memories/memory_summary.md`](/Users/fanhan/.codex/memories/memory_summary.md) 因首行缺少 `v1` 被整份重建为 schema-compatible 索引层；保留跨任务偏好、Feishu/InsForge/skill 稳态提示，并按最近 3 个 memory day 重排 recent window。
- 本轮没有新增或修改 `skills/`；新增信号不足以支持新的可复用流程封装。
- 保留了 xiasu 默认 GitHub 同步偏好到 summary 中：在 `/Users/fanhan/Documents/Codex/项目/夏夏/xiasu` 完成修改后，默认同步到 `Ivor-NCUT/SuXia_IP_WenAn`，除非用户明确说不要 [ad-hoc note]

2026-05-21 22:04:05 CST

- 这次增量 consolidation 吸收了 3 条 2026-05-20 新增 rollout：`interview-led-writing` skill 创建、`wechat-cover-typography-prompt` 从泛提示词改成 GPT image-2 直出 skill 并附带一次招聘海报迭代、以及 `lark-course-xiezuo` 的“语义标题、不用 一/二/三”细规则更新。
- `MEMORY.md` 新增了一个置顶任务组 `Agent Skill / interview-led-writing 与 GPT image-2 微信封面 skill 创建`，把“每次只问一个问题”“先故事线&逻辑线再写正文”“第一个问题永远从为什么想写这个选题开始”“模型指定 GPT image-2 就不要保留多模型表述”“如果能调模型就直接生成图片”等高价值偏好固化下来。
- `Feishu course workflow skills and style defaults` 已补进新的 Task 3，明确 `lark-course-xiezuo` 默认使用语义化中文章节标题，不再回退到 `一、/二、/三、` 风格。
- `memory_summary.md` 已把最近 active window 更新到 `2026-05-20`，新增 `/Users/fanhan/Documents/Codex/Agent Skill` 和 `/Users/fanhan/Documents/New project 2` 的当日 topics，并把 `2026-05-17` 的 `Agent Skill` topics 下沉到 `Older Memory Topics`。

2026-05-16 22:13:48 CST

- 这次增量 consolidation 主要吸收了 2026-05-12 至 2026-05-14 的新增 rollout：新增 `Feishu course workflow skills and style defaults` 任务组，扩展了课程改稿 block（补进第 8/9/10 课）、飞书评论 block（补进“全文评论迁移为划线评论”与 `lark-cli 1.0.29`）、以及 Obsidian 下的 `Agent Native` prompt/content-capture 最新版本。
- `MEMORY.md` 现在显式保留了几条新高价值默认：课程稿的“一段一句、句内 2-5 个短句”节奏、`评论无需保留`、课程协作固定链路 `dbs-deconstruct -> course-editor -> dbs-ai-check -> 飞书评论 -> 可选审查入队`、以及“配图建议默认直接做正文划线评论，不留全文评论区”。
- `memory_summary.md` 已重建最近 active window：`2026-05-14 / Obsidian`、`2026-05-13 / New project 2`、`2026-05-12 / New project 2`；同时补强了跨任务偏好和通用提示，包括飞书评论迁移、课程风格约束、CLI 顺手升级与复核。

2026-05-10 22:10:30 CST

- 这次增量 consolidation 把 6 条新增 rollout summary 合并进 durable memory：新增 `Feishu wiki knowledge routing and batch node creation` 与 `Figma poster visual-upgrade with locked content hierarchy` 两个任务组，并补强了飞书妙记工作系统维护、`obra/superpowers` 安装路径发现与安装提醒。
- `MEMORY.md` 现在覆盖 16 个任务组；新增高价值信号包括：`服务说明书库` 路由规则、`内容作品` 同步、`wiki +node-create` 批量空白课程文档、Automation 22 的 memory/权限阻塞、以及“锁定文案排版只升级视觉质感”的 Figma 设计偏好。
- `memory_summary.md` 已重建最近窗口，新增 2026-05-10 的飞书 Wiki 路由主题、Automation 22 读写默认、GitHub skill installer 真实入口、以及设计任务中的“保留信息层级/文案”偏好。

2026-05-09 22:03:12 CST

- 缺少显式 Automation ID，且当前环境未提供 `$CODEX_HOME`；本次运行改为在记忆仓内写占位 automation 摘要。
- 将 `MEMORY.md` 从 2 个旧主题扩展为 11 个任务组，覆盖 Agent Native Feishu 系统、FunASR 批量转写、Lark CLI 授权、视觉模板/设计规范、Jike 素材同步、WeChat 清理、启发式访谈粗剪、Dumbledore、Cubox、Codex skill 安装/创建、Mac PDF 工具打包。
- 重写 `memory_summary.md`，补全用户画像、跨任务偏好、通用提示，并按最近 3 个 memory day 重建索引窗口。
- 本轮没有新增 `skills/`，因为新增信号主要是已有外部 skill 的使用/创建约束，未出现值得在本记忆仓再封装一层的新稳定流程。

2026-06-08 06:07:08 CST

- 本次增量 consolidation 吸收了 `phase2_workspace_diff.md` 里的两类新信号：新增 rollout `2026-06-03T09-16-17-TK4D-feishu_mail_resume_download_and_yc_folder_classification.md`，以及新增 ad-hoc note `20260607-220131-ppt-visual-qa.md` [ad-hoc note]
- [`/Users/fanhan/.codex/memories/MEMORY.md`](/Users/fanhan/.codex/memories/MEMORY.md) 新增 `大猎头计划 / 飞书邮箱简历下载、垃圾邮件恢复与 YC 公司运营分类` 任务组，沉淀了 `SPAM` 恢复、`attachment from spam mail is restricted` workaround、subject 变体匹配、以及“folder-only / 三个文件夹”交付偏好。
- 同时从 [`/Users/fanhan/.codex/memories/MEMORY.md`](/Users/fanhan/.codex/memories/MEMORY.md) 的 `/各种杂项` 邮箱筛选块移除了那条跨 cwd 的 YC 分类偏好，避免把 `/大猎头计划` 的分类规则误泛化到别的邮箱筛选任务。
- [`/Users/fanhan/.codex/memories/memory_summary.md`](/Users/fanhan/.codex/memories/memory_summary.md) 已更新最近 3 个 memory day 为 `2026-06-07 / 2026-06-06 / 2026-06-04`，新增 `/大猎头计划` recent topic，并把“PPT/deck 交付后逐页 render-to-image 做视觉 QA”提升到跨任务偏好与通用提示 [ad-hoc note]
- 本轮没有新增或修改 `skills/`；新信号更适合进入 durable memory，而不是单独封装成新的本地 skill。
