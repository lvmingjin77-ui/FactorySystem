import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/count_num01/components/header.dart';
// import 'package:admin/screens/count_num01/count.dart';
import 'package:admin/screens/count_num01/count_demo.dart';
// import 'package:admin/screens/count_num/components/my_fields.dart';
// import 'package:admin/screens/count_num/components/recent_files.dart';
// import 'package:admin/screens/count_num/components/storage_details.dart';
// import 'package:admin/screens/count_num/count.dart';
// import 'package:admin/screens/count_num/count_demo.dart';
import 'package:admin/screens/count_num01/show_num.dart';
import 'package:admin/screens/count_num01/show_num_demo.dart';
import 'package:dart_vlc/dart_vlc.dart';
// import 'package:dart_vlc/dart_vlc.dart';
// import 'package:admin/screens/temper_humidity/show_TH.dart';
import 'package:flutter/material.dart';

class CountNumScreen01 extends StatefulWidget {
  const CountNumScreen01({super.key});

  @override
  State<CountNumScreen01> createState() => _CountNumScreen01State();
}

class _CountNumScreen01State extends State<CountNumScreen01> {
  final GlobalKey<ShowNumState> showNumKey = GlobalKey<ShowNumState>();
  Future<void> initializeDartVLC() async {
    DartVLC.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding*2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: defaultPadding,),
                      // Expanded(child:CountPeopleDemo(), ),
                      FutureBuilder(future: initializeDartVLC(), builder: (context, snapshot) {
                        return CountPeopleDemo();
                      }),
                      
                      // CountPeople(
                      //   updateDataCallback: (number, downCount, upCount) {
                      //     // 调用 ShowNum 组件的方法来更新人数显示
                      //     showNumKey.currentState
                      //         ?.updateData(number, downCount, upCount);
                      //   },
                      // ),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        ShowNum(
                          key: showNumKey,
                        ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    // child: ShowNum(
                    //   // key: showNumKey,
                    // ),
                    child: ShowNumDemo(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
