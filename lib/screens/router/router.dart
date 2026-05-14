import 'package:admin/screens/add_employee/add_employee_screen.dart';
import 'package:admin/screens/behavior_detect/behavior_detect_screen.dart';
import 'package:admin/screens/behavior_info/behavior_info_screen.dart';
import 'package:admin/screens/count_num02/count_num_screen.dart';
import 'package:admin/screens/count_num03/count_num_screen.dart';
import 'package:admin/screens/count_num04/count_num_screen.dart';
import 'package:admin/screens/count_num05/count_num_screen.dart';
import 'package:admin/screens/extinguisher/extinguisher_screen.dart';
import 'package:admin/screens/factory_layout/factory_layout_.dart';
import 'package:admin/screens/factory_layout_1/factory_layout_.dart';
// import 'package:admin/screens/factory_layout_1/layout.dart';
import 'package:admin/screens/modify_check_in/modify_check_in_screen.dart';
// import 'package:admin/screens/modify_employee/modify_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../dashboard/dashboard_screen.dart';
import '../check_in/check_in_screen.dart';
import '../count_num01/count_num_screen.dart';
import '../temper_humidity/temper_humidity.dart';
import '../main/main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: "/dashBoard",
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainScreen(
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/dashBoard',
          name: "dashBoard",
          builder: (context, state) => DashboardScreen(),
        ),
        GoRoute(
          path: '/check_in',
          name: "check_in",
          builder: (context, state) => CheckInScreen(),
        ),
        GoRoute(
          path: '/add_employee',
          name: "add_employee",
          builder: (context, state) => AddEmployeeScreen(),
        ),
        GoRoute(
          path: '/count_num01',
          name: "count_num01",
          builder: (context, state) => CountNumScreen01(),
        ),
        GoRoute(
          path: '/count_num02',
          name: "count_num02",
          builder: (context, state) => CountNumScreen02(),
        ),
        GoRoute(
          path: '/count_num03',
          name: "count_num03",
          builder: (context, state) => CountNumScreen03(),
        ),
        GoRoute(
          path: '/count_num04',
          name: "count_num04",
          builder: (context, state) => CountNumScreen04(),
        ),
        GoRoute(
          path: '/count_num05',
          name: "count_num05",
          builder: (context, state) => CountNumScreen05(),
        ),
        GoRoute(
          path: '/temper_humidity',
          name: "temper_humidity",
          builder: (context, state) => TemperHumidityScreen(),
        ),
                GoRoute(
          path: '/behavior_detect',
          name: "behavior_detect",
          builder: (context, state) => BehaviorDetectScreen(),
        ),
                GoRoute(
          path: '/extinguisher',
          name: "extinguisher",
          builder: (context, state) => ExtinguisherScreen(),
        ),
        GoRoute(
          path: '/factory_layout',
          name: "factory_layout",
          builder: (context, state) => FactoryLayoutScreen(),
        ),
                GoRoute(
          path: '/behavior_info',
          name: "behavior_info",
          builder: (context, state) => BehaviorInfoScreen(),
        ),
        GoRoute(
          path: '/modify_check_in',
          name: "modify_check_in",
          builder: (context, state) => ModifyCheckInScreen(),
        ),
        GoRoute(
          path: '/layout_show',
          name: "layout_show",
          builder: (context, state) => FactoryLayoutShowScreen(),
        ),
      ],
    ),
  ],
);