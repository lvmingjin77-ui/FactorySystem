import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Transform.scale(
              scale: 0.8,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          DrawerListTile(
            title: "主界面",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              context.goNamed("dashBoard");
            },
          ),
          DrawerListTile(
            title: "考勤界面",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              context.goNamed("check_in");
            },
          ),
          Theme(
            data: Theme.of(context).copyWith(
              // 覆盖ExpansionTile的默认主题
              expansionTileTheme: ThemeData.dark().expansionTileTheme.copyWith(
                    // 设置标题内边距，调整标题和左侧外边框之间的间距
                    tilePadding: EdgeInsets.only(left: 0, right: 10),
                  ),
              // 设置分割线的颜色为透明
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: IgnorePointer(
                ignoring: true,
                child: DrawerListTile(
                  title: "实时人数",
                  svgSrc: "assets/icons/menu_task.svg",
                  press: () {},
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "        一号车间实时人数",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测画面的逻辑
                    context.goNamed("count_num01");
                  },
                ),
                ListTile(
                  title: Text(
                    "        二号车间实时人数",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测统计的逻辑
                    context.goNamed("count_num02");
                  },
                ),
                ListTile(
                  title: Text(
                    "        三号车间实时人数",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测统计的逻辑
                    context.goNamed("count_num03");
                  },
                ),
                ListTile(
                  title: Text(
                    "        四号车间实时人数",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测统计的逻辑
                    context.goNamed("count_num04");
                  },
                ),
                ListTile(
                  title: Text(
                    "        五号车间实时人数",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测统计的逻辑
                    context.goNamed("count_num05");
                  },
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: "实时温湿度",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              context.goNamed("temper_humidity");
            },
          ),
          Theme(
            data: Theme.of(context).copyWith(
              // 覆盖ExpansionTile的默认主题
              expansionTileTheme: ThemeData.dark().expansionTileTheme.copyWith(
                    // 设置标题内边距，调整标题和左侧外边框之间的间距
                    tilePadding: EdgeInsets.only(left: 0, right: 10),
                  ),
              // 设置分割线的颜色为透明
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: IgnorePointer(
                ignoring: true, // 忽略指针事件
                child: DrawerListTile(
                  title: "行为检测",
                  svgSrc: "assets/icons/menu_store.svg",
                  press: () {
                    // 如果需要在 DrawerListTile 被点击时执行操作，可以在这里添加代码
                  },
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "        检测画面",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测画面的逻辑
                    context.goNamed("behavior_detect");
                  },
                ),
                ListTile(
                  title: Text(
                    "        行为统计",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测统计的逻辑
                    context.goNamed("behavior_info");
                  },
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: "消防检测",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              context.goNamed("extinguisher");
            },
          ),
          Theme(
            data: Theme.of(context).copyWith(
              // 覆盖ExpansionTile的默认主题
              expansionTileTheme: ThemeData.dark().expansionTileTheme.copyWith(
                    // 设置标题内边距，调整标题和左侧外边框之间的间距
                    tilePadding: EdgeInsets.only(left: 0, right: 10),
                  ),
              // 设置分割线的颜色为透明
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: IgnorePointer(
                ignoring: true,
                child: DrawerListTile(
                  title: "工厂调度",
                  svgSrc: "assets/icons/menu_store.svg",
                  press: () {},
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "        工厂布局",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测画面的逻辑
                    context.goNamed("layout_show");
                  },
                ),
                ListTile(
                  title: Text(
                    "        生产调度",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // 处理点击检测统计的逻辑
                    context.goNamed("factory_layout");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
