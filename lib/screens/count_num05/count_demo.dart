import 'dart:io';

import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dart_vlc/dart_vlc.dart';

class CountPeopleDemo extends StatefulWidget {
  const CountPeopleDemo({Key? key}) : super(key: key);

  @override
  _CountPeopleDemoState createState() => _CountPeopleDemoState();
}

class _CountPeopleDemoState extends State<CountPeopleDemo> {
  final player = Player(id: 1);

//...
  @override
  void initState() {
    super.initState();
    player.open(Media.file(File('assets/work01.mp4')), autoStart: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 3 / 2.5, // 设置容器的宽高比
        child: Container(
          child: Stack(
            children: [
              // 视频
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Video(
                    player: player,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 图片
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/icons/background.svg',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
