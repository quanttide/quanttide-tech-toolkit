/// 课程域（course）——大作业与互动编排的域包。
///
/// 架构遵循 BLoC 规范，按层分目录：
/// - `models/`：数据模型（Assignment 定义层、DecompositionNode 序列层等）
/// - `states/`：状态类——随第一条工作流落地
/// - `events/`：输入事件——随第一条工作流落地
/// - `bloc/`：业务逻辑——随第一条工作流落地
///
/// 当前只有定义层（无业务逻辑），states / events / bloc 各层在对应
/// 工作流（如编排引擎的 CourseBloc）进入时启用；纯 Dart 实现，
/// 届时引入 `bloc` 依赖。约定先行，目录不空转。
library;

export 'models/assignment.dart';
export 'models/decomposition_node.dart';
