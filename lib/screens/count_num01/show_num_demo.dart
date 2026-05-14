import 'dart:async';

import 'package:admin/constants.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class ShowNumDemo extends StatefulWidget {
  const ShowNumDemo({Key? key}) : super(key: key); // 修改构造函数

  @override
  State<ShowNumDemo> createState() => ShowNumDemoState();
}

class ShowNumDemoState extends State<ShowNumDemo> {
  int currentNumber = 0;
  int currentDownCount = 0;
  int currentUpCount = 0;
  int currentVisitor = 0;
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  bool isHovered4 = false;

  Timer? _customDataTimer;
  Timer? _differentDataTimer1;
  Timer? _differentDataTimer2;
  Timer? _differentDataTimer3;
  Timer? _differentDataTimer4;
  Timer? _differentDataTimer5;
  Timer? _differentDataTimer6;
  Timer? _differentDataTimer7;
  Timer? _differentDataTimer8;
  Timer? _differentDataTimer9;
  Timer? _differentDataTimer10;
  Timer? _differentDataTimer11;
  Timer? _differentDataTimer12;
  Timer? _differentDataTimer13;

  @override
  void initState() {
    super.initState();
    updateData(32);
    // 只在第9秒更新一次自定义数据
    _customDataTimer = Timer(Duration(seconds: 17), () {
      updateData(30);
    });
    // 更新一次不同的数据
    _differentDataTimer1 = Timer(Duration(seconds: 21), () {
      updateData(29);
    });
    _differentDataTimer2 = Timer(Duration(seconds: 22), () {
      updateData(28);
    });
    _differentDataTimer3 = Timer(Duration(seconds: 28), () {
      updateData(27);
    });
    _differentDataTimer4 = Timer(Duration(seconds: 35), () {
      updateData(26);
    });
    _differentDataTimer5 = Timer(Duration(seconds: 39), () {
      updateData(23);
    });
    _differentDataTimer6 = Timer(Duration(seconds: 42), () {
      updateData(22);
    });
    _differentDataTimer7 = Timer(Duration(seconds: 43), () {
      updateData(20);
    });
    _differentDataTimer8 = Timer(Duration(seconds: 47), () {
      updateData(18);
    });
    _differentDataTimer9 = Timer(Duration(seconds: 50), () {
      updateData(17);
    });
    _differentDataTimer10 = Timer(Duration(seconds: 53), () {
      updateData(15);
    });
    _differentDataTimer11 = Timer(Duration(seconds: 59), () {
      updateData(14);
    });
    _differentDataTimer12 = Timer(Duration(seconds: 62), () {
      updateData(13);
    });
    _differentDataTimer13 = Timer(Duration(seconds: 64), () {
      updateData(12);
    });
  }

  @override
  void dispose() {
    _customDataTimer?.cancel();
    _differentDataTimer1?.cancel();
    _differentDataTimer2?.cancel();
    _differentDataTimer3?.cancel();
    _differentDataTimer4?.cancel();
    _differentDataTimer5?.cancel();
    _differentDataTimer6?.cancel();
    _differentDataTimer7?.cancel();
    _differentDataTimer8?.cancel();
    _differentDataTimer9?.cancel();
    _differentDataTimer10?.cancel();
    _differentDataTimer11?.cancel();
    _differentDataTimer12?.cancel();
    _differentDataTimer13?.cancel();
    super.dispose();
  }

  void updateData(int number) {
    setState(() {
      if (currentNumber > number) currentUpCount += (currentNumber - number);
      if (currentNumber < number) currentDownCount += (number - currentNumber);
      currentNumber = number;
      currentVisitor = currentDownCount + currentUpCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
                aspectRatio: 2 / 1,
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
                              Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/当前.png', // 替换为你的图标路径
                              width: 100, // 根据需要调整图标大小
                              height: 100,
                            ),
                            Text(
                              '当前人数：',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: defaultPadding), // 添加间距
                            AnimatedFlipCounter(
                              value: currentNumber,
                              duration:
                                  const Duration(milliseconds: 500), // 动画持续时间
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold), // 文本样式
                            ),
                          ],
                        )),
                  ),
                ))),
        SizedBox(height: defaultPadding),
        Container(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
                aspectRatio: 2 / 1,
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
                              Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/进入.png', // 替换为你的图标路径
                              width: 100, // 根据需要调整图标大小
                              height: 100,
                            ),
                            Text(
                              '进入人数：',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: defaultPadding), // 添加间距
                            AnimatedFlipCounter(
                              value: currentDownCount,
                              duration:
                                  const Duration(milliseconds: 500), // 动画持续时间
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold), // 文本样式
                            ),
                          ],
                        )),
                  ),
                ))),
        SizedBox(height: defaultPadding),
        Container(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
                aspectRatio: 2 / 1,
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
                              Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/出去.png', // 替换为你的图标路径
                              width: 100, // 根据需要调整图标大小
                              height: 100,
                            ),
                            Text(
                              '离开人数：',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: defaultPadding), // 添加间距
                            AnimatedFlipCounter(
                              value: currentUpCount,
                              duration:
                                  const Duration(milliseconds: 500), // 动画持续时间
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold), // 文本样式
                            ),
                          ],
                        )),
                  ),
                ))),
        SizedBox(height: defaultPadding),
        Container(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
                aspectRatio: 2 / 1,
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
                              Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/人流量.png', // 替换为你的图标路径
                              width: 100, // 根据需要调整图标大小
                              height: 100,
                            ),
                            Text(
                              '总人流量：',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: defaultPadding), // 添加间距
                            AnimatedFlipCounter(
                              value: currentVisitor,
                              duration:
                                  const Duration(milliseconds: 500), // 动画持续时间
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold), // 文本样式
                            ),
                          ],
                        )),
                  ),
                ))),
      ],
    );
  }
}
