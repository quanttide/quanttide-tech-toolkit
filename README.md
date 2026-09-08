# 量潮技术工具箱（quanttide-tech-toolkit）

应用层工具集——跨业务、跨领域流程整合。

> 本仓库由 ROADMAP 预留项转为实体仓库（2026-08-10 创建），定位见元仓库 docs/dev-guide/layering.md。

## 包清单

| 语言 | 路径 | 说明 |
|------|------|------|
| Python | [`packages/python`](packages/python) | Python 包 `quanttide-tech`，uv + hatchling，src 布局 |
| Rust | [`packages/rust`](packages/rust) | Rust crate `quanttide-tech`，Cargo 标准布局 |
| Dart | [`packages/dart`](packages/dart) | Dart SDK `quanttide_tech`，`lib/` + `test/` 布局 |
| Go | [`packages/go`](packages/go) | Go 子目录模块，`pkg/` 布局 |
| TypeScript | [`packages/typescript`](packages/typescript) | npm 包 `quanttide-tech`，tsc + vitest，ESM |

各语言包独立演进，共用仓库版本号各自管理（见各自 CHANGELOG）。
