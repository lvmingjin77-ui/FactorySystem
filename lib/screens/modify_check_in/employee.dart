import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class Employee {
  final int id;
  final String name;
  final String photo;
  final String position;
  final String department;
  final String todaySignInstate;
  final String todaySignOutstate;
  final int lastSignIn;
  final int lastLate;
  final int lastSignOut;
  final int lastLeaveEarly;
  // final String signInTime;

  Employee({
    required this.id,
    required this.name,
    required this.photo,
    required this.position,
    required this.department,
    required this.todaySignInstate,
    required this.todaySignOutstate,
    required this.lastSignIn,
    required this.lastLate,
    required this.lastSignOut,
    required this.lastLeaveEarly,
  });
}

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultPadding * 2),
            child: CircleAvatar(
              backgroundImage: AssetImage(employee.photo),
              radius: 70,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: defaultPadding * 2,
                ),
                Text(
                  employee.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    // color: Colors.cyan,
                  ),
                ),
                Text(
                  '员工ID: ${employee.id}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '部门: ${employee.department}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '职位: ${employee.position}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '今日签到状态: ${employee.todaySignInstate}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '今日签退状态: ${employee.todaySignInstate}',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.only(right: defaultPadding*2),
                  child: Divider(
            // 插入分割线
            color: Color.fromARGB(255, 52, 55, 78),
            thickness: 1,
            height: 20,
          ),
                ),
                          
                Text(
                  '过去七天签到次数: ${employee.lastSignIn}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '过去七天迟到次数: ${employee.lastLate}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '过去七天签退次数: ${employee.lastSignOut}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '过去七天早退次数: ${employee.lastLeaveEarly}',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            String dropdownValue1 = '签到状态'; // Default value
                            String dropdownValue2 = '签到'; // Default value
                            String newValue = '';
                            DateTime selectedDate = DateTime.now();

                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Text('修改考勤信息'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.calendar_today),
                                            onPressed: () async {
                                              final DateTime? picked =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: selectedDate,
                                                firstDate: DateTime(2015, 8),
                                                lastDate: DateTime(2101),
                                              );
                                              if (picked != null &&
                                                  picked != selectedDate)
                                                setState(() {
                                                  selectedDate = picked;
                                                });
                                            },
                                          ),
                                          Text(
                                              '选择日期: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}'),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              DropdownButton<String>(
                                                value: dropdownValue1,
                                                onChanged: (String? newValue) {
                                                  if (newValue != null) {
                                                    setState(() {
                                                      dropdownValue1 = newValue;
                                                      if (dropdownValue1 ==
                                                              '签退状态' &&
                                                          dropdownValue2 ==
                                                              '签到') {
                                                        dropdownValue2 = '签退';
                                                      }
                                                      if (dropdownValue1 ==
                                                              '签到状态' &&
                                                          dropdownValue2 ==
                                                              '签退') {
                                                        dropdownValue2 = '签到';
                                                      }
                                                    });
                                                  }
                                                },
                                                items: <String>[
                                                  '签到状态',
                                                  '签退状态',
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              DropdownButton<String>(
                                                value: dropdownValue2,
                                                onChanged: (String? newValue) {
                                                  if (newValue != null) {
                                                    setState(() {
                                                      dropdownValue2 = newValue;
                                                    });
                                                  }
                                                },
                                                items: dropdownValue1 == '签到状态'
                                                    ? <String>[
                                                        '签到',
                                                        '迟到',
                                                      ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList()
                                                    : <String>[
                                                        '签退',
                                                        '早退',
                                                      ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      // TextFormField(
                                      //   onChanged: (value) {
                                      //     newValue = value;
                                      //   },
                                      //   decoration: InputDecoration(
                                      //     labelText: '修改内容',
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('取消'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Perform modification here
                                        print('Date: $selectedDate');
                                        print(
                                            'Dropdown value: $dropdownValue1 - $dropdownValue2');
                                        print('New value: $newValue');
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '修改成功!',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            backgroundColor: Colors.black,
                                          ),
                                        );
                                      },
                                      child: Text('确认'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Text('修改考勤信息'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
