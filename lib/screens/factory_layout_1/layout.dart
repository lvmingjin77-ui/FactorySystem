import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:go_router/go_router.dart'; // 导入dart:ui包

class LayoutShow extends StatefulWidget {
  const LayoutShow({Key? key}) : super(key: key);

  @override
  State<LayoutShow> createState() => _LayoutShowState();
}

class _LayoutShowState extends State<LayoutShow> {
  late List<Employee> _employees;
  Timer? _timer;
  // ignore: unused_field
  DateTime _currentTime = DateTime.now();
  DateTime _initTime = DateTime.now(); // 记录界面初始化的时间
  bool _movementStarted = false;
  bool _movementStopped = false;

  double robotLeft = 485;
  double robotTop = 100;

  @override
  void initState() {
    super.initState();

    _startTimer();

    _employees = [
      Employee(
          name: '王宁',
          position: '软件工程师',
          id: '1',
          dotPosition: Offset(1150.0, 460.0)),
      Employee(
          name: '张磊',
          position: '系统工程师',
          id: '2',
          dotPosition: Offset(200.0, 255.0)),
      Employee(
          name: '马婷',
          position: '产品经理',
          id: '3',
          dotPosition: Offset(750.0, 235.0)),
      Employee(
          name: '刘阳',
          position: '项目经理',
          id: '4',
          dotPosition: Offset(620.0, 620.0)),
      Employee(
          name: '李明',
          position: '工程师',
          id: '5',
          dotPosition: Offset(970.0, 600.0)),
      Employee(
          name: '黄芳',
          position: '项目经理',
          id: '6',
          dotPosition: Offset(100.0, 100.0)),
      Employee(
          name: '吴勇',
          position: '工程师',
          id: '7',
          dotPosition: Offset(700.0, 300.0)),
    ];

    _startPeriodicTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startPeriodicTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // 计算时间差，单位为秒
      int elapsedTime = DateTime.now().difference(_initTime).inSeconds;
      _updateEmployeeDotPosition(_employees[0], elapsedTime);
      moveRobot();
    });
  }

  void _updateEmployeeDotPosition(Employee employee, int elapsedTime) {
    if (!_movementStarted && elapsedTime >= 0) {
      // 开始运动
      _movementStarted = true;
    } else if (_movementStarted && !_movementStopped && elapsedTime < 7) {
      // 持续运动10秒
      setState(() {
        if (employee.dotPosition != null) {
          employee.dotPosition = Offset(
            employee.dotPosition!.dx + 20.0,
            employee.dotPosition!.dy,
          );
        }
      });
    } else if (_movementStarted && !_movementStopped && elapsedTime >= 7 && elapsedTime < 15) {
      // 向下运动3秒
      setState(() {
        if (employee.dotPosition != null) {
          employee.dotPosition = Offset(
            employee.dotPosition!.dx,
            employee.dotPosition!.dy + 15.0,
          );
        }
      });
    }else if (!_movementStopped && elapsedTime >= 15) {
      // 停止运动
      _movementStopped = true;
    }
  }

  //   void _updateEmployeeDotPosition(Employee employee, int elapsedTime) {
  //   if (!_movementStarted && elapsedTime >= 5) {
  //     // 开始向右运动
  //     _movementStarted = true;
  //   } else if (_movementStarted && !_movementStopped && elapsedTime < 8) {
  //     // 持续向右运动3秒
  //     setState(() {
  //       if (employee.dotPosition != null) {
  //         employee.dotPosition = Offset(
  //           employee.dotPosition!.dx + 20.0,
  //           employee.dotPosition!.dy,
  //         );
  //       }
  //     });
  //   } else if (_movementStarted && !_movementStopped && elapsedTime >= 8 && elapsedTime < 11) {
  //     // 向下运动3秒
  //     setState(() {
  //       if (employee.dotPosition != null) {
  //         employee.dotPosition = Offset(
  //           employee.dotPosition!.dx,
  //           employee.dotPosition!.dy + 20.0,
  //         );
  //       }
  //     });
  //   } else if (!_movementStopped && elapsedTime >= 11) {
  //     // 停止运动
  //     _movementStopped = true;
  //   }
  // }

  void moveRobot() {
    setState(() {
      robotTop += 3;
    });
  }

  void _showCustomDialog(BuildContext context, Employee employee) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("员工信息"),
          content: Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 80),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("姓名：${employee.name}",
                            style: TextStyle(fontSize: 16)),
                        Text("岗位：${employee.position}",
                            style: TextStyle(fontSize: 16)),
                        Text("工号：${employee.id}",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 40,
                    // 根据员工信息设置头像，这里假设头像路径为固定的
                    backgroundImage:
                        AssetImage('assets/images/t${employee.id}.jpg'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConversationDialog(employee: employee);
                  },
                );
              },
              child: Text("私信"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("退出"),
            ),
          ],
        );
      },
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  String _formatTime(DateTime time) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitHours = twoDigits(time.hour);
    String twoDigitMinutes = twoDigits(time.minute);
    String twoDigitSeconds = twoDigits(time.second);
    return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
  }

  void _showRobotInfoDialog(BuildContext context) {
    bool _isHovered = false;

    Timer? _refreshTimer;

    // 更新巡检时间的方法
    void _updateInspectionTime() {
      if (mounted) {
        setState(() {});
      }
    }

    // 启动定时器
    void _startRefreshTimer() {
      _refreshTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        _updateInspectionTime();
      });
    }

    // 停止定时器
    void _stopRefreshTimer() {
      _refreshTimer?.cancel();
    }

    // 在对话框关闭时停止定时器
    void _onDialogClose() {
      _stopRefreshTimer();
    }

    // 在对话框打开时启动定时器
    void _onDialogOpen() {
      _startRefreshTimer();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('机器人巡检信息'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 行为检测

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('行为检测：'),
                    Align(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 50,
                            height: 25,
                            color: Colors.green, // 正常显示绿色方块
                            child: Center(child: Text('正常')),
                          ),
                          InkWell(
                            onTap: () {
                              context.goNamed("behavior_detect");
                              Navigator.of(context).pop();
                            },
                            child: MouseRegion(
                              onEnter: (_) => setState(() => _isHovered = true),
                              onExit: (_) => setState(() => _isHovered = false),
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                '点击查看',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 213, 231, 12),
                                  decoration: _isHovered
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              // 消防检查
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('消防检测：'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          height: 25,
                          color: Colors.red, // 正常显示绿色方块
                          child: Center(child: Text('异常')),
                        ),
                        InkWell(
                          onTap: () {
                            context.goNamed("extinguisher");
                            Navigator.of(context).pop();
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              '点击查看',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 213, 231, 12)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 25, // 设置文本的高度
                child: Text('机器人状态：良好'),
              ),
              SizedBox(height: 5),
              Container(
                height: 25, // 设置文本的高度
                child: Text('今日巡检次数：1'),
              ),
              SizedBox(height: 5),
              Container(
                  height: 25, // 设置文本的高度
                  child: Text('已巡检时间：${_formatTime(DateTime.now())}')),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('退出'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
            image: DecorationImage(
              image: AssetImage('assets/layout3.png'), // 您的图片路径
              fit: BoxFit.fill, // 图片适配方式，这里是填充整个Container
            ),
          ),
        ),
        Positioned(
          left: robotLeft,
          top: robotTop,
          child: GestureDetector(
            onTap: () {
              // 点击机器人标记时显示对话框
              _showRobotInfoDialog(context);
            },
            child: Tooltip(
              // 提示消息
              message: '机器人正在巡检',
              child: RobotMarker(),
            ),
          ),
        ),
        // Displaying red dots for each employee
        for (int i = 0; i < _employees.length; i++)
          Positioned(
            left: _employees[i].dotPosition?.dx ?? 0, // 使用空安全操作符和空合并操作符
            top: _employees[i].dotPosition?.dy ?? 0,
            child: Tooltip(
              message:
                  '姓名：${_employees[i].name}\n岗位：${_employees[i].position}\n工号：${_employees[i].id}',
              child: GestureDetector(
                onTap: () {
                  _showCustomDialog(context, _employees[i]);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red, // 中间是实心的白色
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
// Add a Positioned widget for the red circle cross mark
        Positioned(
          left: 810, // X coordinate
          top: 395, // Y coordinate
          child: Tooltip(
            message: '消防器材状态异常', // 鼠标悬浮时显示的文字
            child: GestureDetector(
              onTap: () {
                // 叉叉点击事件
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.6),
                ),
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ConversationDialog extends StatefulWidget {
  final Employee employee;

  const ConversationDialog({required this.employee});

  @override
  _ConversationDialogState createState() => _ConversationDialogState();
}

class _ConversationDialogState extends State<ConversationDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> _messages = []; // 使用Message对象来表示消息

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.employee.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageTile(message);
                },
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: '请输入消息',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      // 监听文本输入框的键盘事件
                      String messageText = _textEditingController.text.trim();
                      if (messageText.isNotEmpty) {
                        setState(() {
                          _messages.add(Message(
                            text: messageText,
                            isMe: true, // 设置为自己发送的消息
                          ));
                          // 如果发送了三条消息，自动回复 '好的'
                          if (_messages.length % 3 == 0) {
                            Future.delayed(Duration(seconds: 1), () {
                              setState(() {
                                _messages.add(Message(
                                  text: '好的',
                                  isMe: false, // 设置为对方发送的消息
                                ));
                              });
                            });
                          }
                          _textEditingController.clear();
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    String messageText = _textEditingController.text.trim();
                    if (messageText.isNotEmpty) {
                      setState(() {
                        _messages.add(Message(
                          text: messageText,
                          isMe: true, // 设置为自己发送的消息
                        ));

                        if (_messages.length % 3 == 0) {
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              _messages.add(Message(
                                text: '好的',
                                isMe: false, // 设置为对方发送的消息
                              ));
                            });
                          });
                        }
                        _textEditingController.clear();
                      });
                    }
                  },
                  child: Text('发送'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(Message message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: message.isMe
                  ? Color.fromRGBO(149, 236, 105, 1)
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(width: 8.0),
          if (message.isMe) // 如果是自己发送的消息，显示头像在右侧
            Container(
              padding: EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage('assets/images/t0.jpg'), // 使用发送者的头像
              ),
            ),
        ],
      ),
    );
  }

  // Your remaining code for conversation dialog
}

class Message {
  final String text;
  final bool isMe;
  // final String senderAvatar; // 添加发送者头像字段

  Message({required this.text, required this.isMe});
}

class Employee {
  final String name;
  final String position;
  final String id;
  Offset? dotPosition; // 将dotPosition设置为可选类型

  Employee({
    required this.name,
    required this.position,
    required this.id,
    Offset? dotPosition, // 将参数改为可选类型
  }) : dotPosition = dotPosition ?? Offset.zero; // 给dotPosition一个初始值

  // Your remaining code for Employee class
}

class RobotMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.blue, // Customize marker color
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.android, // Customize robot icon
        color: Colors.white, // Customize robot icon color
      ),
    );
  }
}
