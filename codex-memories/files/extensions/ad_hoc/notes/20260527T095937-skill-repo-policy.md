新增长期规则：

当用户要求把 Agent skill 更新到 GitHub 或发布到 GitHub 时，不要把多个 skill 放在同一个总仓库里。默认每个 skill 使用一个单独、独立的 GitHub 仓库。

适用场景：
- 方比比相关 skill
- 客户交付型 skill
- 可复用并可能单独分享、安装或迭代的 Agent skill

执行要求：
- 先检查该 skill 是否已有独立 remote。
- 没有独立 remote 时，优先创建或使用以该 skill 命名的独立仓库。
- 不要因为其他同客户/同主题 skills 已经在某个总仓库里，就继续把新 skill 塞进去。
- 推送前仍需排除 `.venv/`、模型缓存、测试输出、音视频素材、转写产物等运行时文件。
