// import 'package:admin/constants.dart';
import 'package:admin/constants.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class ShowVideo extends StatefulWidget {
  const ShowVideo({super.key});

  @override
  State<ShowVideo> createState() => ShowVideoState();
}

class ShowVideoState extends State<ShowVideo> {
  Player? player; // 可空类型，并初始化为 null

  void updatePlayerDisplay(Player newPlayer) {
    setState(() {
      player = newPlayer;
    });
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
              if (player != null)
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
                child: Image.asset(
                  'assets/images/background_behavior.png',
                  fit: BoxFit.fill,
                ),
              ),
              // 文字提示
              if (player == null)
                Center(
                  child: Text(
                    '请在右侧列表中选择不规范视频',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
