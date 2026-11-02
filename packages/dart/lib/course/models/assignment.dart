/// 大作业（Assignment）— 课程域的定义层，创作空间四个对象之首。
///
/// 数据契约三字段（由用户定，2026-11-02）：
/// - [id]：uuid，分解树、教学动作、各端投影共用的挂靠键
/// - [title]：大作业标题
/// - [content]：载荷，当前为 Markdown 长文本（任务书全文）；
///   未来拓展视频等格式时只在 content 上引入格式判别，[id] / [title] 不动
///
/// 分层：BLoC 架构的 models 层（数据模型），状态与逻辑随第一条工作流入 states / bloc 层。
/// 映射自 roadmap `qtclass/product/studio.md → Assignment（大作业）`。
class Assignment {
  /// 大作业 uuid。
  final String id;

  /// 标题。
  final String title;

  /// 载荷：当前为 Markdown 长文本。
  final String content;

  const Assignment({required this.id, required this.title, required this.content});

  /// 从 JSON 构造；[id] 必填，[title] / [content] 缺省回退空串。
  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json['id'] as String,
        title: json['title'] as String? ?? '',
        content: json['content'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'content': content};
}
