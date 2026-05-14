// import 'dart:convert';
// import 'dart:io';

// import 'package:admin/constants.dart';
// import 'package:admin/constants.dart';
// import 'dart:convert';
import 'dart:convert';
import 'dart:io';
// import 'dart:io';
// import 'dart:convert';
// import 'package:admin/screens/behavior_detect/main_video.dart';
import 'package:flutter/material.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:admin/constants.dart';
// import 'package:dart_vlc_ffi/dart_vlc_ffi.dart';
// import 'package:dart_vlc_ffi/dart_vlc_ffi.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';

class ShowVideoListBefore extends StatefulWidget {
  final Function(Player player) updatePlayerCallBack;

  const ShowVideoListBefore({Key? key, required this.updatePlayerCallBack})
      : super(key: key);

  @override
  State<ShowVideoListBefore> createState() => _ShowVideoListBeforeState();
}

class _ShowVideoListBeforeState extends State<ShowVideoListBefore> {
  final Directory directory = Directory(
      'assets\\videos');

  late List<VideoPlayerController> _controllers;

  late Future<List<File>> _videoFilesFuture;
  final List<Player> _players = [];
  Player testPlayer = Player(id: -1); // 可空类型，并初始化为 null

  @override
  void initState() {
    super.initState();
    _videoFilesFuture = _initializeVideoFiles();
  }

    Future<List<Player>> _initializeVideoPlayers() async {
    try {
      // ignore: close_sinks
      final socket = await WebSocket.connect('ws://localhost:8765');

      // Send request to backend
      socket.add(jsonEncode({'request': 'get_videos'}));

      // Listen for response
      socket.listen((dynamic data) {
        // ignore: unused_local_variable
        final responseData = jsonDecode(data);
        final List<Player> players = [];

        // Parse received data and populate players list
        // Example:
        // for (var item in responseData) {
        //   players.add(Player(id: item['id']));
        // }

        setState(() {
          _players.clear();
          _players.addAll(players);
        });
      });
    } catch (e) {
      print('Error: $e');
    }

    return _players;
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
    }
  }

  @override
  void dispose() {
    _controllers.forEach((controller) {
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
                '不规范行为列表', // 这里是你想要显示的文本，表明视频列表的字样
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
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                // 触发视频播放操作
                                testPlayer.open(Media.file(file),
                                    autoStart: true);
                                widget.updatePlayerCallBack(testPlayer);
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
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Video(player: player),
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
