import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

/// 组件 1
Widget component1_2() {
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
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
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
                        text: '09:35 AM',
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
                              'assets/images/extinguisher05.jpg',
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
                      explainText('提示', '消防器材状态异常'),
                      Text(
                        '点击展开',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
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
Widget component2_2() {
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
              'assets/images/extinguisher05.jpg',
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
Widget component3_2() {
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

/// 组件 5
Widget component5_2() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Row(
      children: [
        Expanded(
            child: multipleLineText(
                '时间',
                '09:35 am',
                'Match 2, '
                    '2024')),
        Expanded(
          child: multipleLineText('地点', '消防通道A2', ''),
        ),
        Expanded(
          child: multipleLineText('情况', '消防器材状态异常', ''),
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
Widget component6_2(BuildContext context) {
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
              ),
              backgroundColor: Color.fromARGB(255, 27, 27, 64),
              elevation: 0,
            ),
            onPressed: () {
              context.goNamed("layout_show");
            },
            child: Container(
              height: 36,
              child: Center(
                child: Text(
                  '未处理',
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
