// import 'dart:io';

// import 'dart:io';

import 'package:admin/constants.dart';
// import 'package:admin/models/RecentCheckIn.dart';
// import 'package:admin/screens/check_in/components/recent_check_in.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ShowBehaviorInfo extends StatefulWidget {
  const ShowBehaviorInfo({super.key});

  @override
  State<ShowBehaviorInfo> createState() => ShowBehaviorInfoState();
}

class ShowBehaviorInfoState extends State<ShowBehaviorInfo> {
  late io.Socket socket;
  List<dynamic> latestData = [];
  // List<dynamic> signNum = [];

  @override
  void initState() {
    super.initState();

    // 连接 Socket.IO 服务器
    socket = io.io('http://127.0.0.1:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // 监听 Socket.IO 事件 - 最新出勤数据
    socket.on('latest_violation', (data) {
      if (data != null && data is List) {
        setState(() {
          print(7777);
          latestData = data;
        });
      }
    });

    // 监听 Socket.IO 事件 - 新数据通知
    socket.on('new_violation_notification', (_) {
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
    socket.emit('get_latest_violation');
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
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
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
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),
                                )),
                                DataColumn(
                                    label: Text(
                                  "姓名",
                                  style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),
                                )),
                                DataColumn(
                                    label: Text(
                                  "部门",
                                  style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),
                                )),
                                DataColumn(
                                    label: Text(
                                  "违规行为",
                                  style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),
                                )),
                                DataColumn(
                                    label: Text(
                                  "违规时间",
                                  style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),
                                )),
                                // DataColumn(
                                //     label: Text(
                                //   "签到时间",
                                //   style: TextStyle(
                                //       fontSize: 20, // 设置字号为16
                                //       fontWeight: FontWeight.bold, // 加粗
                                //       fontFamily: 'Roboto', // 设置字体
                                //       color: Color.fromRGBO(197, 184, 110, 1)
                                //       // 可以根据需要添加更多样式选项，比如颜色、行高等
                                //       ),
                                // )),
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
            )));
  }
}
