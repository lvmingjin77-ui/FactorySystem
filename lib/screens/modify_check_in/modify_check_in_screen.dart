// import 'package:admin/screens/add_employee/add_info.dart';
// import 'package:admin/screens/modify_employee/components/header.dart';
// import 'package:admin/screens/modify_employee/search_info.dart';
// import 'package:admin/screens/add_employee/drop_image.dart';
import 'package:admin/screens/modify_check_in/components/header.dart';
import 'package:admin/screens/modify_check_in/search_info.dart';
import 'package:flutter/material.dart';
// import 'package:admin/responsive.dart';
// import 'package:admin/screens/add_employee/components/my_fields.dart';
// import 'package:flutter/material.dart';
import '../../constants.dart';
// import 'components/header.dart';
// import 'components/recent_files.dart';
// import 'components/storage_details.dart';

class ModifyCheckInScreen extends StatefulWidget {
  const ModifyCheckInScreen({super.key});

  @override
  State<ModifyCheckInScreen> createState() => _ModifyCheckInScreenState();
}

class _ModifyCheckInScreenState extends State<ModifyCheckInScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 将主轴尺寸设置为MainAxisSize.min
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()), // 左侧空白部分
                  Expanded(
                    flex: 2,
                    child: SearchAndModify(), // 直接使用SearchAndModify
                  ),
                  Expanded(child: Container()), // 右侧空白部分
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
