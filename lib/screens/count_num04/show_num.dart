import 'package:admin/constants.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class ShowNum extends StatefulWidget {
  const ShowNum({super.key});

  @override
  State<ShowNum> createState() => ShowNumState();
}

class ShowNumState extends State<ShowNum> {
  int currentNumber = 0;
  int currentDownCount = 0;
  int currentUpCount = 0;
  int currentVisitor = 0;
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  bool isHovered4 = false;
  void updateData(int number, int downCount, int upCount) {
    setState(() {
      if (currentNumber > number) currentUpCount += (currentNumber - number);
      if (currentNumber < number) currentDownCount += (number - currentNumber);
      currentNumber = number;
      currentVisitor = currentDownCount + currentUpCount;
      // currentDownCount = downCount;
      // currentUpCount = upCount;
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
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
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
                              // prefix: "有动画：", // 前缀
                            ),
                          ],
                        )

                        // ListTile(
                        //   // contentPadding:
                        //   //     EdgeInsets.only(right: defaultPadding), // 调整垂直间距
                        //   contentPadding: EdgeInsets.zero,
                        //   title: Text(
                        //     '当前人数:',
                        //     style: TextStyle(color: Colors.deepOrange, fontSize: 30),
                        //   ),
                        //   subtitle: AnimatedFlipCounter(
                        //     value: currentNumber,
                        //     duration: const Duration(milliseconds: 500), // 动画持续时间
                        //     textStyle: const TextStyle(
                        //         fontSize: 50, fontWeight: FontWeight.bold), // 文本样式
                        //     // prefix: "有动画：", // 前缀
                        //   ),
                        // ),
                        ),
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
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
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
                                  color:Colors.white,
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
                              // prefix: "有动画：", // 前缀
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
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
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
                              // prefix: "有动画：", // 前缀
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
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
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
