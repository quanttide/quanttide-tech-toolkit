import 'package:quanttide_tech/quanttide_tech.dart';
import 'package:test/test.dart';

const _phaseId = 'eaa6d406-0708-4dc2-8b8d-5e800f710175';
const _actionId = '75fd1012-4ba3-4056-9530-a429eefeefe9';
const _checkpointId = '794c4871-3a7b-4520-9393-acb207b90707';

void main() {
  group('DecompositionNode 模型', () {
    test('阶段节点：顶层无父、无判断标准', () {
      const phase = DecompositionNode(id: _phaseId, kind: DecompositionKind.phase, title: '筹备');
      expect(phase.parentId, isNull);
      expect(phase.criteria, isNull);
      expect(phase.kind, DecompositionKind.phase);
    });

    test('动作节点携带判断标准', () {
      const action = DecompositionNode(
        id: _actionId,
        parentId: _phaseId,
        kind: DecompositionKind.action,
        title: '重写作品简介',
        criteria: '100 字内讲清类型与核心卖点',
      );
      expect(action.parentId, _phaseId);
      expect(action.criteria, contains('100 字'));
    });

    test('fromJson / toJson 往返，kind 以名序列化，空值字段不落键', () {
      final node = DecompositionNode.fromJson({
        'id': _checkpointId,
        'parentId': _actionId,
        'kind': 'checkpoint',
        'title': '晋江后台已更新',
      });
      expect(node.kind, DecompositionKind.checkpoint);
      final json = node.toJson();
      expect(json['kind'], 'checkpoint');
      expect(json.containsKey('criteria'), isFalse);
      expect(DecompositionNode.fromJson(json).toJson(), json);
    });

    test('从小说发行任务组建一棵三层树', () {
      final nodes = [
        const DecompositionNode(id: _phaseId, kind: DecompositionKind.phase, title: '筹备'),
        const DecompositionNode(
          id: _actionId,
          parentId: _phaseId,
          kind: DecompositionKind.action,
          title: '重写作品文案',
          criteria: '100 字内讲清类型与核心卖点',
        ),
        const DecompositionNode(
          id: _checkpointId,
          parentId: _actionId,
          kind: DecompositionKind.checkpoint,
          title: '晋江后台已更新',
        ),
      ];
      final roots = nodes.where((n) => n.parentId == null);
      expect(roots.single.title, '筹备');
      final actions = nodes.where((n) => n.kind == DecompositionKind.action && n.parentId == _phaseId);
      expect(actions.single.criteria, isNotNull);
      final orphans = nodes.where((n) => n.parentId != null && !nodes.any((p) => p.id == n.parentId));
      expect(orphans, isEmpty);
    });

    test('三类枚举与路线图三层一致', () {
      expect(
        DecompositionKind.values.map((k) => k.name),
        ['phase', 'action', 'checkpoint'],
      );
    });
  });
}
