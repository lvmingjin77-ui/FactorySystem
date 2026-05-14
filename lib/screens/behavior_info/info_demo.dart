import 'package:flutter/material.dart';

class ShowBehaviorInfoDemo extends StatefulWidget {
  const ShowBehaviorInfoDemo({Key? key}) : super(key: key);

  @override
  State<ShowBehaviorInfoDemo> createState() => ShowBehaviorInfoDemoState();
}

class ShowBehaviorInfoDemoState extends State<ShowBehaviorInfoDemo> {
  List<dynamic> latestData = [
    {
      "id": 3,
      "name": "陈婷",
      "department": "车间3",
      "type": "打架",
      "timestamp": "2024-03-20 14:25:00"
    },
    {
      "id": 1,
      "name": "王宁",
      "department": "车间2",
      "type": "抽烟",
      "timestamp": "2024-03-20 13:20:00"
    },
    {
      "id": 6,
      "name": "黄芳",
      "department": "车间1",
      "type": "吃东西",
      "timestamp": "2024-03-20 11:45:00"
    },
    {
      "id": 4,
      "name": "刘阳",
      "department": "车间4",
      "type": "吃东西",
      "timestamp": "2024-03-20 10:45:00"
    },
    {
      "id": 5,
      "name": "李明",
      "department": "车间3",
      "type": "抽烟",
      "timestamp": "2024-03-20 09:15:00"
    },
    {
      "id": 2,
      "name": "张磊",
      "department": "车间5",
      "type": "吃东西",
      "timestamp": "2024-03-20 09:05:00"
    },
    {
      "id": 6,
      "name": "黄芳",
      "department": "车间2",
      "type": "打架",
      "timestamp": "2024-03-19 16:30:00"
    },
    {
      "id": 5,
      "name": "李明",
      "department": "车间1",
      "type": "打电话",
      "timestamp": "2024-03-19 15:20:00"
    },
    {
      "id": 2,
      "name": "张磊",
      "department": "车间5",
      "type": "打架",
      "timestamp": "2024-03-19 15:00:00"
    },
    {
      "id": 1,
      "name": "王宁",
      "department": "车间2",
      "type": "打电话",
      "timestamp": "2024-03-19 13:45:00"
    },
    {
      "id": 4,
      "name": "刘阳",
      "department": "车间4",
      "type": "抽烟",
      "timestamp": "2024-03-19 13:00:00"
    },
    {
      "id": 3,
      "name": "陈婷",
      "department": "车间1",
      "type": "打电话",
      "timestamp": "2024-03-19 11:10:00"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 42, 55, 82),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: 0,
            )
          ],
        ),
        child: Container(
          padding:
              EdgeInsets.all(20), // Changed defaultPadding to 20 for simplicity
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 42, 45, 62),
                Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing:
                              20, // Changed defaultPadding to 20 for simplicity
                          columns: [
                            DataColumn(
                              label: Text(
                                "员工ID",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(197, 184, 110, 1),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "姓名",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(197, 184, 110, 1),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "车间",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(197, 184, 110, 1),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "违规行为",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(197, 184, 110, 1),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "违规时间",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(197, 184, 110, 1),
                                ),
                              ),
                            ),
                          ],
                          rows: List.generate(
                            latestData.length,
                            (index) {
                              var data = latestData[index];
                              return DataRow(
                                cells: [
                                  DataCell(Text(data["id"].toString())),
                                  DataCell(Text(data["name"] ?? "")),
                                  DataCell(Text(data["department"] ?? "")),
                                  DataCell(Text(data["type"] ?? "")),
                                  DataCell(Text(data["timestamp"] ?? "")),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
