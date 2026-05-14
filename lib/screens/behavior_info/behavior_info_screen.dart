import 'package:admin/constants.dart';
import 'package:admin/screens/behavior_info/components/header.dart';
// import 'package:admin/screens/behavior_info/info.dart';
import 'package:admin/screens/behavior_info/info_demo.dart';
import 'package:admin/screens/behavior_info/show_num.dart';
// import 'package:admin/responsive.dart';
// import 'package:admin/screens/check_in/components/header.dart';
// import 'package:admin/screens/check_in/components/recent_check_in.dart';
// import 'package:admin/screens/check_in/components/storage_details.dart';
// import 'package:admin/screens/check_in/info.dart';
// import 'package:admin/screens/check_in/show_num.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class BehaviorInfoScreen extends StatefulWidget {
  const BehaviorInfoScreen({super.key});

  @override
  State<BehaviorInfoScreen> createState() => _BehaviorInfoScreenState();
}

class _BehaviorInfoScreenState extends State<BehaviorInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(
                              child: ShowBehaviorInfoDemo(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        flex: 2,
                        child: ShowList(),
                      ),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
