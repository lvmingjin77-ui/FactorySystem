import 'package:admin/constants.dart';
// import 'package:admin/responsive.dart';
import 'package:admin/screens/check_in/components/header.dart';
// import 'package:admin/screens/check_in/info.dart';
import 'package:admin/screens/check_in/info_demo.dart';
// import 'package:admin/screens/check_in/info.dart';
// import 'package:admin/screens/check_in/components/recent_check_in.dart';
// import 'package:admin/screens/check_in/components/storage_details.dart';
// import 'package:admin/screens/check_in/info.dart';
// import 'package:admin/screens/check_in/info_demo.dart';
// import 'package:admin/screens/check_in/show_num.dart';
import 'package:admin/screens/check_in/show_num_demo.dart';
// import 'package:admin/screens/check_in/show_num.dart';
// import 'package:admin/screens/check_in/show_num.dart';
// import 'package:admin/screens/check_in/show_num_demo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Expanded(
              child: Column(children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            // MyFiles(),
                            // SizedBox(height: defaultPadding),
                            Expanded(
                              // child: ShowRowInfo(),
                              child: ShowRowInfoDemo(),
                            ),
                          ],
                        ),
                      ),
                      // if (!Responsive.isMobile(context))
                      //   SizedBox(width: defaultPadding),
                      // On Mobile means if the screen is less than 850 we don't want to show it
                      // if (!Responsive.isMobile(context))
                      SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        flex: 2,
                        child: ShowCheckInNumDemo(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        // Container(
                        //   alignment: Alignment.bottomCenter,
                        //   padding: EdgeInsets.only(bottom: defaultPadding),
                        //   child: ElevatedButton(
                        //     style: ButtonStyle(
                        //       minimumSize:
                        //           MaterialStateProperty.all(Size(200, 60)),
                        //       backgroundColor: MaterialStateColor.resolveWith(
                        //           (states) => secondaryColor),
                        //       textStyle: MaterialStateProperty.all(TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 25,
                        //       )),
                        //       elevation: MaterialStateProperty.all(10),
                        //       shadowColor: MaterialStateColor.resolveWith(
                        //           (states) => Colors.black),
                        //       overlayColor: MaterialStateProperty.all(
                        //           Color.fromARGB(255, 66, 85, 128)), //字体颜色
                        //     ),
                        //     child: Text("修改员工"),
                        //     onPressed: () async {
                        //       context.goNamed("modify_employee");
                        //     },
                        //   ),
                        // ),
                        // SizedBox(width: defaultPadding*4,),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: defaultPadding),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(200, 60)),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => secondaryColor),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              )),
                              elevation: MaterialStateProperty.all(10),
                              shadowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                              overlayColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 66, 85, 128)), //字体颜色
                            ),
                            child: Text("添加员工"),
                            onPressed: () async {
                              context.goNamed("add_employee");
                            },
                          ),
                        ),
                        SizedBox(width: defaultPadding*8,),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: defaultPadding),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(200, 60)),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => secondaryColor),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              )),
                              elevation: MaterialStateProperty.all(10),
                              shadowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                              overlayColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 66, 85, 128)), //字体颜色
                            ),
                            child: Text("修改考勤"),
                            onPressed: () async {
                              context.goNamed("modify_check_in");
                            },
                          ),
                        ),
                        // SizedBox(width: defaultPadding,),
                        // Container(
                        //   alignment: Alignment.bottomCenter,
                        //   padding: EdgeInsets.only(bottom: defaultPadding),
                        //   child: ElevatedButton(
                        //     style: ButtonStyle(
                        //       minimumSize:
                        //           MaterialStateProperty.all(Size(200, 60)),
                        //       backgroundColor: MaterialStateColor.resolveWith(
                        //           (states) => secondaryColor),
                        //       textStyle: MaterialStateProperty.all(TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 25,
                        //       )),
                        //       elevation: MaterialStateProperty.all(10),
                        //       shadowColor: MaterialStateColor.resolveWith(
                        //           (states) => Colors.black),
                        //       overlayColor: MaterialStateProperty.all(
                        //           Color.fromARGB(255, 66, 85, 128)), //字体颜色
                        //     ),
                        //     child: Text("查询考勤"),
                        //     onPressed: () async {
                        //       context.goNamed("add_employee");
                        //     },
                        //   ),
                        // )
                      ],
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
