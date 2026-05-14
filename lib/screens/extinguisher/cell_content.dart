// import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:admin/screens/extinguisher/color_hex.dart';

class LeftHalfContainer extends StatelessWidget {
  final Widget child;

  LeftHalfContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}

class RightHalfContainer extends StatelessWidget {
  final Widget child;

  RightHalfContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}

class CellContentPage extends StatelessWidget {
  const CellContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(44),
            //width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    componentTitle('组件 1'),
                    component1(),
                    componentTitle('组件 2'),
                    component2(),
                    componentTitle('组件 3'),
                    component3(),
                    componentTitle('组件 4'),
                    //component4(),
                    componentTitle('组件 5'),
                    component5(),
                    componentTitle('组件 6'),
                    component6(),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    componentTitle('组件 1'),
                    component1(),
                    componentTitle('组件 2'),
                    component2(),
                    componentTitle('组件 3'),
                    component3(),
                    componentTitle('组件 4'),
                    //component4(),
                    componentTitle('组件 5'),
                    component5(),
                    componentTitle('组件 6'),
                    component6(),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  /// 组件标题
  Widget componentTitle(String title) {
    return Container(
      height: 34,
      padding: EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.bottomLeft,
      child: Text(title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          )),
    );
  }
}

/// 这里为了方便，暂时设为全局方法，小伙伴可自己进行封装

// /// 组件 1
// Widget component1() {
//   double height = 300.0;
//   return ClipRRect(
//     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//     child: Container(
//       height: height,
//       child: Row(
//         children: [
//           Container(
//             width: 88,
//             color: HexColor.fromHex('5D4A99'),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   '\$25',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text.rich(
//                   TextSpan(
//                     style: TextStyle(),
//                     children: [
//                       TextSpan(
//                         text: '今日\n',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 10,
//                         ),
//                       ),
//                       TextSpan(
//                         text: '06:30 PM',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               height: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // SizedBox(
//                       //   width: 5,
//                       // ),
//                       SizedBox(width: defaultPadding), // 添加间距
//                       Image.asset(
//                         'assets/images/dots.png',
//                         width: 50,
//                         height: 150,
//                       ),
//                       // SizedBox(
//                       //   width: defaultPadding
//                       // ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'W 90th St, New York, 10024',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
//                               width: double.infinity,
//                               height: 0.5,
//                               //height: 200,
//                               color: Colors.grey[200],
//                             ),
//                             Text(
//                               '46th Ave, Woodside, 10011',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       explainText('REQUEST', '6'),
//                       explainText('PLEDGE', '\$150'),
//                       explainText('WEIGHT', 'light'),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

/// 组件 1
Widget component1() {
  double height = 300.0;
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    child: Container(
      height: height,
      child: Row(
        children: [
          Container(
            width: 100,
            //color: HexColor.fromHex('5D4A99'),
            //color:Color.fromARGB(255, 37, 74, 185),
            //color:Color.fromARGB(77, 139, 172, 209),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 27, 27, 64),
                  Color.fromARGB(255, 42, 55, 82),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  // '\$25',
                  '危险',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(),
                    children: [
                      TextSpan(
                        text: '今日\n',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      TextSpan(
                        text: '06:30 PM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Color.fromARGB(255, 42, 55, 82),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    // children: [
                    //   // SizedBox(
                    //   //   width: 10,
                    //   // ),
                    //   Transform.scale(
                    //     scale: 1, // 放大倍数，根据需要调整
                    //     child: Image.asset(
                    //       'assets/images/dots.png',
                    //       width: 300,
                    //       height: 100,
                    //       //fit: BoxFit.contain,
                    //     ),
                    //   ),
                    //   // SizedBox(
                    //   //   width: 6,
                    //   // ),
                    //   // Image.asset(
                    //   //   'assets/images/dots.png',
                    //   //   width: 480,
                    //   //   height: 160,
                    //   // ),
                    // ],
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center, // 设置图片在父组件中的位置为中心
                          child: Transform.scale(
                            scale: 1, // 放大倍数，根据需要调整
                            child: Image.asset(
                              'assets/images/dots.png',
                              //
                              width: 480,
                              height: 160,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // explainText('REQUEST', '6'),
                      // explainText('PLEDGE', '\$150'),
                      // explainText('WEIGHT', 'light'),
                      explainText('警告', '消防通道有障碍物'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

/// 组件 2
Widget component2() {
  return Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 44,
          // color: HexColor.fromHex('5D4A99'),
          //color: Color.fromARGB(255, 18, 37, 93),
          color: Color.fromARGB(255, 27, 27, 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
              Text(
                '详情',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                // '\$25',
                '危险',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Image.asset(
              'assets/images/dots.png',
              width: double.infinity,
              height: 256,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              bottom: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // children: [
                //   Container(
                //     child: explainText('警告', '消防通道有障碍物'),
                //   )
                //   // explainText('REQUEST', '6', subtitleColor: Colors.white),
                //   // explainText('PLEDGE', '\$150', subtitleColor: Colors.white),
                //   // explainText('WEIGHT', 'light', subtitleColor: Colors.white),
                // ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

/// 组件 3
Widget component3() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 6),
          child: Text(
            'SENDER',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // child: Image.asset(
              //   'assets/images/avatar.png',
              //   width: 48,
              //   height: 48,
              // ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edward Norton',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 14,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0),
                      itemBuilder: (ctx, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '(26)',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            )
          ],
        ),
        Divider(
          color: Colors.grey[300],
        ),
      ],
    ),
  );
}

// /// 组件 4
// Widget component4() {
//   return Container(
//     color: Colors.white,
//     padding: EdgeInsets.all(10),
//     child: Row(
//       children: [
//         Expanded(
//           child: multipleLineText(
//               'FROM',
//               'W 90th St',
//               'New York, NY '
//                   '10025'),
//         ),
//         Expanded(
//           child: multipleLineText('TO', '46th Ave', 'Woodside, NY 11101'),
//         ),
//         Icon(
//           Icons.arrow_forward_ios,
//           size: 16,
//           color: Colors.grey,
//         )
//       ],
//     ),
//   );
// }

/// 组件 5
Widget component5() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Row(
      children: [
        Expanded(
            child: multipleLineText(
                '时间',
                '06:30 pm',
                'May 16, '
                    '2024')),
        Expanded(
          child: multipleLineText('地点', '消防通道A0', ''),
        ),
        Expanded(
          child: multipleLineText('危险', '消防通道有障碍物', ''),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        )
      ],
    ),
  );
}

/// 组件 6
Widget component6() {
  return ClipRRect(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ), backgroundColor: Color.fromARGB(255, 27, 27, 64),
              elevation: 0,
            ),
            onPressed: () {},
            child: Container(
              height: 36,
              child: Center(
                child: Text(
                  '已处理',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text('该条警告将不再显示',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    ),
  );
}

/// 三行文字
Widget multipleLineText(String line1, String line2, String line3) {
  return Text.rich(
    TextSpan(
      style: TextStyle(
        height: 1.4,
      ),
      children: [
        TextSpan(
          text: '$line1\n',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        TextSpan(
          text: '$line2\n',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        TextSpan(
          text: line3,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

///
Widget explainText(String title, String subtitle,
    {Color? titleColor, Color? subtitleColor}) {
  return Text.rich(
    TextSpan(
        style: TextStyle(
          height: 1.4,
        ),
        children: [
          TextSpan(
              text: '$title\n',
              style: TextStyle(
                color: titleColor ?? Colors.yellow,
                fontSize: 13,
              )),
          TextSpan(
            text: subtitle,
            style: TextStyle(
              color: subtitleColor ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ]),
  );
}
