/// 课程域（course）——大作业、答案与步骤单元的域包。
///
/// 架构遵循 BLoC 规范，按层分目录：
/// - `models/`：数据模型——Assignment（题目）、Solution（参考答案）、
///   SolutionStep（步骤单元：一层不嵌套，after 边组成 DAG）
/// - `states/`：bloc 与状态的家——bloc 就住这里，不另设 `bloc/` 目录
///   （`events/` 随第一条工作流落地；纯 Dart，届时引入 `bloc` 依赖）
///
/// 三件孪生同形：`id`(uuid) / `title` / `content`（Markdown 长文本，预留视频等格式），
/// SolutionStep 多一个关系字段 `after`。判断标准、检查点与"为什么这么安排"
/// 全部写进 content——注解不设独立模型。约定先行，目录不空转。
library;

export 'models/assignment.dart';
export 'models/solution.dart';
export 'models/solution_step.dart';
