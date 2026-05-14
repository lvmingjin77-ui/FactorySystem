import 'package:admin/constants.dart';
import 'package:admin/screens/behavior_info/employee.dart';
// import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ShowList extends StatefulWidget {
  const ShowList({super.key});

  @override
  State<ShowList> createState() => ShowListState();
}

class ShowListState extends State<ShowList> {
  int currentSignInCount = 0;
  int currentSignOutCount = 0;
  int currentComeLateCount = 0;
  int currentLeaveEarlyCount = 0;
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  bool isHovered4 = false;

  late io.Socket socket;

  @override
  void initState() {
    super.initState();

    // 连接 Socket.IO 服务器
    socket = io.io('http://127.0.0.1:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // 监听 Socket.IO 事件 - 新数据通知
    socket.on('new_data_notification', (_) {
      // 收到通知后重新获取最新数据
      getSignNum();
      // fetchLatestData();
    });

    socket.on('sign_num_result', (data) {
      if (data != null && data is List) {
        setState(() {
          print(data);
          currentSignInCount = data[0];
          currentSignOutCount = data[1];
          currentComeLateCount = data[2];
          currentLeaveEarlyCount = data[3];
        });
      }
    });

    // 手动连接
    socket.connect();

    // 初始加载数据
    getSignNum();
  }

  // 获取最新数据
  Future<void> getSignNum() async {
    // 使用 Socket.IO 向后端请求最新数据
    socket.emit('sign_num');
  }

  @override
  void dispose() {
    // 关闭 Socket.IO 连接
    socket.disconnect();
    super.dispose();
  }

  void updateData(int signInCount, int signOutCount, int comeLateCount,
      int leaveEarlyCount) {
    print(4);
    setState(() {
      currentSignInCount = signInCount;
      currentSignOutCount = signOutCount;
      currentComeLateCount = comeLateCount;
      currentLeaveEarlyCount = leaveEarlyCount;
    });
  }

  //   final List<Employee> employees = [
  //   Employee(id: 1, name: 'John Doe', photo: 'assets/john_doe.jpg'),
  //   Employee(id: 2, name: 'Jane Smith', photo: 'assets/jane_smith.jpg'),
  //   // Add more employees here
  // ];

List<Employee> employees = [
    Employee(
      id: 18,
      name: '曹静',
      photo: 'assets/images/t18.jpg',
      infractions: 9,
      deductions: '90',
    ),
    Employee(
      id: 12,
      name: '赵伟',
      photo: 'assets/images/t12.jpg',
      infractions: 8,
      deductions: '80',
    ),
    Employee(
      id: 3,
      name: '陈婷',
      photo: 'assets/images/t3.jpg',
      infractions: 7,
      deductions: '70',
    ),
    Employee(
      id: 16,
      name: '郑敏',
      photo: 'assets/images/t16.jpg',
      infractions: 5,
      deductions: '50',
    ),
    Employee(
      id: 6,
      name: '黄芳',
      photo: 'assets/images/t6.jpg',
      infractions: 4,
      deductions: '40',
    ),
    Employee(
      id: 8,
      name: '徐秀英',
      photo: 'assets/images/t8.jpg',
      infractions: 1,
      deductions: '10',
    ),
    Employee(
      id: 11,
      name: '许娟',
      photo: 'assets/images/t11.jpg',
      infractions: 2,
      deductions: '20',
    ),
];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - defaultPadding * 7,
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
                '本月不规范员工列表', // 这里是你想要显示的文本，表明视频列表的字样
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
