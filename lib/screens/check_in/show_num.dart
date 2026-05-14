import 'package:admin/constants.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ShowCheckInNum extends StatefulWidget {
  // final Function(int signInCount, int signOutCount, int comeLateCount, int leaveEarlyCount) updateCheckCallBack;

  const ShowCheckInNum({super.key});
  // const ShowCheckInNum({super.key, required this.updateCheckCallBack});

  @override
  State<ShowCheckInNum> createState() => ShowCheckInNumState();
}

class ShowCheckInNumState extends State<ShowCheckInNum> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered1 = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered1 = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 55, 82),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: isHovered1 ? Colors.white : Colors.black,
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
                            Color.fromARGB(255, 42, 45, 62).withOpacity(0),
                          ],
                          // begin: Alignment.topCenter,
                          // end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/签到.png', // 替换为你的图标路径
                            width: 100, // 根据需要调整图标大小
                            height: 100,
                          ),
                          Text(
                            '签到人数：',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: defaultPadding), // 添加间距
                          AnimatedFlipCounter(
                            value: currentSignInCount,
                            duration:
                                const Duration(milliseconds: 500), // 动画持续时间
                            textStyle: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold), // 文本样式
                            // prefix: "有动画：", // 前缀
                          ),
                        ],
                      )),
                ),
              )),
        ),
        SizedBox(height: defaultPadding),
        Expanded(
            flex: 1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovered2 = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovered2 = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 42, 55, 82),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: isHovered2 ? Colors.white : Colors.black,
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
                              Color.fromARGB(255, 42, 45, 62).withOpacity(0),
                            ],
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/签退.png', // 替换为你的图标路径
                              width: 100, // 根据需要调整图标大小
                              height: 100,
                            ),
                            Text(
                              '签退人数：',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: defaultPadding), // 添加间距
                            AnimatedFlipCounter(
                              value: currentSignOutCount,
                              duration:
                                  const Duration(milliseconds: 500), // 动画持续时间
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold), // 文本样式
                              // prefix: "有动画：", // 前缀
                            ),
                          ],
                        )),
                  ),
                ))),
        SizedBox(height: defaultPadding),
        Expanded(
            flex: 1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovered3 = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovered3 = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 42, 55, 82),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: isHovered3 ? Colors.white : Colors.black,
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
                              Color.fromARGB(255, 42, 45, 62).withOpacity(0),
                            ],
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/迟到.png', // 替换为你的图标路径
                              width: 100, // 根据需要调整图标大小
                              height: 100,
                            ),
                            Text(
                              '迟到人数：',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: defaultPadding), // 添加间距
                            AnimatedFlipCounter(
                              value: currentComeLateCount,
                              duration:
                                  const Duration(milliseconds: 500), // 动画持续时间
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold), // 文本样式
                              // prefix: "有动画：", // 前缀
                            ),
                          ],
                        )),
                  ),
                ))),
        SizedBox(height: defaultPadding),
        Expanded(
            flex: 1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovered4 = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovered4 = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 42, 55, 82),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: isHovered4 ? Colors.white : Colors.black,
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
                              Color.fromARGB(255, 42, 45, 62).withOpacity(0),
                            ],
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/早退.png', // 替换为你的图标路径
                              width: 100, // 根据需要调整图标大小
                              height: 100,
                            ),
                            Text(
                              '早退人数：',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: defaultPadding), // 添加间距
                            AnimatedFlipCounter(
                              value: currentLeaveEarlyCount,
                              duration:
                                  const Duration(milliseconds: 500), // 动画持续时间
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold), // 文本样式
                              // prefix: "有动画：", // 前缀
                            ),
                          ],
                        )),
                  ),
                ))),
      ],
    );
  }
}
