v1

## User Profile

用户把 Codex 当执行层，常见任务是把结果真正落到飞书 Base、docx/wiki、飞书网盘、本地压缩包、公开 GitHub 仓库或可直接转发的交付物，不喜欢停在建议。高频工作区是 `/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效`、`/Users/fanhan/Documents/AI 行业求职通识课`、`/Users/fanhan/Documents/Codex/各种杂项`，以及本地 skill 资产整理与发布。

沟通方式偏中文、直接、目标导向。给了链接、表、文档、dashboard、邮箱关键词后，用户默认你去把事情做完；如果对象被纠正，要立刻跟着纠正落点。用户接受务实 fallback，不过仍希望产出真实可交付结果，比如已写回的 Base 记录、已更新的 doc、可分享 zip、可继续编辑的 Feishu 草稿。

用户对知识库、模板、求职辅导文档这类信息载体很敏感，重视结构是否方便人按层浏览，也重视 AI 是否能低 token 检索。招聘、筛选、求职辅导任务里，用户更看重真实项目证据、工作流能力和可直接上手度。

## User preferences

- 和飞书有关的操作一律使用 `lark-cli`；不要改用其他飞书 MCP、网页手动操作或自造 API 调用，除非用户明确要求 [ad-hoc note]
- 当用户纠正 Feishu 链接或说“这里的仪表盘是空的，我希望你搭到这里啊”时，先确认最终对象是 Base、table、dashboard、docx 还是 wiki，再创建，并明确汇报实际落点。
- 当用户给求职咨询类飞书文档并说“文档里有 ta 的简历，你一起下载下来读吧”时，默认把附件简历也拉下来读，不只看表单正文。
- 当用户说“不要写回「求职策略」部分，重新开一份文档”或“新建一份飞书文档发我”时，默认尊重原资料文档，交付独立 doc。
- 当用户说“这是完整录音转的文字，你根据这个修改一下他的/她的报告”时，默认读完整逐字稿，用它纠偏岗位定位和作品集方向，不依赖自动摘要。
- 当用户说知识库要“同时方便人类月度和 AI Agent 查询”时，默认采用“总目录 -> 子目录指引 -> 正文首块摘要”的三层结构，让 AI 先判断值不值得继续读。
- 用户强调“把知识库所有内容都看一遍，那样太费Token了”时，把低 token 检索当成默认约束。
- 会议材料任务里，用户说“把项目和任务都梳理拆解清楚，填入表中”时，默认先结构化拆解，再落成 Base 父记录/子记录，不只给摘要。
- 会议转写里涉及负责人时，按“名字发音相似的人”去通讯录匹配；不按字面硬填，也不猜 open_id。
- skill 交付默认是完整资产交付；如果用户要“传到网盘/飞书文件夹”或“打包成压缩包”，直接产出 zip、上传件或草稿。
- 做本地 skill 清点或邮件分发时，默认拆成“自建 / 下载”两桶；`dbs` / `dontbesilent` 默认算下载来源，正文一 skill 一句话，不把邮件写长。
- 用户说“帮我把这些 skill 都传到一个仓库上吧，设置为 public，写好介绍”时，默认交付真实可访问的公开仓库和 README，不停在本地 zip。
- 交付任何 `PPTX` 或 PDF slide deck 后，默认先逐页渲染成图片并做视觉检查；如果出现文字乱序、裁切、重叠或标点单独挂行，先修源文件再重新导出和复查 [ad-hoc note]
- 发飞书授权或动作链接时，不把 raw URL 放进 code block；优先卡片，其次用简短按钮式链接文案 [ad-hoc note]
- 面向用户的消息不附带 runtime、token、accounting 元数据 [ad-hoc note]

## General Tips

- 飞书相关任务先判断目标载体，再定工具子链路：Base 看字段和父子结构，doc 看 outline 和模板，邮箱筛选先拉全量列表。
- 飞书文档里内嵌附件的下载，优先试 `docs +media-download`；`drive +download` 容易在这类 token 上报 `HTTP 403`。
- `lark-cli docs +create` 在这台机器上更稳的创建方式是 `--content @file`；创建后用 `docs +fetch --scope outline` 或 `--format pretty` 快验。
- 飞书妙记逐字稿要走 `vc +notes --minute-tokens`；如果拿不到 transcript，优先补 `minutes:minutes:readonly` 和 `minutes:minutes.artifacts:read`。
- 已有独立飞书报告需要整篇改写时，`lark-cli docs +update --command overwrite --content @file` 比其他写法稳。
- 这台机器处理 PDF 时，`pdftotext -layout` 比假设 `pypdf` 可用更稳；看到 `ModuleNotFoundError: No module named 'pypdf'` 就切换。
- `lark-cli drive +upload`、`docs +media-download --output`、`auth qrcode --output` 都要求当前目录内的相对路径；看到 `unsafe ... relative path` 就先切目录。
- 这台机器做 skill 校验和打包时，默认用 `python3`，不要先试 `python`。
- 做本地 skill inventory 时，只统计顶层 skill roots；递归扫描会把嵌套插件或依赖副本算重。
- `lark-cli mail +draft-edit` 改大附件时，顺序用“删旧附件 -> 覆写正文 -> 加新附件 -> inspect”，能少踩草稿残留卡片的问题。
- 做 PPTX/PDF deck 交付时，最后一步是“逐页渲染图片 -> 视觉检查 -> 记录页码 -> 修源文件 -> 重导出 -> 再检查”，不是导出完就算结束 [ad-hoc note]
- GitHub、网盘或邮件主路径受阻时，优先给可分享 fallback，例如 Downloads 里的完整 zip、飞书网盘文件，或可继续编辑的 Feishu 草稿。
- `gh` 明明显示已登录却还报 token/auth 错时，先排查 `GH_TOKEN` / `GITHUB_TOKEN` 是否覆盖了 keyring 登录。
- Codex 在 macOS 上反复闪退且日志伴随 Git snapshot 或 index tree 错误时，尽早检查 `/Users/fanhan` 是否误成 Git 仓库。
- 本机清理任务默认先 inventory，再删大文件；Feishu/Lark、WeChat、WeCom 默认视为保护目录，除非用户重新确认。

## What's in Memory

### global / ad-hoc operating preferences

#### 2026-06-07

- PPT / deck visual QA default: PPTX, PDF slide deck, render every slide/page to image, clipped text, overlapped text, punctuation stranded [ad-hoc note]
  - desc: 处理任何 PPTX 或 PDF 幻灯片交付时先搜这里；这是跨项目的默认收尾质检约束，不依赖具体工作区 [ad-hoc note]
  - learnings: 导出完成不算完成；要逐页看图定位问题页码，再回源文件修排版后重导出复查 [ad-hoc note]

### /Users/fanhan/Documents/AI 行业求职通识课

#### 2026-06-06

- 飞书求职策略报告咨询后修订: vc +notes, transcript.txt, docs +update --command overwrite --content @file, toB agent sales, 连接型增长, 内容制片
  - desc: 处理“根据完整录音转写修改他的/她的报告”时先搜这里；适用 `cwd=/Users/fanhan/Documents/AI 行业求职通识课` 的求职咨询报告二次改写
  - learnings: 自动摘要不够用时默认读完整 transcript；先抽“明确不喜欢什么”和“真正兴奋什么”，再重写职业主线和作品集方向

### /Users/fanhan/Documents/Codex/大猎头计划

#### 2026-06-04

- 飞书邮箱全量简历下载与 YC 公司运营三档分类: feishu-mail, mail +triage, mail +messages, attachment from spam mail is restricted, batch_modify, 面试 YC 公司运营, 留学生和211, 普通一本, 普通一本以下
  - desc: 处理“把邮箱里的简历都下载下来”或“把某个标题批次单独分出来并按文件夹分类”时先搜这里；适用 `cwd=/Users/fanhan/Documents/Codex/大猎头计划`
  - learnings: 默认补查 `SPAM`；垃圾邮件附件先移回 `INBOX` 再下；用户明确要 folder-only 时，不额外生成 index/JSON/CSV

### Older Memory Topics

#### /Users/fanhan/Documents/AI 行业求职通识课

- 飞书求职辅导文档与独立求职策略报告首版交付: 求职辅导预先收集信息文档, 求职策略报告, docs +media-download, docs +create, pdftotext -layout, new document
  - desc: 处理“把求职咨询模板改成飞书填写文档”或“基于飞书资料和附件简历写一份完整求职策略报告”时先搜这里；适用 `cwd=/Users/fanhan/Documents/AI 行业求职通识课`

#### /Users/fanhan/Documents/Codex/各种杂项

- 本地 Agent skills 分桶打包、Feishu 邮件与公开仓库发布: feishu mail, skill inventory, self-created, downloaded, dbs, GH_TOKEN, gh repo create, Ivor-NCUT/fanhan-agent-skills
  - desc: 处理“盘点本地 skills、拆成自建和下载两包、写短版邮件、再发布成公开 GitHub 仓库”时先搜这里；适用 `cwd=/Users/fanhan/Documents/Codex/各种杂项`
- 飞书邮箱“实习投递”候选人筛选: mail +triage, mail +messages, download_url, pdftotext, textutil, 夏腾, 朱柯百纯
  - desc: 处理“按邮箱关键词全量拉候选人、读附件、给出排序”时先搜这里；适用同工作区的 Feishu 邮箱筛选

#### /Users/fanhan/Documents/Codex/Agent Skill

- 单个 skill 分享包打包: heuristic-interview-rough-cut-fanhan, zip, unzip -l, .venv, *TEMP_MPY*, Downloads
  - desc: 处理“把一个本地 skill 打包成可分享压缩包”时先搜这里；适用 `cwd=/Users/fanhan/Documents/Codex/Agent Skill`

#### /Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效

- 飞书新租户授权与 profile 切换: lark-cli, tenant switch, auth qrcode, config init --new, profile use, permission-check, missingScopes
  - desc: 处理“换了飞书租户后把工具重新连到正确租户”时先搜这里；适用同工作区的 `lark-cli` 和 `codex-remote-feishu` 授权问题
- Feishu 知识库低 token 结构设计与落地: lark-knowledge-base-builder, 00 知识库总目录, 00 目录指引, 本文摘要, add_article_summaries.py
  - desc: 处理“设计知识库结构”“把导航和摘要真正写进知识库”“把规则沉淀成 skill”时先搜这里；适用同工作区
- 公司例会 PDF 写回飞书项目任务表与沟通备忘录: record-batch-create, 父记录, contact +search-user, docs +update, 沟通备忘录, pdftotext
  - desc: 处理“把会议 PDF 或转写拆成项目父记录/任务子记录写进 Base”或“整理进现有沟通备忘录 docx”时先搜这里；适用 `cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效`
- Feishu Base dashboard 复制到指定空白仪表盘: dashboard-get, dashboard-block-create, dashboard-arrange, combo_layout, unknown block, sort.order, blknCWsbDO6pR5CQ
  - desc: 处理“把一个 Base 的仪表盘重建到另一个指定空白 dashboard”时先搜这里；适用 `cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效`

#### /Users/fanhan/.agents/skills + Feishu Drive

- Agent skill 重命名、打包并同步到飞书网盘: drive +inspect, drive +upload, drive files list, file-token overwrite, KuJmfMOPxlL5h9dzGUtcVShAnUh
  - desc: 处理本地 skill 目录改名、打 zip、上传飞书文件夹、覆盖旧文件时先搜这里；细节可联查 `skills/feishu-skill-drive-sync/SKILL.md`
- 理白 skill GitHub 发布受阻后的 fallback 交付: gh auth status, GH_TOKEN, SSL_ERROR_SYSCALL, Invalid username or token, libai-style-writing-skill.zip, Downloads
  - desc: 处理 skill 发 GitHub 卡在认证或代理，但用户仍要可分享交付物的场景；适用 `.agents/skills` 下独立 skill repo

#### local machine / Codex + macOS maintenance

- Codex 闪退由 home 目录误成 Git 仓库触发: SIGABRT, OOMErrorHandler, DiagnosticReports, Failed to write temporary index tree snapshot, /Users/fanhan/.git
  - desc: 处理 Codex 在这台 macOS 上反复闪退、高内存、Git 日志异常时先搜这里；适用本机 app 故障排查
- macOS 清理与 Git garbage 可恢复性判断: git count-objects -vH, git gc --prune=now, tmutil listlocalsnapshots, git fsck --lost-found
  - desc: 处理“先盘点再清理磁盘空间”以及清理后追问能否恢复的场景；适用本机大容量清理

#### local machine / reusable skills

- GitHub CLI auth recovery: gh auth status, GH_TOKEN, GITHUB_TOKEN, hosts.yml, EOF, SSL_ERROR_SYSCALL, socks5h://127.0.0.1:7890
  - desc: 用 `skills/github-cli-auth-recovery/SKILL.md` 处理这台 macOS 上的 `gh` 登录恢复、token 或 keyring 冲突、代理链路排查；适用 `cwd=local machine / GitHub CLI auth workflow`
- Feishu doc comment writeback: docs +fetch --doc-format markdown, --detail with-ids, drive +add-comment, VALIDATION:1101, docx
  - desc: 用 `skills/feishu-doc-comment-writeback/SKILL.md` 处理“把反馈直接写进飞书文档评论里”的任务；适用 `cwd=local machine / Feishu doc commenting workflow`
- Feishu job strategy report: docs +media-download, docs +create, pdftotext -layout, 求职策略报告, new document
  - desc: 用 `skills/feishu-job-strategy-report/SKILL.md` 处理“给 Feishu 求职资料和附件简历，产出独立求职策略报告”或“根据咨询逐字稿重写既有报告”的任务；适用 `cwd=/Users/fanhan/Documents/AI 行业求职通识课`
- Local skill zip packaging: local-skill-zip-packaging, unzip -l, Downloads, .venv, models
  - desc: 用 `skills/local-skill-zip-packaging/SKILL.md` 处理单个本地 skill 的 clean zip 打包；适用本机本地分享包交付

#### global / ad-hoc operating preferences

- xiasu default GitHub sync: /Users/fanhan/Documents/Codex/项目/夏夏/xiasu, Ivor-NCUT/SuXia_IP_WenAn, git status, remote, branch [ad-hoc note]
  - desc: 记录 xiasu 项目完成修改后的默认 GitHub 同步约定；适用 `cwd=/Users/fanhan/Documents/Codex/项目/夏夏/xiasu` [ad-hoc note]
- skill repo policy: one skill per repo, public repo, .venv, 模型缓存, 转写产物 [ad-hoc note]
  - desc: 处理 skill 发布到 GitHub 时的默认仓库边界和排除清单；没有明示例外时按“一 skill 一仓库”执行 [ad-hoc note]
- Feishu link formatting and message hygiene: 飞书链接, card, button-like link text, runtime metadata, token/accounting [ad-hoc note]
  - desc: 处理面向用户的飞书链接发送方式和消息格式约束；不贴 raw URL code block，也不带 runtime、token、accounting 元数据 [ad-hoc note]
- merged material progress table default target: 素材进度表&点评表（合并）, tblbFVsb25Ew0Ygt, 比比, 靠谱, 董董, 彩卉, 富贵 [ad-hoc note]
  - desc: 星辰文化素材进度任务的默认落点索引；用户只说“更新素材进度、字段、数据”时，先想到合并表 [ad-hoc note]
- lark-cli only for Feishu work: lark-cli, 飞书文档, 云空间, 即时消息, 多维表格, 日历, 任务, 审批 [ad-hoc note]
  - desc: 记录飞书类操作的默认工具约束；没有明示例外时，用 `lark-cli` 处理飞书相关工作 [ad-hoc note]
- resume batch folder-only classification: 面试 YC 公司运营, 留学生和211, 普通一本, 普通一本以下, no index/json/csv [ad-hoc note]
  - desc: 这条偏好现在已有 `/Users/fanhan/Documents/Codex/大猎头计划` 的任务块承接；这里只保留 ad-hoc 检索入口 [ad-hoc note]
- PPT / deck visual QA default: PPTX, PDF slide deck, render-to-image, clipped text, overlapped text [ad-hoc note]
  - desc: 记录任何 deck 交付都要做逐页图片化视觉 QA 的默认约束；无论在哪个工作区做 PPT/PDF 都可先搜这里 [ad-hoc note]
