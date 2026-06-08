# Task Group: AI 行业求职通识课 / 飞书求职辅导文档、独立求职策略报告与咨询后修订

scope: 处理“基于飞书 Wiki/docx、表单信息、附件简历和咨询妙记，产出求职辅导模板、独立求职策略报告或在既有独立报告上做咨询后修订”的任务；重点是先把源文档、附件和逐字稿读全，再按用户要求选择“新建独立文档”还是“覆盖既有独立报告”
applies_to: cwd=/Users/fanhan/Documents/AI 行业求职通识课; reuse_rule=safe for similar Feishu-based job-consulting document creation and revision in this workspace, but always re-check whether the user wants a fill-in template, a first-pass strategy report, or a transcript-driven revision of an existing standalone doc

## Task 1: 将个人 IP 自审表改造成求职辅导预先收集信息文档并落成飞书，success

### rollout_summary_files

- rollout_summaries/2026-05-27T01-53-25-rcAe-job_search_intake_feishu_template.md (cwd=/Users/fanhan/Documents/AI 行业求职通识课, rollout_path=/Users/fanhan/.codex/sessions/2026/05/27/rollout-2026-05-27T09-53-25-019e6722-f769-7b00-af17-31b6f6fe3e9e.jsonl, updated_at=2026-05-27T01:58:24+00:00, thread_id=019e6722-f769-7b00-af17-31b6f6fe3e9e, converted two IP self-audit docx files into a Feishu fill-in template for job-search consulting)

### keywords

- lark-cli, docs +create, docs +fetch, markdown导入, docx解析, 求职辅导预先收集信息文档, 个人品牌, 岗位定位, 飞书文档, outline

## Task 2: 读取飞书资料与附件简历，先生成独立求职策略报告，再按完整咨询逐字稿修订杨睿报告，success

### rollout_summary_files

- rollout_summaries/2026-06-03T11-43-09-aMDT-yang_rui_ai_career_strategy_consultation_revision.md (cwd=/Users/fanhan/Documents/AI 行业求职通识课, rollout_path=/Users/fanhan/.codex/sessions/2026/06/03/rollout-2026-06-03T19-43-09-019e8d4b-66cd-7fd0-8241-a978512e5dd9.jsonl, updated_at=2026-06-06T09:58:56+00:00, thread_id=019e8d4b-66cd-7fd0-8241-a978512e5dd9, created an independent report from wiki+resume, then rewrote it after reading the full consultation transcript)

### keywords

- lark-cli, wiki +node-get --node-token, docs +fetch, docs +media-download, docs +create, docs +update, pdftotext -layout, vc +notes, minutes auth, transcript.txt, toB agent sales, solution sales, FDE, 求职策略报告, new document, unsafe output path, HTTP 403

- Related skill: skills/feishu-job-strategy-report/SKILL.md

## Task 3: 读取两段咨询妙记并重写小晴的独立求职策略报告，success

### rollout_summary_files

- rollout_summaries/2026-06-03T11-47-04-PARt-xiaoqing_career_report_rewrite_from_consultation_transcripts.md (cwd=/Users/fanhan/Documents/AI 行业求职通识课, rollout_path=/Users/fanhan/.codex/sessions/2026/06/03/rollout-2026-06-03T19-47-04-019e8d4e-fafc-7310-9e23-d72159afff3b.jsonl, updated_at=2026-06-06T09:57:57+00:00, thread_id=019e8d4e-fafc-7310-9e23-d72159afff3b, rewrote an existing standalone report from two Feishu minutes transcripts and updated the same doc)

### keywords

- lark-cli, vc +notes, minutes:minutes:readonly, minutes:minutes.artifacts:read, transcript.txt, docs +update --command overwrite --content @file, 小晴, 连接型增长, 内容制片, 投资内容, 基金媒体团队, 飞书内容, 开发者活动, COO/CMO, talent

- Related skill: skills/feishu-job-strategy-report/SKILL.md

## User preferences

- 当用户说“整理成一份求职辅导的预先收集信息文档，用飞书文档输出”时，未来同类任务默认直接交付可填写的飞书文档，不停在概念建议或本地草稿 [Task 1]
- 当用户强调“参考这份文档的格式让用户填写信息”时，未来同类模板保留“分区 + 表格 + 引导问题”的填写感，不改成散文说明 [Task 1]
- 当用户说“文档里有 ta 的简历，你一起下载下来读吧”时，未来同类求职报告默认把附件简历一起拉下来读，不只看表单正文或链接预览 [Task 2]
- 当用户纠正“不要写回「求职策略」部分，重新开一份文档”或“新建一份飞书文档发我”时，未来同类交付默认尊重原资料文档，优先新建独立报告；如果后续是“根据这个修改一下他的/她的报告”，则覆盖那份独立报告，不碰原模板 [Task 2][Task 3]
- 当用户要“写一份求职策略报告”时，未来默认交付可直接转发的完整报告，至少覆盖定位、作品、故事、触达和行动计划，不只给建议摘要 [Task 2]
- 当用户说“这是完整录音转的文字，你根据这个修改一下他的/她的报告”时，未来同类任务默认读完整逐字稿，不依赖自动摘要，也不沿用第一次报告的定位不动 [Task 2][Task 3]
- 当咨询逐字稿里出现“会做但不想长期做”的强信号，例如“小红书会做，但不喜欢帮别人做运营”，未来写报告时把它降级成证据，不要继续把它写成主定位 [Task 3]

## Reusable knowledge

- 这类工作流现在有三条稳定链路：模板改写任务用“先本地写 Markdown，再 `docs +create --content @file` 导入飞书，再用 outline 验收”；首版报告交付用“先解析 wiki/docx，再下载附件，再本地成稿，再新建独立 doc”；咨询后修订用“先读完整妙记逐字稿，再重写既有独立报告，并用 `docs +update --command overwrite --content @file` 覆盖” [Task 1][Task 2][Task 3]
- 飞书 Wiki 链接先用 `lark-cli drive +inspect --url '<wiki-url>'` 或 `lark-cli wiki +node-get --node-token '<wiki-url-or-token>'` 解析成真实 docx token，会比凭记忆猜参数稳；杨睿这次实际解析到 `JPNtdoa0PoNKnkxZLv2cJgfAnyf` [Task 2]
- 读取正文时，`lark-cli docs +fetch --api-version v2 --doc <token-or-url>` 能直接暴露文档内 `<figure view-type="Preview"><source ... token="..."/></figure>` 这类附件线索，适合提取简历 token [Task 2]
- 文档内嵌附件的下载优先走 `lark-cli docs +media-download --token <file_token> --type media --output <relative_path> --overwrite`；同样的 token 用 `drive +download` 可能报 `HTTP 403`，`--output` 传绝对路径还会报 `unsafe output path` [Task 2]
- 这台机器上读 PDF 简历的稳妥方式仍是 `pdftotext -layout`；June 3 的求职报告链路都靠这条链路拿到了可分析的正文 [Task 2]
- 读取飞书妙记逐字稿、总结、章节和待办，要走 `vc +notes --minute-tokens <minute_token>`，不是只用 `minutes minutes get`；如果缺 scope，先补 `minutes:minutes:readonly` 和 `minutes:minutes.artifacts:read` [Task 2][Task 3]
- 在这个环境里，`docs +create` 的核心稳定参数是 `--content @file`；`docs +update` 的稳定覆盖写法是 `--command overwrite --content @file`。模板型 Markdown 可以带 `--doc-format markdown`；长报告直接用本地 Markdown 或 XML 文件也能创建成功。创建或覆盖后用 `docs +fetch --scope outline` 或 `--format pretty` 做验收最快 [Task 1][Task 2][Task 3]
- 求职辅导模板的稳定栏目已经验证可复用：基本信息、求职目标与市场定位、职业资产盘点、个人品牌故事、求职竞品与对标、岗位定位 6 问、求职传播素材盘点、当前求职漏斗、辅导期待与边界、填写完成后的自检 [Task 1]
- 求职策略报告的稳定结构已经验证可复用：候选人画像、职业定位、作品集规划、个人故事包装、触达策略、四周行动计划、面试准备、最终建议；候选人定位要根据简历里的真实可迁移经历和咨询逐字稿里的真实偏好来收敛，不要一上来按算法、纯工程或单一岗位标签写 [Task 2][Task 3]
- 杨睿这类候选人，咨询后更稳的主线是 `面向企业客户的 Agent 产品解决方案型销售 / 顾问型销售`，而不是 FDE-first；小晴这类候选人，咨询后更稳的主线是“连接型增长 / 内容制片 / 投资内容 / 早期团队二号位”，不是“智能陪伴产品经理”这种过窄岗位名 [Task 2][Task 3]

## Failures and how to do differently

- 症状：把飞书 URL 当位置参数传给 `drive +inspect` 或 `wiki +node-get`。原因：命令要求显式 `--url` / `--node-token`。修正：解析 wiki/doc 入口时先看 help，`drive +inspect` 固定带 `--url`，`wiki +node-get` 固定带 `--node-token` [Task 2]
- 症状：对文档内嵌附件使用 `drive +download` 直接报 `download failed: HTTP 403`。原因：这类 token 属于 doc 媒体链路。修正：切到 `docs +media-download`，并把输出路径改成当前目录内的相对路径 [Task 2]
- 症状：`docs +create` 因为传了 `--format` 或 `--markdown` 失败，还出现 `--content is required`；`docs +update` 用 `--markdown` 也会校验失败。原因：本机这版 CLI 的创建/覆盖接口实际依赖 `--content @file`。修正：不要再附加无效参数，长文创建或覆盖都直接用 `@file` 链路 [Task 1][Task 2][Task 3]
- 症状：先尝试把报告写回原 Wiki，用户马上叫停。原因：默认假设了“回写原文档”。修正：求职咨询类交付先确认“回写原文档”还是“新建独立文档”；用户没明确说覆盖原文档时，优先新建；后续若用户让“修改一下他的/她的报告”，再覆盖独立报告 [Task 2][Task 3]
- 症状：只看妙记自动摘要就开始改报告。原因：自动摘要可能只覆盖局部，例如杨睿那次只突出 GAP 片段。修正：咨询后修订默认读完整 transcript，再提炼“真正喜欢什么 / 明确不喜欢什么 / 被建议的岗位主线” [Task 2][Task 3]
- 症状：第一次职业定位写得过窄，例如把小晴写成“智能陪伴 / 社交 / 游戏产品经理”。原因：沿用了第一次静态报告的结构，没有先让逐字稿纠偏。修正：先抽取“她明确不喜欢什么”和“她真正兴奋什么”，再决定主标签 [Task 3]
- 症状：想用 `pandoc` 直接读 `.docx`，环境里却没有该命令。原因：不能假设本机装了文档转换工具。修正：模板迁移任务继续用 zip+xml 解析 docx，或走已验证的飞书文档技能链路 [Task 1]

# Task Group: 大猎头计划 / 飞书邮箱简历下载、垃圾邮件恢复与 YC 公司运营分类

scope: 处理“从飞书邮箱批量下载简历附件、补捞 SPAM 里的简历、再把特定邮件标题批次单独筛出并按要求分文件夹”的任务；重点是先全量捞取，再处理垃圾邮件限制，最后按用户指定的最简交付结构落地
applies_to: cwd=/Users/fanhan/Documents/Codex/大猎头计划; reuse_rule=safe for similar Feishu-mail resume collection and classification work in this workspace, but always re-check mailbox query scope, folder coverage, and whether the user wants raw downloads, a dedicated title batch, or a folder-only classified deliverable

## Task 1: 下载飞书邮箱全部简历附件，并把 SPAM 里的误判简历一并捞回，success

### rollout_summary_files

- rollout_summaries/2026-06-03T09-16-17-TK4D-feishu_mail_resume_download_and_yc_folder_classification.md (cwd=/Users/fanhan/Documents/Codex/大猎头计划, rollout_path=/Users/fanhan/.codex/sessions/2026/06/03/rollout-2026-06-03T17-16-17-019e8cc4-f0a5-75f3-8ca7-e08077b1078f.jsonl, updated_at=2026-06-04T00:41:20+00:00, thread_id=019e8cc4-f0a5-75f3-8ca7-e08077b1078f, downloaded 37 mailbox resume attachments and recovered spam-bucketed resumes by moving messages into INBOX)

### keywords

- lark-cli, feishu-mail, mail +triage, mail +messages, attachment_ids, download_url, user_mailboxes profile, user_mailbox.messages batch_modify, SPAM, attachment from spam mail is restricted, 简历, resume, 候选人, fanhan@aimanziyi.vip

## Task 2: 单独筛出“面试 YC 公司运营”邮件批次并按三档学历文件夹分类交付，success

### rollout_summary_files

- rollout_summaries/2026-06-03T09-16-17-TK4D-feishu_mail_resume_download_and_yc_folder_classification.md (cwd=/Users/fanhan/Documents/Codex/大猎头计划, rollout_path=/Users/fanhan/.codex/sessions/2026/06/03/rollout-2026-06-03T17-16-17-019e8cc4-f0a5-75f3-8ca7-e08077b1078f.jsonl, updated_at=2026-06-04T00:41:20+00:00, thread_id=019e8cc4-f0a5-75f3-8ca7-e08077b1078f, created a dedicated YC batch with exactly three class folders and no extra metadata files)

### keywords

- 面试 YC 公司运营, YC公司运营简历分类_20260604, 留学生和211, 普通一本, 普通一本以下, folder-only deliverable, no index/json/csv, non-breaking space, +triage --filter '{\"folder_id\":\"SPAM\"}', mkdir -p

## User preferences

- 当用户说“把我飞书邮箱里所有简历都下载下来给我”时，未来同类任务默认做全量简历收集，不抽样、不只看部分关键词命中 [Task 1]
- 当用户追问“垃圾邮箱检查了不？有的简历不小心被归类到垃圾邮件里了”时，未来简历收集默认显式检查 `SPAM`，把误判简历一并捞回 [Task 1]
- 当用户说“筛选一下所有邮件标题带‘面试 YC 公司运营’的标题吧，我需要单独有一份这一批的。”时，未来同类任务默认单独产出这一批，不混在总简历包里 [Task 2]
- 当用户说“我希望你直接输出为三个文件夹、里面一堆简历就行，其它的不用做成文件。”时，未来同类简历分类默认只交付用户要的文件夹结构，不额外生成 CSV、JSON、TXT 或索引文件 [Task 2]
- 当用户补一句“这个任务习惯写进 memory.” 时，说明上面的 folder-only 交付偏好是明确要长期保留的 [Task 2]
- 当用户指定“留学生和211 / 普通一本 / 普通一本以下”时，未来这一类 YC 公司运营简历分类沿用这套三分法，除非用户重新改口 [Task 2]

## Reusable knowledge

- 飞书邮箱简历批量收集的稳定链路是：先用 `lark-cli mail user_mailboxes profile --as user --params '{"user_mailbox_id":"me"}'` 确认邮箱身份，再用 `mail +triage --query '<关键词>' --max 400 --format json` 拉消息集合，最后用 `mail +messages --message-ids ... --html=false --format json` 批量取正文和附件元数据 [Task 1]
- 这次用于扫简历的关键词集合是 `简历`、`resume`、`投递`、`求职`、`CV`、`应聘`、`候选人`、`作品集`；合并后得到 47 个唯一 message IDs [Task 1]
- 附件下载 schema 需要 `user_mailbox_id`、`message_id`、`attachment_ids`；实际下载前先看 `lark-cli schema mail.user_mailbox.message.attachments.download_url --format json` 能避免猜参数 [Task 1]
- Feishu 对垃圾邮件附件有硬限制，报错就是 `attachment from spam mail is restricted`；可行 workaround 是先用 `user_mailbox.messages batch_modify` 把对应消息加回 `INBOX`，再重跑下载 [Task 1]
- 这次总简历下载的落点是 `/Users/fanhan/Documents/Codex/大猎头计划/飞书邮箱简历附件/飞书邮箱简历附件_20260603.zip`，最终 `37` 个附件、`0` 个失败 [Task 1]
- “面试 YC 公司运营”这批邮件的 subject 匹配要同时检查普通空格和 non-breaking space；再配合 `+triage --filter '{"folder_id":"SPAM"}'` 能把最初漏掉的匹配补回来，消息数从 `28` 扩到 `44` [Task 2]
- 这次 YC 批次里有 `23` 封带附件邮件、`27` 个附件；提取 PDF / DOCX 文本就足够判断学校背景，不需要在最终交付里保留额外元数据 [Task 2]
- 最终分类目录是 `/Users/fanhan/Documents/Codex/大猎头计划/YC公司运营简历分类_20260604`，且顶层只保留三个子文件夹：`1_留学生和211`=`18`、`2_普通一本`=`5`、`3_普通一本以下`=`4` [Task 2]
- 一个发件人可能附多个简历文件；分类时保持同一发件人的附件一起进入同一层级文件夹更稳 [Task 2]

## Failures and how to do differently

- 症状：垃圾邮件里的附件下载直接失败，报 `attachment from spam mail is restricted`。原因：Feishu 禁止直接下载 SPAM 附件。修正：先 `batch_modify` 把消息移到 `INBOX`，再重试下载 [Task 1]
- 症状：下载链接接口偶发 timeout。原因：这条链路本身不稳定。修正：先解决 SPAM 限制，再重试下载，不要误判成参数错误 [Task 1]
- 症状：最初只搜到一部分“面试 YC 公司运营”邮件。原因：标题里同时存在普通空格和 non-breaking space，且还有 SPAM 命中。修正：subject 变体和 `SPAM` 过滤都要覆盖 [Task 2]
- 症状：第一次写 subject-filter 结果时目录不存在。原因：提前写文件，没有先建输出目录。修正：这类单独批次任务先 `mkdir -p` 再写任何中间产物 [Task 2]
- 症状：任务过程中一度生成了索引/元数据的惯性方案。原因：沿用了更通用的邮件下载交付模板。修正：用户已经明确说“其它的不用做成文件”时，立刻收窄为 folder-only 交付 [Task 2]

# Task Group: 本地 Agent skills / 清点分桶打包、Feishu 邮件与 GitHub 公开发布

scope: 处理“盘点本地 Agent skills、区分自建与下载、分别打包、写飞书邮件，并在需要时发布成公开 GitHub 仓库”的任务；重点是先把技能来源分桶，再控制邮件正文长度，并在发布前清理环境变量和运行时垃圾
applies_to: cwd=/Users/fanhan/Documents/Codex/各种杂项 or local skill inventory, Feishu mail delivery, and collection-style GitHub publish workflow; reuse_rule=safe for similar local skill inventory and share/publish work on this machine, but always re-check top-level skill roots, ambiguous provenance, mailbox availability, current Feishu scopes, and whether the user wants a collection repo or single-skill repo

## Task 1: 盘点本地 skills、分成两个压缩包并写给 Kiki 的短版 Feishu 邮件，success

### rollout_summary_files

- rollout_summaries/2026-06-01T13-26-21-Dz4K-feishu_email_skill_packaging_and_public_github_publish.md (cwd=/Users/fanhan/Documents/Codex/各种杂项, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T21-26-21-019e835d-28ee-7f51-9d2c-fb316252f16a.jsonl, updated_at=2026-06-03T04:08:32+00:00, thread_id=019e835d-28ee-7f51-9d2c-fb316252f16a, packaged split archives, corrected `dbs` provenance, and stabilized the Feishu draft)

### keywords

- lark-cli, feishu mail, feishu minutes, skill inventory, zip packaging, self-created, downloaded, dbs, draft-edit, attachment, fanhan@aimanziyi.vip, OTIyYTI1ZDktZTcyYS00NjYzLWFmNjctNzYxYmE2MjNmMTI0, fanhan-self-created-agent-skills-20260601.zip, downloaded-agent-skills-20260601.zip

## Task 2: 把 skill 集合发布到公开 GitHub 仓库并写 README 介绍，success

### rollout_summary_files

- rollout_summaries/2026-06-01T13-26-21-Dz4K-feishu_email_skill_packaging_and_public_github_publish.md (cwd=/Users/fanhan/Documents/Codex/各种杂项, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T21-26-21-019e835d-28ee-7f51-9d2c-fb316252f16a.jsonl, updated_at=2026-06-03T04:08:32+00:00, thread_id=019e835d-28ee-7f51-9d2c-fb316252f16a, created and pushed a public collection repo with README service links)

### keywords

- gh auth status, GH_TOKEN, GITHUB_TOKEN, gh repo create, public repo, Ivor-NCUT/fanhan-agent-skills, README links, CATALOG.json, self-created/, downloaded/, users.noreply.github.com

## User preferences

- 当用户先说“列出我构建的、安装的所有 agent skill，把它们每个都打包成压缩包，并给它们每个都写一段介绍”，后面又要求发邮件时，未来同类分享任务默认同时准备“可交付文件 + 正文说明”，不只给清单 [Task 1]
- 当用户说“邮件的开头可以写上‘哈喽 kiki，我是泛函的 codex……’这样的表达”时，类似对内邮件默认用轻松开头，不写成公函口吻 [Task 1]
- 当用户说“邮件内容你改一改，我希望每个 skill 的介绍一起写在正文里”时，类似邮件默认把 skill 介绍直接写进正文，不只放附件 [Task 1]
- 当用户纠正“带 dbs 的 skill 是我从别人那里下载的”时，未来只要做本地 skill 来源分类，`dbs` / `dontbesilent` 默认算下载来源，除非用户另行说明 [Task 1]
- 当用户说“帮我把这些 skill 都传到一个仓库上吧，设置为 public，写好介绍”时，未来类似任务默认交付真实可访问的公开仓库和 README，不停在本地 zip [Task 2]
- 当用户要求把某个 Agent skill 更新到 GitHub 或发布到 GitHub 时，默认一 skill 一仓库，不把多个 skill 塞进同一个总仓库；推送前仍要排除 `.venv/`、模型缓存、测试输出、音视频素材、转写产物等运行时文件 [Task 2][ad-hoc note]

## Reusable knowledge

- 这台机器上本地 skills 的主搜索根是 `/Users/fanhan/.agents/skills` 和 `/Users/fanhan/.codex/skills`；盘点时要排除 `~/.codex/skills/.system` 这类系统目录 [Task 1]
- 盘点 skill 最稳的入口是找 `SKILL.md`，但要限制在顶层 skill 根内；直接递归扫描会把插件/依赖里的嵌套 skill 副本也算进去，导致统计虚高 [Task 1]
- `lark-cli mail user_mailboxes profile --as user --params '{"user_mailbox_id":"me"}'` 先确认当前邮箱身份最稳；这次主邮箱是 `fanhan@aimanziyi.vip`，不要凭印象写成别的地址 [Task 1]
- 这次跑通的交付链路是：盘点 -> 过滤嵌套副本 -> 按来源分桶 -> 生成两个总压缩包 -> `unzip -t` 校验 -> 写 / 改 Feishu draft [Task 1]
- 这次最终两个聚合包名是 `fanhan-self-created-agent-skills-20260601.zip` 和 `downloaded-agent-skills-20260601.zip`，更正 `dbs` 后的最终数量是自建 `27`、下载 `92` [Task 1]
- `lark-cli mail +draft-edit` 这条链路里，`set_body`、`remove_attachment`、`add_attachment`、`--inspect` 都实际可用；同一个 draft 可以原地改 body 和附件，不必新建草稿 [Task 1]
- Feishu Minutes 这次拿不到转写权限，缺的是 `minutes:minutes:readonly`、`minutes:minutes.artifacts:read`、`minutes:minutes.transcript:export`；这类发邮件任务不该预设会议转写一定可读 [Task 1]
- `gh auth status` 如果显示 keyring 登录是好的，但命令仍报 token 问题，先检查是不是环境变量 `GH_TOKEN` / `GITHUB_TOKEN` 抢占了认证；这次 `env -u GH_TOKEN -u GITHUB_TOKEN gh repo create ... --public --source=. --remote=origin --push` 跑通了 [Task 2]
- 这次公开仓库最终是 `https://github.com/Ivor-NCUT/fanhan-agent-skills`，本地工作树在 `/Users/fanhan/Documents/Codex/各种杂项/fanhan-agent-skills`，README 带了两个 Feishu 服务链接，目录结构是 `self-created/`、`downloaded/`、`CATALOG.json` [Task 2]
- 如果仓库内还没有 git 身份，先在 repo 本地设置 GitHub noreply 邮箱；这次用的是 `71737444+Ivor-NCUT@users.noreply.github.com` [Task 2]

## Failures and how to do differently

- 症状：盘点结果比预期多出一批 skill。原因：递归扫描把嵌套插件/依赖副本也算进去了。修正：未来只统计顶层 skill roots，下游压缩包也只从顶层清单生成 [Task 1]
- 症状：来源分类里把一部分 `dbs` 算成了自建。原因：按目录观察做了错误归因。修正：对来源不明显的 skill 先留待确认，至少把 `dbs` / `dontbesilent` 预设成下载来源 [Task 1]
- 症状：附件替换后，Feishu 草稿正文里还残留旧下载卡片文本。原因：大附件编辑会留下 draft projection 噪音。修正：先删旧附件，再覆写正文，再加新附件，每步后都 `--inspect` [Task 1]
- 症状：想从 Minutes 里补邮件内容却直接失败。原因：当前账号 scope 不足。修正：这类任务优先用本地 skill 文件和用户已给上下文，不要把 Minutes 当必需前置 [Task 1]
- 症状：`gh` 看起来已经登录，却仍然报 token/auth 错。原因：坏掉的 `GH_TOKEN` / `GITHUB_TOKEN` 覆盖了 keyring 登录。修正：先 unset 这两个环境变量，再重跑 `gh auth status` 和发布命令 [Task 2]
- 症状：第一次提交把样例 mp4 一起推上去了。原因：仓库初始化时没有先排除媒体和运行时文件。修正：提交前先看 `git status`，补 `.gitignore`，必要时删掉再修正提交 [Task 2]
- 症状：`git config --get user.name` / `user.email` 为空，导致 repo 无法直接提交。原因：这个新仓库没有本地提交身份。修正：发布前先设本地 git identity [Task 2]

# Task Group: 本地 Agent skills / 单个 skill 分享包打包

scope: 处理“把一个本地 skill 打包成可分享压缩包”的任务；重点是主动排除运行时垃圾，并把压缩包做成跨机器更稳的英文顶层目录
applies_to: cwd=/Users/fanhan/Documents/Codex/Agent Skill or local skill packaging workflow on this machine; reuse_rule=safe for similar one-skill zip delivery work across `/Users/fanhan/.codex/skills` and `/Users/fanhan/.agents/skills`, but always re-check whether the user wants local zip only, Feishu upload, or GitHub publish

## Task 1: 将 `启发式访谈口播粗剪@泛函` 打成可分享 zip 并放到 Downloads，success

### rollout_summary_files

- rollout_summaries/2026-06-02T03-43-54-eyA1-skill_packaging_heuristic_interview_rough_cut_zip.md (cwd=/Users/fanhan/Documents/Codex/Agent Skill, rollout_path=/Users/fanhan/.codex/sessions/2026/06/02/rollout-2026-06-02T11-43-54-019e866e-477b-7773-8583-843e03bad111.jsonl, updated_at=2026-06-02T03:45:38+00:00, thread_id=019e866e-477b-7773-8583-843e03bad111, produced a clean shareable zip with an English top-level folder)

### keywords

- zip, skill-packaging, Downloads, unzip -l, .venv, __pycache__, .cache, *TEMP_MPY*, models, heuristic-interview-rough-cut-fanhan, /Users/fanhan/.codex/skills/启发式访谈口播粗剪@泛函

## User preferences

- 当用户直接说“把这个skill打包成压缩包”时，未来同类任务默认直接产出可分享 zip 文件，不停在说明步骤 [Task 1]

## Reusable knowledge

- 单个 skill 打包前先看目录里有没有 `.venv`、缓存、临时渲染视频、模型文件；这次源目录体积到 `1.0G`，真正要交付的只有 `SKILL.md`、`agents/openai.yaml`、`scripts/*.py` [Task 1]
- 这类分享包默认排除 `.venv`、`__pycache__`、`.DS_Store`、`*TEMP_MPY*`、`models`、`.cache`，能把包压到真正可分享的体积 [Task 1]
- 如果源目录名是中文或特殊字符，压缩包里的顶层目录改成英文 slug 更稳；这次最终用的是 `heuristic-interview-rough-cut-fanhan/` [Task 1]
- 最后用 `unzip -l` 做内容校验，确认压缩包里只有预期的 skill 资产 [Task 1]
- Related skill: skills/local-skill-zip-packaging/SKILL.md [Task 1]

## Failures and how to do differently

- 症状：第一次 zip 虽然可用，但顶层目录是中文名。原因：直接按源目录打包。修正：先 staged 到英文目录名再重打，减少不同解压工具的显示问题 [Task 1]
- 症状：skill 目录看起来异常大。原因：夹带 `.venv` 和临时产物。修正：打包前先做排除清单，不要把运行时垃圾一起发出去 [Task 1]

# Task Group: 各种杂项 / 飞书邮箱候选人筛选与附件抽文

scope: 处理“从飞书邮箱按关键词拉候选邮件、读正文和附件、给出排序”的任务；重点是先全量拉取，再用附件原文和作品证据做判断
applies_to: cwd=/Users/fanhan/Documents/Codex/各种杂项 or Feishu mailbox screening workflow on this machine; reuse_rule=safe for similar candidate-screening tasks in this mailbox context, but always re-check mailbox identity, search query, and whether attachments need local text extraction

## Task 1: 检索“实习投递”候选邮件并读取正文，success

### rollout_summary_files

- rollout_summaries/2026-06-01T13-29-36-NZog-feishu_mail_resume_screening_vibecoding_agent_skill.md (cwd=/Users/fanhan/Documents/Codex/各种杂项, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T21-29-36-019e8360-22e2-7892-90b7-2f3034ac76fc.jsonl, updated_at=2026-06-01T13:38:32+00:00, thread_id=019e8360-22e2-7892-90b7-2f3034ac76fc, pulled all matching mails and filtered candidate messages)

### keywords

- lark-cli, mail +triage, mail +messages, user_mailboxes profile, 实习投递, message-ids, mailbox me, fanhan@aimanziyi.vip, vibe coding, Agent skill

## Task 2: 下载附件并抽取 PDF/docx/pptx/rar 文本，success

### rollout_summary_files

- rollout_summaries/2026-06-01T13-29-36-NZog-feishu_mail_resume_screening_vibecoding_agent_skill.md (cwd=/Users/fanhan/Documents/Codex/各种杂项, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T21-29-36-019e8360-22e2-7892-90b7-2f3034ac76fc.jsonl, updated_at=2026-06-01T13:38:32+00:00, thread_id=019e8360-22e2-7892-90b7-2f3034ac76fc, built a local searchable corpus from attachments and message bodies)

### keywords

- download_url, attachment_ids, pdftotext -layout, textutil -convert txt -stdout, bsdtar -xf, unzip -qq, .tmp_intern_resumes, pdf-to-text, docx extraction, rar

## Task 3: 按岗位画像排序并给出可执行建议，success

### rollout_summary_files

- rollout_summaries/2026-06-01T13-29-36-NZog-feishu_mail_resume_screening_vibecoding_agent_skill.md (cwd=/Users/fanhan/Documents/Codex/各种杂项, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T21-29-36-019e8360-22e2-7892-90b7-2f3034ac76fc.jsonl, updated_at=2026-06-01T13:38:32+00:00, thread_id=019e8360-22e2-7892-90b7-2f3034ac76fc, ranked candidates against vibe-coding, Feishu, and Agent-skill evidence)

### keywords

- 夏腾, 朱柯百纯, 吴昕如, 郭澳林, 刘舒扬, 飞书多维表格, SOP, Claude Code, Codex, RAG, workflow, ranking

## User preferences

- 当用户说“查看一下我的飞书邮箱里带‘实习投递’这个关键词的所有邮件和里面的简历附件，告诉我谁最适合”时，未来同类任务默认先做全量候选检索，再比较正文和附件，不抽几封样本就下结论 [Task 1]
- 当用户给出筛选条件“有一定的 vibe coding 能力，擅长用飞书和飞书多维表格，能写 Agent skill”时，未来排序优先看 AI/Agent/工作流的实证，不把学历或泛运营经历放在前面 [Task 1][Task 3]
- 用户要的是“谁最适合”的直接判断；类似招聘筛选先给明确排序和一句话理由，再给备选和下一步建议 [Task 3]
- 和飞书有关的操作一律使用 `lark-cli` 处理，包括飞书文档、云空间、即时消息、多维表格、日历、任务、审批等；不要切到别的飞书 MCP、网页手动操作或自造 API 调用，除非用户明确要求 [Task 1][Task 2][ad-hoc note]

## Reusable knowledge

- `lark-cli mail user_mailboxes profile --as user --params '{"user_mailbox_id":"me"}'` 先确认当前邮箱身份最稳；这次主邮箱是 `fanhan@aimanziyi.vip` [Task 1]
- `mail +triage --query '实习投递' --max 100` 适合先拉候选列表，再用 `mail +messages --message-ids ... --html=false` 批量取正文和附件元数据，比单封 `+message` 更稳 [Task 1]
- 附件下载链接接口要带 `user_mailbox_id`、`message_id`、`attachment_ids` 三个关键参数；下载后本地建 `messages.json`、`message_bodies.txt`、`text/*.txt` 这类可搜索语料层会省很多反复读取 [Task 1][Task 2]
- 这台机器抽候选人材料文本的稳妥链路是：PDF 用 `pdftotext -layout`，docx 用 `textutil -convert txt -stdout`，PPTX 可解包后读 `ppt/slides/*.xml`，`.rar` 先用 `bsdtar -xf` 试探 [Task 2]
- 这次最终推荐顺序是 `夏腾 > 朱柯百纯 > 吴昕如 > 郭澳林 > 刘舒扬`；夏腾胜出的核心证据是 AI 内容生产、工作流搭建、SOP 沉淀、Claude Code/Codex 实操和飞书文档复盘 [Task 3]
- 如果用户要更正式的决策稿，下一步直接转成评分表，列 `Vibe Coding`、`Agent Skill`、`飞书/多维表格`、`内容运营`、`可到岗时间` 这些维度 [Task 3]

## Failures and how to do differently

- 症状：单封 `+message` 读取超时。原因：逐封读取更慢也更脆弱。修正：改用 `+messages` 批量读取正文和附件元数据 [Task 1]
- 症状：`.rar` 附件难以直接抽到传统简历正文。原因：缺少专用解压器，而且内部可能是网页简历。修正：先用 `bsdtar` 看结构；若正文和网页内容已足够判断，就停止深挖压缩包 [Task 2]
- 症状：候选里几乎没人有硬核“飞书多维表格”证据。原因：筛选维度设得比市场材料更细。修正：如果这个维度真是强门槛，下一轮直接补追问或小作业验证，不靠猜 [Task 3]

# Task Group: 星辰文化 AI 提效 / 飞书新租户授权与 scope-profile 切换

scope: 处理“换了飞书租户后，要把 lark-cli 或 codex-remote-feishu 重新授权到正确租户”的任务；重点是先确认租户身份，再决定是补 device code、重建 app/profile，还是补 scope JSON
applies_to: cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效 or /Users/fanhan/Documents/Codex/飞书 CLI; reuse_rule=safe for similar Feishu tenant-switch auth work on this machine, but always re-check active app/profile, visible tenant evidence, and whether the user wants lark-cli or repo-specific onboarding

## Task 1: 发现 tenant mismatch、重发 device code，并用租户可见内容校验身份，partial

### rollout_summary_files

- rollout_summaries/2026-05-25T03-57-38-8YrN-feishu_cli_tenant_switch_mismatch_deviceflow_retry.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/25/rollout-2026-05-25T11-57-38-019e5d47-f97e-77b0-a9d5-f633c3a6c14b.jsonl, updated_at=2026-05-25T10:56:57+00:00, thread_id=019e5d47-f97e-77b0-a9d5-f633c3a6c14b, exposed that successful auth could still point at the wrong tenant)

### keywords

- lark-cli, tenant switch, auth login --recommend --no-wait --json, device_code invalid, device_code expired, 20001 请求不合法, config.json, wiki spaces list, contact:user.basic_profile:readonly, wiki:space:retrieve

## Task 2: 给 `codex-remote-feishu` 新租户重授权并提供缺失权限 JSON，success

### rollout_summary_files

- rollout_summaries/2026-05-25T10-57-01-CvSr-codex_remote_feishu_reauthorize_new_tenant_permissions_json.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/25/rollout-2026-05-25T18-57-01-019e5ec7-ed86-73e0-9c48-c505e74cefdb.jsonl, updated_at=2026-05-25T11:06:32+00:00, thread_id=019e5ec7-ed86-73e0-9c48-c505e74cefdb, completed new-tenant onboarding and surfaced the remaining tenant scopes)

### keywords

- codex-remote-feishu, onboarding sessions, permission-check, missingScopes, batch JSON, base:app:create, bitable:app, drive:drive, im:message, open.feishu.cn/app

## Task 3: 为 `lark-cli` 新租户创建 profile、重做授权并切默认 profile，success

### rollout_summary_files

- rollout_summaries/2026-06-01T08-55-00-lum9-lark_cli_feishu_new_tenant_reauth_and_profile_switch.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T16-55-00-019e8264-bd32-79a1-9827-512b66788d6d.jsonl, updated_at=2026-06-01T13:09:00+00:00, thread_id=019e8264-bd32-79a1-9827-512b66788d6d, created `feishu-new-tenant-20260601` and switched the machine default profile)

### keywords

- lark-cli, auth login --domain all --no-wait --json, auth qrcode, config init --new --force-init, profile use, auth scopes --format json, feishu-new-tenant-20260601, cli_aa97e47c4c389cd5, profile:user_profile:read

## User preferences

- 当用户反复说“过期了，重新给我一个码”“又失效了”时，这类授权流默认立刻重发新链接或二维码，不让用户重复解释上下文 [Task 1][Task 3]
- 当用户纠正“我换了个租户，你让我重新授权一下”时，未来按完整重授权处理，不把它当作一次普通状态刷新 [Task 1][Task 2]
- 当用户说“我是这家公司的一号位，理论上我应该有所有权限，你帮我应开尽开吧”时，这类租户切换默认检查最大可用工作权限，不停在最小登录成功 [Task 2][Task 3]
- 和飞书有关的操作一律使用 `lark-cli` 处理，包括飞书文档、云空间、即时消息、多维表格、日历、任务、审批等；后续不要改用其他飞书 MCP、网页手动操作或自造 API 调用，除非用户明确要求 [Task 1][Task 3][ad-hoc note]

## Reusable knowledge

- 换租户后，先验证“连上的是谁”，再验证“token 是不是 valid”；如果还能看到不该看到的内部知识库，例如 `Agent Native 工作方法｜AI 经营操作系统`，就说明租户仍然错了 [Task 1]
- `lark-cli config init --new` 适合开新 app 注册流，`lark-cli auth login --recommend --no-wait --json` 或 `--domain all --no-wait --json` 适合把 `device_code` 和 `verification_url` 交给用户；后续要立刻在同一 flow 上继续，不要拖 [Task 1][Task 3]
- `lark-cli auth qrcode '<verification_url>' --output ./file.png` 可生成二维码，但 `--output` 必须是当前目录内的相对路径；绝对路径会报 `unsafe output path: --output must be a relative path within the current directory` [Task 3]
- 这台机器上 `lark-cli config init --new --force-init --name <profile>` 可以直接建新 profile；本次成功 profile 是 `feishu-new-tenant-20260601`，app ID `cli_aa97e47c4c389cd5`，随后用 `lark-cli profile use feishu-new-tenant-20260601` 切成默认 profile [Task 3]
- `lark-cli auth scopes --format json` 适合校验 app 打开的 scope 数；这次新 profile 返回 `count: 172`，最终只缺 `profile:user_profile:read` [Task 3]
- repo 自带 onboarding 场景下，`POST /api/admin/feishu/onboarding/sessions` / `GET .../{id}` / `POST .../{id}/complete` 是稳定的重授权链路；权限页缺什么就直接把 `permission-check` 的缺失 scope 整成 JSON 给用户 [Task 2]
- 这次缺失 tenant scope 的一键 JSON 结构是 `{ "scopes": { "tenant": [...], "user": [] } }`；缺失项包括 `base:app:create`、`bitable:app`、`drive:drive`、`im:datasync.feed_card.time_sensitive:write`、`im:message` [Task 2]

## Failures and how to do differently

- 症状：反复登录成功，但租户还是错的。原因：旧 app 或旧 profile 还在生效。修正：查 `config.json` / `config show` / `auth list`，必要时直接新建 app/profile，不要只重发 device code [Task 1][Task 3]
- 症状：报 `authorization failed: The device_code is invalid`、`authorization failed: The device_code has expired` 或 `20001 请求不合法`。原因：device flow 过期、链接上下文错了，或浏览器租户不对。修正：重发新 code，并同步核对浏览器当前租户/brand [Task 1][Task 3]
- 症状：看起来 onboarding 已完成，但工具仍然不可用。原因：缺的是 scope，不是登录。修正：立刻跑 `permission-check` 或实际命令，缺什么权限就给出明确 scope 列表或 JSON [Task 2]

# Task Group: 星辰文化 AI 提效 / Feishu 知识库低 token 结构设计与落地

scope: 处理“设计便于 AI 低 token 查询的 Feishu 知识库结构、把规则沉淀成 skill、再把导航和摘要真正写进知识库”的任务；重点是保留三层检索结构和读前判断门槛
applies_to: cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效; reuse_rule=safe for similar Feishu knowledge-base design, writeback, and skill-packaging work in this workspace, but always re-check final wiki/doc target, current node layout, and whether the user wants rule design, batch writeback, or both

## Task 1: 创建 `lark-knowledge-base-builder`，success

### rollout_summary_files

- rollout_summaries/2026-06-01T04-20-18-a4cJ-feishu_knowledge_base_builder_skill.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T12-20-18-019e8169-3cb9-7fe3-ae61-713d8c2e2ec5.jsonl, updated_at=2026-06-01T04:24:50+00:00, thread_id=019e8169-3cb9-7fe3-ae61-713d8c2e2ec5, encoded the three-layer knowledge-base pattern into a reusable skill)

### keywords

- feishu, lark-wiki, lark-doc, skill-creator, knowledge-base, wiki, docx, low-token retrieval, directory index, subdirectory guide, first-block summary, lark-knowledge-base-builder

## Task 2: 补 eval prompts、校验并打包 skill，success

### rollout_summary_files

- rollout_summaries/2026-06-01T04-20-18-a4cJ-feishu_knowledge_base_builder_skill.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T12-20-18-019e8169-3cb9-7fe3-ae61-713d8c2e2ec5.jsonl, updated_at=2026-06-01T04:24:50+00:00, thread_id=019e8169-3cb9-7fe3-ae61-713d8c2e2ec5, validated with `python3` and packaged a `.skill` artifact)

### keywords

- evals, json.tool, python3, scripts.quick_validate, scripts.package_skill, Skill is valid!, lark-knowledge-base-builder.skill, knowledge-base-template.md

## Task 3: 为知识库补总目录、年份目录指引和风格总览摘要，success

### rollout_summary_files

- rollout_summaries/2026-06-01T04-30-38-z7bO-feishu_knowledge_base_indices_and_article_summaries.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T12-30-38-019e8172-b363-7ad1-9e23-5888249bee70.jsonl, updated_at=2026-06-01T07:31:48+00:00, thread_id=019e8172-b363-7ad1-9e23-5888249bee70, created `00 知识库总目录` and three yearly guide docs)

### keywords

- wiki +node-get, wiki +node-list --page-all, 00 知识库总目录, 00 目录指引, 理白｜内容风格概述, CnOJw8ZwuiYEkSkZNnjc3Iwunmd, MLw7dxsnjoXW8ExfxMhc7Tnlnsf, Untitled

## Task 4: 给 546 篇公众号正文批量注入“本文摘要”块，success

### rollout_summary_files

- rollout_summaries/2026-06-01T04-30-38-z7bO-feishu_knowledge_base_indices_and_article_summaries.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/06/01/rollout-2026-06-01T12-30-38-019e8172-b363-7ad1-9e23-5888249bee70.jsonl, updated_at=2026-06-01T07:31:48+00:00, thread_id=019e8172-b363-7ad1-9e23-5888249bee70, wrote summary blocks to all 546 article docs with resumable state)

### keywords

- 本文摘要, add_article_summaries.py, article_summary_state.json, request trigger frequency limit, operation timed out, overwrite, keyword fetch, 546, XgHadIg3ko80dCxUWmqcpszAnfb

## User preferences

- 当用户说知识库要“同时方便人类月度和 AI Agent 查询”时，未来类似知识库设计默认采用三层导航：总目录 -> 子目录指引 -> 正文首块摘要，不要堆成平铺文档 [Task 1][Task 3]
- 当用户明确说 AI 要“先顺着总目录去定位到需要查哪些子目录，再从子目录定位到去查哪个具体的文档，并且通过文档的第一块判断这个文档的正文适不适合读取”时，未来类似设计要把“读之前先判断值不值得继续读”写进结构规则 [Task 1]
- 当用户强调“把知识库所有内容都看一遍，那样太费Token了”时，低 token 检索不是附加优化，而是默认约束 [Task 1]
- 当用户说“根据我的知识库设计原则为这个知识库添加上对应的指引内容”时，默认先补导航型内容，再碰正文 [Task 3]
- 当用户要求“每篇公众号的文档开头都加一个概述块吧，方便 Agent 查到这篇文档后，二次校验判断该不该读文档正文”时，未来类似任务默认把摘要块放在标题后、正文前，服务 Agent 决策 [Task 3][Task 4]

## Reusable knowledge

- 这类 skill 不该重复封装 Feishu CRUD；当前低层能力已经有 `lark-wiki` 管空间/节点、`lark-doc` 管 Docx 内容，新 skill 只负责目录结构、改造步骤和使用时机 [Task 1]
- 这次稳定落地的结构是 `00 知识库总目录` -> 每个年份目录里的 `00 目录指引` -> 每篇正文文档的首块 `本文摘要`；它既服务人工月度浏览，也服务 AI 按层缩小读取范围 [Task 1][Task 3][Task 4]
- `wiki +node-get` 可先把 URL 解析成真实 `node_token` / `obj_token` / `space_id`，`wiki +node-list --page-all` 适合盘点整库和父节点内容 [Task 3]
- `docs +fetch --scope outline` 适合先看目录结构，`docs +fetch --scope keyword --keyword '本文摘要'` 适合直接抽检摘要块是否存在 [Task 3][Task 4]
- `docs +create` 建出来再挂进 Wiki 容易残留 `Untitled`；对这类导航文档，直接用 `docs +update --command overwrite` 把标题和正文一起写进最终对象更稳 [Task 3]
- 批量改写正文时，用状态文件断点续跑会稳很多；这次 `.codex_tmp/article_summary_state.json` 最终跑到 `total=546, done=546, failed=0` [Task 4]
- 546 篇摘要块的生成模式已经验证可用：按“年份 + 标题 + 主题类别 + 何时继续读正文 + 何时回总目录/年份指引/风格总览”组织，能帮 Agent 快速决定值不值得读全文 [Task 4]
- 这台机器的 skill 校验与打包环境要直接用 `python3`；这次 `python3 -m json.tool`、`python3 -m scripts.quick_validate`、`python3 -m scripts.package_skill` 都跑通了 [Task 2]
- `skill-creator` 打包 `.skill` 时会跳过 `evals/evals.json`，保留 `SKILL.md` 和 reference/template 资产；交付时要知道 eval 文件不在最终包里 [Task 2]

## Failures and how to do differently

- 症状：一开始按 `python` 跑校验直接报 `zsh:1: command not found: python`。原因：这个环境没有 `python` 命令。修正：未来在这里做 skill 校验/打包，默认改用 `python3` [Task 2]
- 症状：skill 已通过静态校验和打包，但还不能证明提示词效果最优。原因：这次没跑 with-skill / without-skill 的对照 eval。修正：用户若要求继续打磨，下一轮直接补对照评测，不把“已打包”当成“已充分验证” [Task 1][Task 2]
- 症状：导航文档挂进 Wiki 后标题成了 `Untitled`。原因：先 create、后挂载、再补标题的流程不稳。修正：直接在最终对象上 `overwrite` 标题和正文 [Task 3]
- 症状：批量写入时触发 `HTTP 400: request trigger frequency limit` 或 `connect: operation timed out`。原因：写入过密，接口抖动。修正：脚本内置自动等待重试，并用状态文件断点续跑 [Task 4]

# Task Group: 星辰文化 AI 提效 / 公司例会 PDF 写回飞书项目任务表与沟通备忘录

scope: 处理“给一份会议 PDF/转写材料，把内容整理后写回飞书 Base 或 docx 模板”的任务；重点是先识别目标载体，再按目标结构落地，而不是只做摘要
applies_to: cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效; reuse_rule=safe for similar meeting-material-to-Feishu writeback tasks in this workspace, but always re-check the exact target Base/doc link, field schema, and whether the target doc is an empty template or an existing populated memo

## Task 1: 将 2026-05-30 公司例会 PDF 拆成项目父记录与任务子记录并写入飞书 Base，success

### rollout_summary_files

- rollout_summaries/2026-05-30T11-09-02-oSSv-feishu_base_meeting_to_project_task_parent_child_writeback.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T19-09-02-019e7892-b927-7060-96ad-4dbae9bfc7db.jsonl, updated_at=2026-05-30T11:17:52+00:00, thread_id=019e7892-b927-7060-96ad-4dbae9bfc7db, wrote 10 parent records and 75 child records with parent links)

### keywords

- lark-cli, base, record-batch-create, 父记录, 项目名称, 负责人, contact +search-user, PDF, 项目父记录, 任务子记录, tbluNALZ2ds2Emtx, 会议转写

## Task 2: 将同一场公司例会 PDF 整理进飞书“沟通备忘录”模板文档，success

### rollout_summary_files

- rollout_summaries/2026-05-30T11-13-36-wpVS-feishu_meeting_memo_pdf_to_docx_update.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T19-13-36-019e7896-e8bf-7b52-9d56-c67421edb6c8.jsonl, updated_at=2026-05-30T17:51:19+00:00, thread_id=019e7896-e8bf-7b52-9d56-c67421edb6c8, filled the memo template and removed placeholder blocks)

### keywords

- lark-cli, docs +fetch, docs +update, block_insert_after, block_delete, wiki, docx, pdftotext, 沟通备忘录, 模板清理, Kdi5dwu4DoWaDnxJBPtcGBa6nmc, UCSZdQkCloYMO1xJT3IcfPAzn9g

## User preferences

- 当用户说“把项目和任务都梳理拆解清楚，填入表中”时，未来同类会议材料任务默认先做结构化拆解，再落成 Base 里的父记录/子记录，而不是只回一段摘要 [Task 1]
- 当用户特别提醒“负责人的部分可能会存在语音转写错误……就根据飞书里名字发音相似的人来进行人员的填写”时，负责人字段优先走通讯录搜索和发音近似匹配，不按字面硬填，也不猜 open_id [Task 1]
- 当用户说“这是我们公司每次例会的沟通备忘录文档”“基于沟通备忘录的文档，把会议内容整理进去”时，默认先读目标文档模板/栏目，再按既有结构写回同一份文档，不另起一份总结 [Task 2]
- 当输入是“wiki URL + 本地 PDF”时，把它当成“目标文档 + 源材料”双输入：先确认落点文档，再处理 PDF 内容 [Task 2]

## Reusable knowledge

- 例会写入项目管理 Base 时，先用 `+field-list` 确认 `项目名称`、`父记录`、`负责人`、`项目进度`、`关联业务`、`参与者` 等字段是否齐全；这类表如果有自关联 `父记录` 字段，就适合按“项目父记录 + 任务子记录”建模 [Task 1]
- 人员字段写入要用对象数组 `{ "id": "ou_xxx" }`；负责人不确定时先跑 `lark-cli contact +search-user` 批量搜姓名/近似姓名，无法命中的名字不要强行猜 ID [Task 1]
- 这次稳定写法是先批量创建项目父记录，再拿返回的 `record_id_list` 去批量创建子任务并写入 `父记录` 关联；最后用 `+record-list` 做数量级校验 [Task 1]
- 会议 PDF 写回飞书文档前，先用 `docs +fetch --scope outline --detail with-ids` 看结构，再用 `docs +fetch --detail full` 看正文/空位，避免把空模板误判成已有内容 [Task 2]
- 在这台机器上，PDF 文本抽取的稳妥路径是 `pdftotext -layout`；本轮 `python3` 下的 `pypdf` 缺失，但 PDF 不是扫描件，`pdftotext` 足够直接抽出总结与转写 [Task 2]
- 写回“沟通备忘录”时，`docs +update --command block_insert_after --doc-format markdown` 适合在日期标题后一次性插入结构化纪要；如果原文是空模板，还要再用 `block_delete` 清掉旧占位块 [Task 2]
- 这类文档目标不是逐字转写，而是整理成会议概览、议题结论、讨论过程、金句洞察、行动项等栏目化纪要，更符合团队“沟通备忘录”的使用方式 [Task 2]

## Failures and how to do differently

- 症状：负责人名字来自语音转写，字面上和飞书通讯录对不上。原因：会议转写里常有误写。修正：先批量搜近似姓名，只在命中通讯录后再写人；不命中就保留文字，留给人工修正 [Task 1]
- 症状：PDF 工具链卡在 `ModuleNotFoundError: No module named 'pypdf'`。原因：不能假设本机 Python PDF 库已装好。修正：在这个环境里优先试 `pdftotext -layout` 或工作区自带 runtime，不先花时间补 Python 依赖 [Task 1][Task 2]
- 症状：把内容直接追加进备忘录文档后，模板空块还留在末尾。原因：只做插入，没有做模板清理。修正：写入后立刻 `block_delete` 旧的“议题一：xxx”标题、空段落和空 checkbox，再用 outline 复查 [Task 2]

# Task Group: 本地 Agent skills / GitHub 发布受阻后的打包交付与飞书网盘同步

scope: 处理 `/Users/fanhan/.agents/skills` 里的 skill 重命名、打包、上传到飞书网盘，或尝试发到 GitHub 时的交付工作；重点是保持本地目录名、`SKILL.md` `name:` 和云端 zip 名一致
applies_to: cwd=/Users/fanhan/.agents/skills or Feishu Drive skill-delivery workflow; reuse_rule=safe for local skill packaging, rename, and Feishu upload flows on this machine, but re-check GitHub auth, target folder token, and whether an existing Drive file should be overwritten in place

## Task 1: 批量上传/重命名本地 skill 并同步到飞书文件夹 `KuJmfMOPxlL5h9dzGUtcVShAnUh`，success

### rollout_summary_files

- rollout_summaries/2026-05-30T10-30-57-6rIo-feishu_skill_upload_and_rename_workflow.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T18-30-57-019e786f-dbaa-7b03-a8cf-5b203b19de2c.jsonl, updated_at=2026-05-30T11:06:18+00:00, thread_id=019e786f-dbaa-7b03-a8cf-5b203b19de2c, uploaded 内容风格提取 and synchronized multiple renamed Chinese skill packages)

### keywords

- lark-cli, drive +inspect, drive +upload, drive files list, file-token overwrite, relative file path, KuJmfMOPxlL5h9dzGUtcVShAnUh, 内容风格提取, 口播视频粗剪@方比比, 方比比视频号标题方法论, 直播带货话术拆解@方比比, 理白风格内容创作

- Related skill: skills/feishu-skill-drive-sync/SKILL.md

## Task 2: `理白风格写作` 发 GitHub 受阻后改为打包到 Downloads，partial

### rollout_summary_files

- rollout_summaries/2026-05-30T08-56-22-5e84-libai_skill_github_upload_blocked_zipped_for_downloads.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T16-56-22-019e7819-43d9-7373-83a9-606d68e1d274.jsonl, updated_at=2026-05-30T10:02:20+00:00, thread_id=019e7819-43d9-7373-83a9-606d68e1d274, GitHub publish blocked by invalid GH_TOKEN and flaky HTTPS path; zip fallback succeeded)

### keywords

- GitHub, gh auth status, GH_TOKEN, SSL_ERROR_SYSCALL, Invalid username or token, LiBai-content-skill, zip, Downloads, libai-style-writing-skill.zip, proxy, Ivor-NCUT/LiBai-content-skill

- Related skill: skills/github-cli-auth-recovery/SKILL.md
- Related skill: skills/feishu-skill-drive-sync/SKILL.md

## User preferences

- 当用户说“把这个 skill 传到这里”“传到对应的网盘里”时，默认交付物是完整 skill 资产的压缩包并上传到指定云端文件夹，不把内容贴聊天里 [Task 1]
- 当用户说“把英文的 skill 名称都改成中文，并且在飞书文件夹里也更新”时，未来同类任务默认同时同步三层名字：本地目录名、`SKILL.md` `name:`、飞书里的 zip 文件名 [Task 1]
- 当用户直接说“把这个 skill 传到这个仓库上”时，默认目标是真正完成发布/迁移；如果主路径受阻，再给可分享的替代交付物 [Task 2]
- 当用户说“把这个 skill 的所有文件打包成一个压缩包，放在我的【下载】目录下，方便我分享给同事”时，GitHub/网盘受阻后的默认 fallback 是完整非 git 文件集打包到 Downloads [Task 2]

## Reusable knowledge

- 飞书目标文件夹先用 `lark-cli drive +inspect --url '<folder_url>'` 确认 `type=folder`、标题和 token；这次目标是 `星辰文化的各种 Agent skill`，token `KuJmfMOPxlL5h9dzGUtcVShAnUh` [Task 1]
- `lark-cli drive +upload` 的 `--file` 只能接受当前目录内的相对路径；稳定做法是把 zip 放进一个临时目录，切进去后再传 `./filename.zip` [Task 1]
- 上传后用 `drive files list --params '{"folder_token":"...","page_size":100}'` 校验最稳；`drive files get --file-token` 不是这条链路的正确查询方式 [Task 1]
- 如果只是更新现有飞书文件内容/名称，可用 `lark-cli drive +upload --file-token <existing_token> --file ./<zip> --name <new_name>` 覆盖原文件，同时保留同一个 Drive file token [Task 1]
- 打包 skill 时要主动排除 `.git`、`.venv`、`__pycache__`、缓存、模型/转写输出等运行时文件，避免把 vendor/runtime 垃圾一起传上去 [Task 1][Task 2]
- 本地 skills 树在 `/Users/fanhan/.agents/skills`；需要列出全部 skill 时，数 `SKILL.md` 文件比按目录名猜更稳，这次 `find ... -name SKILL.md | wc -l` 得到 `80` [Task 1]
- `理白风格写作` 本地仓库尝试发布到 `https://github.com/Ivor-NCUT/LiBai-content-skill.git` 时，旧 remote 是 `Ivor-NCUT/LiBai_Style_Content.git`，需要先核对并修正 remote [Task 2]
- GitHub 受阻时，基于 repo 根目录直接打 `README.md`、`SKILL.md`、`references/`、`evals/` 的 zip 是可交付 fallback；这次落地文件是 `/Users/fanhan/Downloads/libai-style-writing-skill.zip` [Task 2]

## Failures and how to do differently

- 症状：`lark-cli drive +upload` 报 `unsafe file path: --file must be a relative path within the current directory`。原因：直接传了绝对路径。修正：切到临时目录后用 `./<zip>` 作为相对路径上传 [Task 1]
- 症状：先把英文名 zip 传上去，用户随后要求中文名对齐。原因：只顾上传，没提前统一命名层。修正：以后遇到面向同事/客户的 skill 交付，默认先统一中文显示名，再打包和上传 [Task 1]
- 症状：`git push` 同时出现 `LibreSSL SSL_connect: SSL_ERROR_SYSCALL`、`remote: Invalid username or token`、`The token in GH_TOKEN is invalid.`。原因：本机 GitHub 非交互认证被坏掉的 `GH_TOKEN` 覆盖，代理链路也不稳定。修正：先按 `skills/github-cli-auth-recovery/SKILL.md` 清理 env token、核验 `gh auth status` 和网络，再决定是否继续 push [Task 2]
- 症状：反复重试 `git push` 没有进展。原因：这是认证/链路问题，不是 repo 内容问题。修正：确认短时间内无法恢复时，直接切到 Downloads zip 或飞书网盘交付，减少无效重试 [Task 2]

# Task Group: 本地机器 / Codex 桌面端闪退排查与 home 目录误成 Git 仓库修复

scope: 处理 Codex macOS 客户端“老是闪退”、高内存、Git 扫描异常等本机故障；重点是先查本地 crash/log，再判断是不是环境级 Git/worktree 误配置
applies_to: cwd=local machine / Codex desktop on macOS; reuse_rule=safe for similar Codex crash investigations on this machine, but always re-check current crash logs, live processes, and whether `/Users/fanhan` or another broad parent path is accidentally a Git repo

## Task 1: 通过本地 crash report 和日志定位 Codex 闪退原因，success

### rollout_summary_files

- rollout_summaries/2026-05-30T09-09-24-jWsN-codex_crash_home_directory_git_oom_fix.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T17-09-24-019e7825-3406-7380-aad6-0e8a919ae899.jsonl, updated_at=2026-05-30T09:33:15+00:00, thread_id=019e7825-3406-7380-aad6-0e8a919ae899, traced repeated SIGABRT/OOM crashes to accidental Git scanning of the entire home directory)

### keywords

- Codex crash, SIGABRT, OOMErrorHandler, V8, DiagnosticReports, com.openai.codex, worker_rpc_response_error, Failed to write temporary index tree snapshot, /Users/fanhan, home directory repo

## Task 2: 备份并移走 `/Users/fanhan/.git`，让 Codex 停止扫描整个 home 目录，success

### rollout_summary_files

- rollout_summaries/2026-05-30T09-09-24-jWsN-codex_crash_home_directory_git_oom_fix.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T17-09-24-019e7825-3406-7380-aad6-0e8a919ae899.jsonl, updated_at=2026-05-30T09:33:15+00:00, thread_id=019e7825-3406-7380-aad6-0e8a919ae899, moved `.git` to a timestamped backup and verified the crash trigger disappeared)

### keywords

- .git backup, fatal: not a git repository, bare-modifier-monitor, browser_crashpad_handler, ps aux, rev-parse, /Users/fanhan/.git.codex-crash-backup-20260530-173032, RSS

## User preferences

- 当用户说“我的 codex 现在老是闪退，你能否帮我检查一下是哪里出了问题？”时，未来类似故障先走本地 logs/crash reports 的根因排查，不靠猜 [Task 1]
- 当用户后续补一句“检查并修复”“修复吧”时，说明他要的是从诊断直接推进到可执行修复，不停在解释层 [Task 1][Task 2]
- 这次可接受的修复路径是“低风险、可回退、先动本地状态/元数据，不碰项目文件”，类似本机故障默认沿这个边界推进 [Task 1][Task 2]

## Reusable knowledge

- 这次反复闪退的核心信号是 crash report 里的 `EXC_CRASH` / `SIGABRT`、`node::OOMErrorHandler(...)`、`v8::ExternalMemoryAccounter::Update(...)`，更像 OOM 触发的 abort，不像项目代码损坏 [Task 1]
- Codex 日志里出现 `worker_rpc_response_error`、`Failed to write temporary index tree snapshot`、`git process aborted`，而且 Git 工作路径指向 `/Users/fanhan`，这是“home 目录误成 Git 仓库”的强信号 [Task 1]
- 最有用的快检命令是：`ls -lt ~/Library/Logs/DiagnosticReports | head -40`、`find ~/Library/Logs -iname '*codex*' -o -iname '*openai*'`、`git -C /Users/fanhan rev-parse --show-toplevel --git-dir --is-inside-work-tree`、`git -C /Users/fanhan status --short`、`ps aux | grep -i '[C]odex'` [Task 1]
- 类似场景下，`git -C /Users/fanhan rev-parse ...` 如果确认 home 目录真被当成 repo，最稳的修复是先把 `/Users/fanhan/.git` 备份挪走，再验证 `git -C /Users/fanhan` 失败为 `fatal: not a git repository` [Task 2]
- 这次把 `.git` 移到 `/Users/fanhan/.git.codex-crash-backup-20260530-173032` 后，Codex 主进程 RSS 从多 GB 掉到几百 MB，新的日志里也不再出现之前那种全 home 目录 Git 扫描错误 [Task 2]

## Failures and how to do differently

- 症状：`.ips` 文件用 `plutil -p` 或直接 `json.load` 读不通。原因：这些 crash report 不是纯 JSON。修正：分开读 metadata/body，或直接按文本结构查看，不先陷进解析器问题 [Task 1]
- 症状：一直在想是不是 Codex app 自身 bug。原因：忽略了环境级 repo 误配置。修正：遇到 OOM + Git 日志异常时，尽早检查 home 目录或其他大父目录是否误成仓库 [Task 1]
- 症状：修完 `.git` 后还看到一份新 crash report / 残留 helper 进程。原因：旧的高内存实例还活着。修正：移走 repo 触发器后，再做一次 Codex 完整重启，并重新看新日志是否还出现旧错误模式 [Task 2]

# Task Group: 本地机器 / macOS 磁盘清理与 Git garbage 部分恢复

scope: 处理“先盘点可删内容，再释放磁盘空间，同时尽量不影响工作”的本机清理任务，以及清理后用户追问的可恢复性判断
applies_to: cwd=local machine / macOS storage cleanup and Git object recovery; reuse_rule=safe for similar cleanup work on this machine, but always re-scan current large directories and keep Feishu/Lark plus WeChat/WeCom protected unless the user explicitly re-allows them

## Task 1: 清理 `.dmg`、Git garbage、缓存、Arc 和 Docker 本地数据，success

### rollout_summary_files

- rollout_summaries/2026-05-30T02-50-19-BhKY-mac_cleanup_and_git_garbage_recovery.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T10-50-19-019e76ca-22b9-7183-88fc-5fd0b97c159c.jsonl, updated_at=2026-05-30T08:54:47+00:00, thread_id=019e76ca-22b9-7183-88fc-5fd0b97c159c, reclaimed about 363 GiB while keeping work-critical chat apps untouched)

### keywords

- mdfind, df -h, du, git gc --prune=now, git count-objects -vH, Arc Service Worker, Docker, dmg, cache cleanup, /Users/fanhan/.git, LarkShell, WeChat, WeCom

## Task 2: 判断被 `git gc --prune=now` 清掉的 Git garbage 是否还能恢复，partial

### rollout_summary_files

- rollout_summaries/2026-05-30T02-50-19-BhKY-mac_cleanup_and_git_garbage_recovery.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/30/rollout-2026-05-30T10-50-19-019e76ca-22b9-7183-88fc-5fd0b97c159c.jsonl, updated_at=2026-05-30T08:54:47+00:00, thread_id=019e76ca-22b9-7183-88fc-5fd0b97c159c, no full rollback path existed; only partial lost-found salvage remained)

### keywords

- tmutil listlocalsnapshots, git fsck --lost-found --no-reflogs, dangling blob, lost-found, git-lost-found-recovery-20260530-165432, recovery, local snapshots

## User preferences

- 当用户说“请你帮我删掉我电脑上所有的 dmg 安装包，并且扫描一下我的所有电脑文件，思考一下，哪些文件删掉之后，能够给我剩下空间、提升电脑运行速度，同时还不会影响我正常工作。”时，未来清理任务默认先做 inventory/分组建议，再删非显然安全的内容 [Task 1]
- 当用户说“这几个都可以处理”，但又补一句“飞书和微信我工作需要用，这个别动我的”时，未来本机清理默认把 Feishu/Lark、WeChat、WeCom 视为保护目录，除非用户明确重新放开 [Task 1]
- 当清理完成后用户追问“这个能帮我恢复吗？”时，类似破坏性清理要立刻转入“可恢复性检查”，先判断有没有快照/备份，再决定还能救到什么程度 [Task 2]

## Reusable knowledge

- 这台机器上 `/Users/fanhan` 本身是一个 Git 仓库，`git gc --prune=now` 能回收巨量垃圾对象；本轮最有用的前后对比命令是 `git count-objects -vH`，从 `garbage: 307` / `size-garbage: 76.47 GiB` 清到 `garbage: 0` / `size-garbage: 0 bytes` [Task 1]
- 大空间回收点里，Arc 最值钱的是 `~/Library/Application Support/Arc/User Data/Default/Service Worker`，约 57 GB；Docker 最值钱的是 `~/Library/Containers/com.docker.docker/Data/vms` 和 `.../Data/log`，前提是 Docker 当时没在运行 [Task 1]
- 本轮总空间从 `/System/Volumes/Data` 约 `42Gi` available 提升到约 `405Gi` available；受保护但仍很大的目录包括 `~/Library/Application Support/LarkShell`、`~/Library/Containers/com.bytedance.macos.feishu`、`~/Library/Containers/com.tencent.xinWeChat`、`~/Library/Containers/com.tencent.WeWorkMac` [Task 1]
- 评估 Git garbage 恢复性时，先看 `tmutil listlocalsnapshots /`；如果只有 macOS update snapshots，没有普通 Time Machine 快照，就不要承诺整仓回滚 [Task 2]
- 即使 `git gc --prune=now` 已执行，`git fsck --lost-found --no-reflogs` 仍可能救回一部分 dangling blobs；这次把可救片段复制到了 `/Users/fanhan/Documents/Codex/git-lost-found-recovery-20260530-165432`，约 `595` blobs / `19 MB` [Task 2]

## Failures and how to do differently

- 症状：第一轮把 `.dmg` 挪去废纸篓后，零字节构建产物和后台进程卡住。原因：一部分文件/任务没正常完成。修正：挂起时先检查进程，再用更直接的删除路径补完，不盲等 [Task 1]
- 症状：`rm -rf .../Service Worker` 跑很久。原因：浏览器缓存目录极大。修正：类似超大缓存删除要预期会慢，避免同时再开别的重删除任务 [Task 1]
- 症状：想恢复被清掉的 Git garbage，但恢复不完整。原因：`git gc --prune=now` 已把不可达对象从 Git 内部真正清走，而且本机没有普通本地快照。修正：未来如果用户还没确认，先说明 `git gc --prune=now` 的不可逆性；真执行后最多再试 `tmutil` 和 `git fsck --lost-found` [Task 2]

# Task Group: 星辰文化 AI 提效 / Feishu Base dashboard 复制到指定空白仪表盘

scope: 在星辰文化 AI 提效工作区里，把源 Base 的仪表盘结构重建到用户点名的目标空白仪表盘；重点是先辨认对象层级，再按可创建 block 能力重建
applies_to: cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效; reuse_rule=safe for similar Feishu Base dashboard replication tasks in this workspace, but always re-check whether the target link is a Base, table, or dashboard and whether the destination dashboard is already populated

## Task 1: 将源仪表盘 `blk1kWfvBig3mvuJ` 重建到目标空白仪表盘 `blknCWsbDO6pR5CQ`，partial

### rollout_summary_files

- rollout_summaries/2026-05-29T11-59-47-M7ro-feishu_base_dashboard_clone_to_target_base.md (cwd=/Users/fanhan/Documents/Codex/项目/星辰文化 AI 提效, rollout_path=/Users/fanhan/.codex/sessions/2026/05/29/rollout-2026-05-29T19-59-47-019e739a-d599-7043-9a76-396183e9df8e.jsonl, updated_at=2026-05-29T13:04:10+00:00, thread_id=019e739a-d599-7043-9a76-396183e9df8e, recreated 7 creatable dashboard blocks in the exact target dashboard after repeated destination corrections)

### keywords

- lark-cli, feishu, base, dashboard, dashboard-block-create, dashboard-arrange, dashboard-get, combo_layout, unknown block, data_config, sort.order, blknCWsbDO6pR5CQ, blk1kWfvBig3mvuJ, 商品销售明细.GMV

## User preferences

- 当用户连续纠正目标链接，并明确说“这里的仪表盘是空的，我希望你搭到这里啊”时，未来类似任务默认先确认最终对象到底是 Base、table 还是 dashboard，再开始创建；同时要清楚汇报内容被建到了哪里 [Task 1]
- 当用户没有重述整个任务、而是只修正目标对象时，说明他接受继续推进，但不接受“建在差不多的位置”；目标对象的精确落点优先级高于过程解释 [Task 1]

## Reusable knowledge

- Feishu Base 的 dashboard 是 Base-level artifact，不是 table-level；`+dashboard-get` 能先确认目标 dashboard 是否真的为空，这次 `blknCWsbDO6pR5CQ` 返回 `blocks: []` [Task 1]
- 复制仪表盘前，先用 `+dashboard-get`、`+dashboard-block-list`、`+dashboard-block-get` 把源 dashboard 的 block 类型和 `data_config` 读全；这次源仪表盘 `blk1kWfvBig3mvuJ` 一共有 8 个 block [Task 1]
- `combo_layout` 和 type=`unknown` 的 block 不能直接用 `+dashboard-block-create` 原样创建；稳定做法是先把可创建的图表/统计卡逐个建出来，再用 `+dashboard-arrange` 近似还原布局 [Task 1]
- chart block 的 `data_config` 现在需要显式 `group_by[].sort.order`；缺这个字段时，本地校验会直接报 `group_by[0].sort.order 仅支持 asc|desc`，补上 `order: asc` 后创建通过 [Task 1]
- 目标 Base 字段名和源仪表盘不完全一致时，不要硬套源字段；这次“商品GMV”最终改用目标 Base 已存在的 `商品销售明细.GMV`，比强行对齐源字段更稳 [Task 1]
- 这次最终落地的 7 个 block 是：`品牌合作情况`、`商品品类分析`、`商品类型分布`、`商品GMV`、`品牌商数量`、`商品数量`、`选品数量`；它们已经在目标 dashboard `blknCWsbDO6pR5CQ` 上完成创建和排列 [Task 1]

## Failures and how to do differently

- 症状：第一次把克隆仪表盘建到了错误的 Base。原因：在用户多次修正目标链接前就开始创建。修正：未来遇到多个 Feishu 链接时，先确认“最终对象 + 对象类型 + 目标 ID”，再动手 [Task 1]
- 症状：源 dashboard 里的 `combo_layout` 无法直接复制。原因：CLI 只能创建具体 block，不能原样重建组合容器。修正：先拆成单独 block，再补 `+dashboard-arrange` [Task 1]
- 症状：`unknown` block 无法直接落地。原因：接口不保留这种抽象类型。修正：按原语义挑一个明确图表类型重建；这次用等价的 `column` chart 替代 [Task 1]
- 症状：`dashboard-block-create` 因 `sort.order` 缺失被本地校验拦下。原因：直接复用源配置时漏了当前 CLI 的强校验字段。修正：先做一个最小 block 创建验证，再批量创建剩余 block [Task 1]
