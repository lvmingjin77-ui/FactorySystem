import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowCard extends StatefulWidget {
  const ShowCard({super.key});

  @override
  State<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Container(child: LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth;
                // double containerHeight = constraints.maxHeight;
                return Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 38,
                          child: Container(
                            color: Colors.transparent, // 上半部分透明
                          ),
                        ),
                        Expanded(
                          flex: 62,
                          child: GestureDetector(
                            onTap: () {
                              // 页面跳转逻辑
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => NextPage()),
                              // );
                              context.goNamed("check_in");
                            },
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
                                      Color.fromARGB(255, 42, 45, 62)
                                          .withOpacity(0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: (containerWidth - 250) / 2, // 图片水平居中
                      bottom: 170, // 图片垂直居中
                      child: Image.asset(
                        'assets/image1.png', // 图片的本地路径
                        width: 250, // 图片显示的宽度
                      ),
                    ),
                  ],
                );
              },
            ))),
        SizedBox(width: defaultPadding),
        Expanded(
            flex: 1,
            child: Container(child: LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth;
                // double containerHeight = constraints.maxHeight;
                return Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 38,
                          child: Container(
                            color: Colors.transparent, // 上半部分透明
                          ),
                        ),
                        Expanded(
                          flex: 62,
                          child: GestureDetector(
                            onTap: () {
                              // 页面跳转逻辑
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => NextPage()),
                              // );
                              context.goNamed("check_in");
                            },
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
                                      Color.fromARGB(255, 42, 45, 62)
                                          .withOpacity(0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: (containerWidth - 250) / 2, // 图片水平居中
                      bottom: 170, // 图片垂直居中
                      child: Image.asset(
                        'assets/image2.png', // 图片的本地路径
                        width: 250, // 图片显示的宽度
                      ),
                    ),
                  ],
                );
              },
            ))),
        SizedBox(width: defaultPadding),
        Expanded(
            flex: 1,
            child: Container(child: LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth;
                // double containerHeight = constraints.maxHeight;
                return Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 38,
                          child: Container(
                            color: Colors.transparent, // 上半部分透明
                          ),
                        ),
                        Expanded(
                          flex: 62,
                          child: GestureDetector(
                            onTap: () {
                              // 页面跳转逻辑
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => NextPage()),
                              // );
                              context.goNamed("check_in");
                            },
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
                                      Color.fromARGB(255, 42, 45, 62)
                                          .withOpacity(0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: (containerWidth - 250) / 2, // 图片水平居中
                      bottom: 170, // 图片垂直居中
                      child: Image.asset(
                        'assets/image3.png', // 图片的本地路径
                        width: 250, // 图片显示的宽度
                      ),
                    ),
                  ],
                );
              },
            ))),
        SizedBox(width: defaultPadding),
        Expanded(
            flex: 1,
            child: Container(child: LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth;
                // double containerHeight = constraints.maxHeight;
                return Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 38,
                          child: Container(
                            color: Colors.transparent, // 上半部分透明
                          ),
                        ),
                        Expanded(
                          flex: 62,
                          child: GestureDetector(
                            onTap: () {
                              // 页面跳转逻辑
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => NextPage()),
                              // );
                              context.goNamed("check_in");
                            },
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
                                      Color.fromARGB(255, 42, 45, 62)
                                          .withOpacity(0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: (containerWidth - 250) / 2, // 图片水平居中
                      bottom: 170, // 图片垂直居中
                      child: Image.asset(
                        'assets/image4.png', // 图片的本地路径
                        width: 250, // 图片显示的宽度
                      ),
                    ),
                  ],
                );
              },
            ))),
      ],
    );
  }
}
