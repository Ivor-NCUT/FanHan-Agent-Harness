thread_id: 019e54b9-4d74-77f0-a9c6-7a0744ce1f50
updated_at: 2026-05-24T00:57:00+00:00
rollout_path: /Users/fanhan/.codex/sessions/2026/05/23/rollout-2026-05-23T20-04-50-019e54b9-4d74-77f0-a9c6-7a0744ce1f50.jsonl
cwd: /Users/fanhan/Documents/AI 行业求职通识课
git_branch: main

# 用户把《AI 行业求职通识课》从“知识大纲”重排成“按结果交付的三模块课程”，并同步更新了课程相关 skill

Rollout context: 工作目录是 `/Users/fanhan/Documents/AI 行业求职通识课`。用户先要求基于 15 篇飞书咨询记录拟课程课纲，后又补了 3 篇材料（1 篇妙记 + 2 篇 docx），最后明确要求按学习者紧迫程度重排课程模块，并用 `skill-creator` 思路更新 `course-editor-in-chief-fanhan` 和 `lark-course-xiezuo` 两个 skill。

## Task 1: 读取咨询记录并生成课纲初稿

Outcome: success

Preference signals:
- 用户一开始要求“章节数量不少于 20 个”“每个章节需要包含章节标题、内容描述、可引用哪些案例” -> 后续课纲应默认采用“章节标题 + 讲什么 + 案例”这种固定结构，不要只给目录。
- 用户强调“这篇文档的子文档下方都是我的咨询记录，请你阅读完之后，给我列一个课纲” -> 说明这类任务默认应先读真实咨询记录，再做结构化抽取，而不是先空想课程目录。

Key steps:
- 先读取 `course-editor-in-chief-fanhan` 的参考文件，确认课程写作规则、段落节奏和已有文稿精修流程。
- 用 `lark-cli wiki +node-get` 和 `+node-list` 定位 Wiki 入口“咨询文档整理”，再批量 fetch 15 篇子文档。
- 按标题、段落和关键词抽取高频主题，做出 32 章的初版课纲草案，并在本地保存为 `AI行业求职通识课课纲草案.md`。

Reusable knowledge:
- 这条课程线的可靠入口是先用 `wiki +node-get` 定位 wiki 节点，再 `wiki +node-list` 批量拉子文档，最后用 `docs +fetch --api-version v2` 获取正文 markdown。
- 课程写作规则里明确要求：每章要独立成篇，同时与前后章节形成递进，不要写成平铺式知识点列表。

Failures and how to do differently:
- 课纲初稿阶段没有直接写回飞书，因为用户明确说“课纲方向还需要你确认” -> 后续同类任务应把本地草案作为中间产物，先等用户定方向。

References:
- `AI行业求职通识课课纲草案.md` 的初版结构包含 32 章，主题围绕求职判断、行业认知、作品集、触达、面试和 offer 选择。
- 已拉取的咨询记录涵盖 Joanna、Yuki、瑞光、陈矜、汤米琪、子炎、Icey、安琪、PeterH、粽子等人。

## Task 2: 补充三篇材料并扩充新兴岗位与播客素材

Outcome: success

Preference signals:
- 用户明确说“漏发给你了三篇文档，你了解一下这三篇，补充进课纲里吧” -> 后续遇到补充材料时，默认应该把新材料整合进原课纲，而不是另起炉灶。
- 用户后续对“章节标题不要带一、二、三”一类风格约束是明确偏好，已经在之前 rollout 中固化；这次补充材料时也延续了语义化标题。

Key steps:
- 读取两篇 docx：
  - `DUO｜UCL经济硕士｜出海增长`
  - `如何做出逆天的个人作品集？`
- 读取妙记 `Jerry offer 选择` 的总结与转写，提取 offer 比较、PR list、人脉维护、保留后续机会等内容。
- 用这些材料新增了岗位资料研究文档，并在 FDE 目录下写入一篇播客转写。
- 同时把“播客下载 -> 转 wav -> Fun-ASR-Nano 转写 -> 飞书写回”跑通，并新增技术方案文档。

Reusable knowledge:
- 小宇宙公开播客可以用 `yt-dlp` 直接抓到 m4a 音频，再用 `imageio-ffmpeg` 转成 `audio_16k.wav` 送入 Fun-ASR-Nano。
- 33 分钟左右播客在本地 CPU 上转写接近实时，约 30 分钟量级；批量处理时需要队列化和失败重试。

Failures and how to do differently:
- 一开始用 `yt-dlp` 没进 PATH，后来确认可用路径是 `/Users/fanhan/.local/bin/yt-dlp`。
- 部分飞书节点创建遇到 `lock contention`（131009）时，需要换路由或重试，不要把它误判成永久失败。

References:
- 新增资料研究子文档：`资料研究｜AI 产品经理`、`Agent 工程师`、`FDE 前线部署工程师`、`数据百晓生`、`AI 科学家`、`LLM mentor`。
- FDE 播客转写子文档：`播客转写｜FDE 模式在 Agent 浪潮中复活`。
- 技术方案子文档：`技术方案｜播客下载转写写回`。

## Task 3: 按学习者紧迫程度重排课纲，并更新课程 skill

Outcome: success

Preference signals:
- 用户明确提出：“我们做课程的一个核心原则，是在设计大纲时，要让最着急的用户以最快的速度，解决他们想要通过知识解决的问题，完成改变并拿到结果。” -> 后续做课纲/模块设计时，默认要先按“结果速度”排序，而不是按知识树平铺。
- 用户给出清晰的三类学习者：
  - 短期有求职需求的人
  - 半年或一年后考虑转行的人
  - 关注长期职业发展的人
  -> 后续类似课程设计默认可以优先按“紧迫度/结果速度”分层，而不是先铺行业百科。
- 用户说“现有的每个章节内容其实写得都挺好，不需要大改” -> 课纲优化默认应尽量保留已有章节内容，只重排模块和顺序，避免无谓重写。
- 用户要求“完成这些之后，用 skill-creator 优化一下 course-editor-in-chief-fanhan 和 lark-course-xiezuo 两个 Agent skill” -> 后续类似改 skill 任务默认要把新设计原则固化进 skill，而不是只改文档。

Key steps:
- 把课纲重排成 3 个大模块：
  1. 短期求职冲刺：一到两个月内拿到机会
  2. 行业转行准备：半年到一年后进入 AI 行业
  3. 长期职业发展：影响力、迁移能力和创业准备
- 在第 16 章新增独立章节“创始人面前的一对一 pitch 怎么设计”，对应用户明确指出的一线 pitch 动作。
- 把原来偏“行业/岗位百科”的顺序前移或后移，使第一模块先交付求职可行动作：目标公司清单、岗位地图、作品集、简历、触达、面试、offer。
- 用 `skill-creator` 思路更新两个 skill：
  - `course-editor-in-chief-fanhan`：新增“成果优先课纲设计”规则
  - `lark-course-xiezuo`：补充“课纲/模块结构也要按用户结果和紧迫度排序”的检查项

Reusable knowledge:
- 课程大纲设计时可用四个判断：谁最急、第一模块能交付什么、第二模块能否独立给结果、长期内容是否被放在合适后置位置。
- `course-editor-in-chief-fanhan` 现在明确把“成果优先”写进稳定规则：第一、第二模块要分别交付可独立拿走的结果，不能默认用户会学完整门课。
- `lark-course-xiezuo` 现在也支持把“课纲/模块设计”作为工作对象，而不只处理单章正文。

Failures and how to do differently:
- 更新 `references/source.md` 时，第一次 patch 没命中结构，后来通过分段查看文件再补丁成功；类似场景要先定位实际文本再 patch。
- 对 skill 的修改最好同时改：`SKILL.md`、`references/source.md`、以及必要时的检查清单，保证规则能被后续流程稳定继承。

References:
- 课纲最终结构共 47 章，三个模块分别面向短期求职、半年到一年转行、长期职业发展。
- 课程文件：`AI行业求职通识课课纲草案.md`
- 关键章节：第 16 章“创始人面前的一对一 pitch 怎么设计”；第 28 章以后集中转向长期影响力和职业资产。
- 已更新的 skill 文件：
  - `/Users/fanhan/.agents/skills/course-editor-in-chief-fanhan/SKILL.md`
  - `/Users/fanhan/.agents/skills/course-editor-in-chief-fanhan/references/source.md`
  - `/Users/fanhan/.agents/skills/lark-course-xiezuo/SKILL.md`

## Overall takeaway

这轮任务最稳定的可复用结论是：这门《AI 行业求职通识课》不应按“行业知识 -> 岗位百科 -> 长期发展”平铺，而要按“最着急的人最快拿结果”来排。第一模块要让求职者能马上开始行动并拿到可见结果；第二模块再补行业和岗位认知；第三模块再沉淀影响力、弱关系和创业准备。
