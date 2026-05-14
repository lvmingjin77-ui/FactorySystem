// import 'package:admin/responsive.dart';
// import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/behavior_detect/main_video.dart';
// import 'package:admin/screens/behavior_detect/show_list_before.dart';
import 'package:admin/screens/behavior_detect/show_video_list.dart';
// import 'package:admin/screens/behavior_detect/show_video_list.dart';
import 'package:dart_vlc/dart_vlc.dart';
// import 'package:admin/screens/dashboard/main_image.dart';
// import 'package:admin/screens/dashboard/show_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

// import 'components/recent_files.dart';
// import 'components/storage_details.dart';

class BehaviorDetectScreen extends StatefulWidget {
  const BehaviorDetectScreen({super.key});

  @override
  State<BehaviorDetectScreen> createState() => _BehaviorDetectScreenState();
}

class _BehaviorDetectScreenState extends State<BehaviorDetectScreen> {
  final GlobalKey<ShowVideoState> showVideoKey = GlobalKey<ShowVideoState>();
  Future<void> initializeDartVLC() async {
    DartVLC.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: defaultPadding,
                      // ),
                      ShowVideo(
                        key: showVideoKey,
                      ),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        FutureBuilder(
                      future: initializeDartVLC(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ShowVideoList(
                            updatePlayerCallBack: (player) {
                              showVideoKey.currentState
                                  ?.updatePlayerDisplay(player);
                            },
                          );
                        } else {
                          // 在初始化完成之前显示加载指示器
                          return CircularProgressIndicator();
                        }
                      },
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
                    child: FutureBuilder(
                      future: initializeDartVLC(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ShowVideoList(
                            updatePlayerCallBack: (player) {
                              showVideoKey.currentState
                                  ?.updatePlayerDisplay(player);
                            },
                          );
                        } else {
                          // 在初始化完成之前显示加载指示器
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
