import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class Employee {
  final int id;
  final String name;
  final String photo;
  final int workStationId;
  final String workType;

  Employee({
    required this.id,
    required this.name,
    required this.photo,
    required this.workStationId,
    required this.workType,
  });
}

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 5 / 2,
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: defaultPadding*3,),
                    CircleAvatar(
                      backgroundImage: AssetImage(employee.photo),
                      radius: 40.0,
                    ),
                    SizedBox(width: defaultPadding*3),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            employee.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'ID: ${employee.id}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '工作车间: ${employee.workStationId}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '工作班次: ${employee.workType}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: defaultPadding),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         showDialog(
              //           context: context,
              //           builder: (BuildContext context) {
              //             return AlertDialog(
              //               title: Text('是否要发送警示信息'),
              //               actions: <Widget>[
              //                 TextButton(
              //                   onPressed: () {
              //                     Navigator.of(context).pop();
              //                   },
              //                   child: Text('取消'),
              //                 ),
              //                 TextButton(
              //                   onPressed: () {
              //                     Navigator.of(context).pop();
              //                     ScaffoldMessenger.of(context).showSnackBar(
              //                       SnackBar(
              //                         content: Text('发送成功!',
              //                         style: TextStyle(color: Colors.white),
              //                         ),
              //                         backgroundColor: Colors.black,
              //                       ),
              //                     );
              //                   },
              //                   child: Text('确认'),
              //                 ),
              //               ],
              //             );
              //           },
              //         );
              //       },
              //       child: Text('发送警示信息'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}