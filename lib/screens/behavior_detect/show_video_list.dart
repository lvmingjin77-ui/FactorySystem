
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:admin/constants.dart';
import 'package:video_player/video_player.dart';

class ShowVideoList extends StatefulWidget {
  final Function(Player player) updatePlayerCallBack;

  const ShowVideoList({Key? key, required this.updatePlayerCallBack})
      : super(key: key);

  @override
  State<ShowVideoList> createState() => _ShowVideoListState();
}

class _ShowVideoListState extends State<ShowVideoList> {
  final Directory directory = Directory('assets\\videos');

  List<VideoPlayerController>? _controllers;

  late Future<List<File>> _videoFilesFuture;
  final List<Player> _players = [];
  Player testPlayer = Player(id: -1); // 可空类型，并初始化为 null

  @override
  void initState() {
    super.initState();
    _videoFilesFuture = _initializeVideoFiles();
  }

  Future<List<File>> _initializeVideoFiles() async {
    List<FileSystemEntity> files = await _listVideos();
    List<File> videoFiles = files.whereType<File>().toList();
    _initializePlayers(videoFiles);
    return videoFiles;
  }

  Future<List<FileSystemEntity>> _listVideos() async {
    List<FileSystemEntity> videos = [];
    await for (var entity in directory.list()) {
      if (entity is File && entity.path.endsWith('.mp4')) {
        videos.add(entity);
      }
    }
    return videos;
  }

  void _initializePlayers(List<File> videoFiles) {
    for (int i = 0; i < videoFiles.length; i++) {
      _players.add(Player(id: i + 1));
      _players[i].open(Media.file(videoFiles[i]), autoStart: false);

      // 使用 Future.delayed 等待一小段时间后跳转并暂停
      Future.delayed(Duration(milliseconds: 500), () {
        _players[i].seek(Duration(seconds: 1));
        _players[i].pause();
      });
    }
  }

  @override
  void dispose() {
    _controllers?.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - defaultPadding * 7,
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
                Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '今日不规范行为列表', // 这里是你想要显示的文本，表明视频列表的字样
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: defaultPadding), // 添加一些间隔
              Expanded(
                child: FutureBuilder(
                  future: _videoFilesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<File> videoFiles = snapshot.data as List<File>;
                      return ListView.builder(
                        itemCount: videoFiles.length,
                        itemBuilder: (context, index) {
                          final file = videoFiles[index];
                          final player = _players[index];
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: defaultPadding),
                            child: GestureDetector(
                              onTap: () {
                                // 触发操作
                                testPlayer.open(Media.file(file),
                                    autoStart: true);
                                widget.updatePlayerCallBack(testPlayer);
                                player.play();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(234, 13, 14, 22),
                                      Color.fromARGB(234, 13, 14, 22),
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.all(defaultPadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IgnorePointer(
                                      ignoring: true,
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: Video(player: player),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      file.path
                                          .split(Platform.pathSeparator)
                                          .last
                                          .split('.')
                                          .first,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
