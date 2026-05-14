import 'package:admin/screens/add_employee/add_info.dart';
// import 'package:admin/screens/add_employee/drop_image.dart';
import 'package:flutter/material.dart';
// import 'package:admin/responsive.dart';
// import 'package:admin/screens/add_employee/components/my_fields.dart';
// import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/header.dart';
// import 'components/recent_files.dart';
// import 'components/storage_details.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: true,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [AddInfo()],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
