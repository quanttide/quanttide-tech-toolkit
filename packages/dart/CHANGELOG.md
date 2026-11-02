# CHANGELOG

## [Unreleased]

### Added

- `lib/course/`：课程域包按 BLoC 架构分层（`models/` 数据模型、`states/` 装 bloc 与状态（不另设 bloc/）、`events/` 随工作流落地，约定见 `course.dart` 文档注释）；模型三件孪生同形 `id`(uuid) / `title` / `content`（Markdown 长文本，预留视频等格式）——Assignment（题目）、Solution（参考答案，定框参考答案非标准答案、可选）、SolutionStep（步骤单元：一层不嵌套，+ `after` 前置边组成 DAG，单元自足——判断标准与注解进 content）；含菱形组图与拓扑分层测试

## [v0.1.0] - 2026-09-08

初始版本。

### Added

- 初始化包骨架与版本冒烟测试。
