import 'package:admin/constants.dart';
import 'package:admin/screens/factory_layout/employee.dart';
import 'package:admin/screens/factory_layout/employeeInfo.dart';
import 'package:flutter/material.dart';

class PlanInfo extends StatefulWidget {
  const PlanInfo({super.key});

  @override
  State<PlanInfo> createState() => PlanInfoState();
}

class PlanInfoState extends State<PlanInfo> {
  bool isHovered6 = false;

  // 添加一个函数用于更新员工信息
  void updateEmployeesDisplay() {
    setState(() {
      employees = employees2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered6 = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered6 = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 42, 55, 82),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: isHovered6 ? Colors.white : Colors.black,
              blurRadius: 10,
              spreadRadius: 0,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 42, 45, 62),
                Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '员工调度安排表', // 这里是你想要显示的文本，表明视频列表的字样
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: defaultPadding), // 添加一些间隔
              Expanded(
                child: ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (BuildContext context, int index) {
                    return EmployeeCard(employee: employees[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
