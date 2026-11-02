/// 分解树节点（DecompositionNode）— 课程域的序列层，大作业的解体思路的模型化。
///
/// 「阶段 → 动作 → 检查点」三层树：分解树是节点的序列，[Assignment] 是节点的定义，
/// 教学动作是节点的注解（挂 [id]）。映射自 roadmap `qtclass/product/studio.md → 分解树`。
///
/// 字段判据：
/// - [id]：uuid，教学动作与各端投影的挂靠键
/// - [parentId]：树的父节点；顶层阶段为 null
/// - [kind]：阶段 / 动作 / 检查点
/// - [criteria]：判断标准，挂在动作上（路线图硬要求——不是"写完"，是
///   "开头 300 字内有明确冲突"）；阶段与检查点为 null
///
/// 分层：BLoC 架构的 models 层第二件（设计态结构）。
/// 分解属于哪个大作业由存储层组合（一作业一档），不设 assignmentId；
/// 勾选与执行状态是运行时状态，归 states 层与 lite，不进本模型。
class DecompositionNode {
  final String id;
  final String? parentId;
  final DecompositionKind kind;
  final String title;
  final String? criteria;

  const DecompositionNode({
    required this.id,
    required this.kind,
    required this.title,
    this.parentId,
    this.criteria,
  });

  /// 从 JSON 构造；[parentId] / [criteria] 缺省为 null。
  factory DecompositionNode.fromJson(Map<String, dynamic> json) => DecompositionNode(
        id: json['id'] as String,
        parentId: json['parentId'] as String?,
        kind: DecompositionKind.values.byName(json['kind'] as String),
        title: json['title'] as String? ?? '',
        criteria: json['criteria'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        if (parentId != null) 'parentId': parentId,
        'kind': kind.name,
        'title': title,
        if (criteria != null) 'criteria': criteria,
      };
}

/// 节点类型：路线图「阶段 → 动作 → 检查点」三层。
enum DecompositionKind {
  /// 阶段：筹备 / 制作 / 发布 / 推广 / 复盘
  phase,

  /// 动作：带判断标准的执行步
  action,

  /// 检查点：可勾选的完成证据（勾选状态不在模型内）
  checkpoint,
}
