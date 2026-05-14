# FactorySystem（智慧工厂管理端）

基于 **Flutter** 的工厂场景可视化与管理界面，在响应式 Admin 面板模板上扩展了考勤、多车间人数、温湿度、行为检测、消防与工厂调度等功能。桌面端窗口标题为「Smart Factory」，适用于大屏监控与日常管理操作。

> 说明：本仓库主要为**客户端（Flutter）**工程。业务数据依赖外部后端服务（HTTP / WebSocket / Socket.IO），需自行部署对应服务后联调。

## 功能概览

| 模块 | 说明 |
|------|------|
| **主界面** | 仪表盘总览（`DashboardScreen`） |
| **考勤界面** | 出勤统计、图表；可跳转**录入员工**、**修正考勤** |
| **实时人数** | 一至五号车间独立页面，通过 WebSocket 接收实时人数/视频流相关数据 |
| **实时温湿度** | 温湿度趋势（当前实现中图表侧为 Demo 组件，生产环境可接 `socket.dart`） |
| **行为检测** | 检测画面、行为统计（Socket.IO 与 WebSocket 等） |
| **消防检测** | 消防相关展示与折叠列表等 |
| **工厂调度** | 工厂布局展示、生产调度（含 TCP `localhost:12345` 等通信示例） |

路由与侧栏菜单定义见 `lib/screens/router/router.dart` 与 `lib/screens/main/components/side_menu.dart`。

## 技术栈

- **框架**：Flutter（Material 3 深色主题、`go_router` 路由、`provider` 状态）
- **网络**：`http`、`web_socket_channel`、`socket_io_client`
- **图表与 UI**：`fl_chart`、`flutter_svg`、`google_fonts`（Poppins）、`simple_circular_progress_bar` 等
- **本地数据**：`sqflite`
- **媒体**：`video_player`、`chewie`、`dart_vlc`（桌面端视频能力较强；与 Web 目标可能存在兼容性差异）
- **桌面窗口**：`bitsdojo_window`（依赖已声明，用于自定义桌面窗口场景）

## 环境要求

1. 安装 [Flutter](https://docs.flutter.dev/get-started/install) 并配置好对应平台的工具链（Android Studio / Xcode / Visual Studio 等按需）。
2. **`pubspec.yaml` 中 SDK 约束为 `>=2.17.0 <3.0.0`（Dart 2）**。若你本机 Flutter 已升级到 **Dart 3**，直接 `flutter pub get` 可能失败，需要自行将 `environment.sdk` 调整为与当前 Flutter 兼容的范围（例如放宽至 Dart 3），并视情况升级部分依赖版本。
3. 支持平台目录包含 **Android、iOS、macOS、Windows、Web**。若需构建 **Web**，请注意 `dart_vlc` 等原生插件对 Web 的支持限制，必要时在 `pubspec.yaml` 中做条件依赖或拆分实现。

## 快速开始

```bash
cd FactorySystem-master
flutter pub get
flutter run                    # 默认设备
flutter run -d macos           # 示例：macOS 桌面
flutter run -d windows
flutter run -d chrome          # Web（需自行处理不兼容插件）
```

构建发布包可参考官方文档：`flutter build apk`、`flutter build macos` 等。

## 后端与地址配置

客户端内多处写死了本地联调地址，部署到服务器或真机时请**全局搜索并替换**为你的主机 IP 与端口。

| 用途 | 默认地址（示例） | 主要出现位置 |
|------|------------------|--------------|
| Socket.IO（考勤、行为统计等） | `http://127.0.0.1:5000` | `lib/screens/check_in/`、`behavior_info/` 等 |
| 车间人数 WebSocket | `ws://localhost:8766`～`8770`（各车间端口不同） | `lib/screens/count_num01/`～`count_num05/` 的 `count.dart` |
| 温湿度 WebSocket | `ws://localhost:8765` | `lib/screens/temper_humidity/socket.dart` |
| 行为检测视频列表等 | `ws://localhost:8765` | `lib/screens/behavior_detect/show_list_before.dart` |
| 工厂调度 TCP | `localhost:12345` | `lib/screens/factory_layout/layout.dart` |
| 员工信息 HTTP 提交 | `http://127.0.0.1:5000/store_data` | `lib/screens/add_employee/add_info.dart` |

事件名示例：`latest_attendance`、`sign_num`、`get_latest_violation` 等，需与后端 Socket.IO 服务约定一致。

## 配置文件

- **`lib/config.ini`**：当前内容为 Windows 风格路径示例（员工照片目录），用于「录入员工」流程中读取保存路径。克隆到其他机器或 macOS/Linux 上时，请改为本机有效路径。
- 同目录下另有 `lib/screens/add_employee/config.ini`，逻辑上用于相对路径场景，请与业务代码中的读取方式保持一致。

## 目录结构（节选）

```
lib/
  main.dart                 # 应用入口
  constants.dart            # 主题色与通用常量
  screens/
    router/router.dart      # go_router 路由表
    main/                   # 壳布局与侧栏
    dashboard/              # 主界面
    check_in/               # 考勤
    add_employee/           # 录入员工
    count_num01~05/         # 各车间实时人数
    temper_humidity/        # 温湿度
    behavior_detect/        # 行为检测画面
    behavior_info/          # 行为统计
    extinguisher/           # 消防检测
    factory_layout/         # 生产调度等
    factory_layout_1/       # 工厂布局展示
  controllers/             # 如 MenuAppController（抽屉/Scaffold）
assets/                    # 图片、图标、演示视频等
fonts/                     # NotoSansSC 字体
```

## 致谢与许可

- 界面骨架来源于开源的 Flutter 响应式 Admin/Dashboard 模板（原作者 Abu Anwar MD Abdullah），原仓库说明见历史提交或模板文档。
- 原模板部分遵循 **MIT License**，见仓库根目录 `LICENSE`。

---

若你需要把 **Dart 3 / 最新 Flutter** 跑通本工程，或希望将后端地址集中为单一配置文件，可以在 Issue 中说明目标环境，便于针对性调整依赖与工程配置。
