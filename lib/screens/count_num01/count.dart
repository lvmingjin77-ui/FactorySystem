// import 'dart:async';
import 'dart:convert';
// import 'dart:io';
// import 'dart:io';
// import 'dart:convert';
import 'dart:typed_data';
// import 'package:socket_io_client/socket_io_client.dart' as io;

// import 'package:admin/screens/count_num/show_num.dart';
// import 'package:admin/constants.dart';
import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:video_player/video_player.dart';
// import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CountPeople extends StatefulWidget {
  final Function(int number, int downCount, int upCount) updateDataCallback;

  const CountPeople({Key? key, required this.updateDataCallback})
      : super(key: key);

  @override
  State<CountPeople> createState() => _CountPeopleState();
}

class _CountPeopleState extends State<CountPeople> {
  late WebSocketChannel channel; // WebSocket通道
  Uint8List? imageBytes; // 存储图像数据的字节列表
  int number = 0;
  int downCount = 0;
  int upCount = 0;
  // late Socket socket;
  // late VideoPlayerController _controller;

  //   @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset('assets/videos/sample_video.mp4')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized
  //       setState(() {});
  //     });
  // }

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/videos/work01.mp4');
    // 建立WebSocket连接
    channel =
        IOWebSocketChannel.connect('ws://localhost:8766'); // 请替换为您的服务器 IP 和端口

    // 监听来自服务器的图像数据流
    channel.stream.listen((data) {
      // 解析 JSON 对象
      Map<String, dynamic> jsonData = jsonDecode(data);
      // widget.updateNumberAll(number, downCount, upCount);
      widget.updateDataCallback(
          jsonData['number'], jsonData['down_count'], jsonData['up_count']);
      // 当收到新的数据时，更新imageBytes变量，并调用setState触发界面的重新渲染
      setState(() {
        // imageBytes = base64Decode(data['image']);
        // imageBytes = base64Decode(data);
        // // 解析收到的数据，提取图像字节
        // Map<String, dynamic> jsonData = jsonDecode(data);
        // imageBytes = base64Decode(jsonData['image']);
        imageBytes = base64Decode(jsonData['frame']);
        // number = jsonData['number'];
        // downCount = jsonData['down_count'];
        // upCount = jsonData['up_count'];
      });
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   // 连接到服务器
  //   socket = io.io('http://127.0.0.1:5000', <String, dynamic>{
  //     'transports': ['websocket'],
  //     'autoConnect': false,
  //   }) as Socket;
  //   // 监听服务器发送的图像数据
  //   socket.on('video_frame', (data) {
  //     setState(() {
  //       // 解析收到的数据，提取图像字节
  //       Map<String, dynamic> jsonData = jsonDecode(data);
  //       imageBytes = base64Decode(jsonData['image']);
  //     });
  //   });
  //   // 连接到服务器
  //   socket.connect();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 3 / 2.5, // 设置容器的宽高比
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    '  ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 143, 143, 1),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: defaultPadding * 3,
                        left: defaultPadding * 3,
                        top: defaultPadding * 2,
                        bottom: defaultPadding * 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                      imageBytes != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10), // 设置圆角半径
                              child: Image.memory(
                                imageBytes!,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/icons/background.svg',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

// imageBytes != null
//         ? Container(
//             width: MediaQuery.of(context).size.width,
//             child: AspectRatio(
//               aspectRatio: 3 / 2, // 设置容器的宽高比
//               child: Image.memory(
//                 imageBytes!,
//                 fit: BoxFit.fill, // 图像宽度填满容器
//               ),
//             ),
//           )
//         : CircularProgressIndicator();

// Container(
//       width: MediaQuery.of(context).size.width,
//       child: AspectRatio(
//         aspectRatio: 3 / 2.5, // 设置容器的宽高比
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 42, 55, 82),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black,
//                 blurRadius: 10,
//                 spreadRadius: 0,
//               )
//             ],
//           ),
//           child: Container(
//               padding: EdgeInsets.all(defaultPadding),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 42, 45, 62),
//                     Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
//                   ],
//                   begin: Alignment.topCenter,
//                   // end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     'xxxxxxxxxx',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Color.fromRGBO(143, 143, 143, 1),
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: defaultPadding,
//                   ),
//                   Expanded(
//                       child: Container(
//                     child: imageBytes != null
//                         ? Image.memory(
//                             imageBytes!,
//                             fit: BoxFit.fill, // 图像宽度填满容器
//                           )
//                         : CircularProgressIndicator(),
//                   ))
//                 ],
//               )),
//         ),

  @override
  void dispose() {
    // 关闭WebSocket连接，释放资源
    channel.sink.close();
    // socket.disconnect();
    super.dispose();
  }
}
