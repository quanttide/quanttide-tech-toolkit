# CHANGELOG

## [Unreleased]

### Added

- `lib/course/`：课程域包按 BLoC 架构分层（models / states / events / bloc，约定见 `course.dart` 文档注释）；首个模型 Assignment（大作业）——三字段契约 `id`(uuid) / `title` / `content`（当前 Markdown 长文本，预留视频等格式），含 `fromJson` / `toJson` 与测试
- `models/decomposition_node.dart`：分解树节点（序列层第二件）——五字段 `id`(uuid) / `parentId` / `kind`(phase·action·checkpoint) / `title` / `criteria`；分解归属由存储层组合（不设 assignmentId），勾选等运行时状态不进设计态模型；含三层树组建与往返测试

## [v0.1.0] - 2026-09-08

初始版本。

### Added

- 初始化包骨架与版本冒烟测试。
