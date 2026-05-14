// import 'dart:io';

// import 'dart:io';

import 'package:admin/constants.dart';
import 'package:admin/screens/check_in/pie/pie1.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/gestures.dart';
// import 'package:admin/models/RecentCheckIn.dart';
// import 'package:admin/screens/check_in/components/recent_check_in.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ShowRowInfo extends StatefulWidget {
  const ShowRowInfo({super.key});

  @override
  State<ShowRowInfo> createState() => ShowRowInfoState();
}

class ShowRowInfoState extends State<ShowRowInfo> {
  late io.Socket socket;
  List<dynamic> latestData = [];
  List<dynamic> signNum = [];

  @override
  void initState() {
    super.initState();

    // 连接 Socket.IO 服务器
    socket = io.io('http://127.0.0.1:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // 监听 Socket.IO 事件 - 最新出勤数据
    socket.on('latest_attendance', (data) {
      if (data != null && data is List) {
        setState(() {
          latestData = data;
        });
      }
    });

    // 监听 Socket.IO 事件 - 新数据通知
    socket.on('new_data_notification', (_) {
      // 收到通知后重新获取最新数据
      fetchLatestData();
    });

    // 手动连接
    socket.connect();

    // 初始加载数据
    fetchLatestData();
  }

  Future<void> fetchLatestData() async {
    // 使用 Socket.IO 向后端请求最新数据
    socket.emit('get_latest_attendance');
  }

  @override
  void dispose() {
    // 关闭 Socket.IO 连接
    socket.disconnect();
    super.dispose();
  }

  // void disconnectWebSocket() {
  //   if (mounted && socket != null) {
  //     socket.disconnect();
  //   }
  // }
  bool showDataList = true;
  // int signInCount = 10;
  // final int lateCount = 2;
  // final int absenceCount = 3;

  // late int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            children: [
              Expanded(
                child: showDataList ? buildDataList() : buildPieChart(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        showDataList = true;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        showDataList = false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildDataList() {
    return Container(
      // decoration: BoxDecoration(
      //   color: Color.fromARGB(255, 42, 55, 82),
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Colors.black,
      //       blurRadius: 10,
      //       spreadRadius: 0,
      //     )
      //   ],
      // ),
      // child: Container(
      // padding: EdgeInsets.all(defaultPadding),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   gradient: LinearGradient(
      //     colors: [
      //       Color.fromARGB(255, 42, 45, 62),
      //       Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
      //     ],
      //   ),
      // ),
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
                      columnSpacing: defaultPadding,
                      columns: [
                        DataColumn(
                          label: Text(
                            "员工ID",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
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
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(197, 184, 110, 1),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "职位",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(197, 184, 110, 1),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "部门",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(197, 184, 110, 1),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "签到状态",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(197, 184, 110, 1),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "签到时间",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
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
                              DataCell(Text(data["position"] ?? "")),
                              DataCell(Text(data["department"] ?? "")),
                              DataCell(Text(data["work_status"] ?? "")),
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
      // ),
    );
  }

  Widget buildPieChart() {
    return Container(
        child: PieChart1()
    //     Column(
    //   children: [
    //     Expanded(
    //         child: Container(
    //       // decoration: BoxDecoration(
    //       //   border: Border.all(
    //       //     color: Colors.black, // 边框颜色
    //       //     width: 2.0, // 边框宽度
    //       //   ),
    //       // ),
    //       child: PieChart1(),
    //     )),
    //     SizedBox(
    //       width: defaultPadding,
    //     ),
    //     Expanded(
    //         child: Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: Colors.black, // 边框颜色
    //           width: 2.0, // 边框宽度
    //         ),
    //       ),
    //     ))
    //   ],
    // )
    );
  }
}
