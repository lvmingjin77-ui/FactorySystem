// import 'package:admin/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:admin/screens/extinguisher/folding_cell.dart';
// import 'package:admin/screens/extinguisher/folding_cell2.dart';

// class FoldingCellListPage extends StatefulWidget {
//   const FoldingCellListPage({Key? key}) : super(key: key);

//   @override
//   _FoldingCellListPageState createState() => _FoldingCellListPageState();
// }

// class _FoldingCellListPageState extends State<FoldingCellListPage> {
//   /// 记录哪些索引是打开了的
//   /// 这里用 Set 是因为我们并不关心它们打开的顺序
//   late Set<int> openedIndices = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       body: Stack(
//         children: [
//           // Image.asset(
//           //   // 'assets/images/background.png',
//           //   width: MediaQuery.of(context).size.width,
//           //   fit: BoxFit.cover,
//           // ),
//           Row(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, int index) {
//                     return FoldingCell(
//                       key: ValueKey(index),
//                       foldingState: openedIndices.contains(index)
//                           ? FoldingState.open
//                           : FoldingState.close,
//                       onChanged: (foldState) {
//                         if (foldState == FoldingState.open) {
//                           print('打开了 cell -- $index');
//                           openedIndices.add(index);
//                         } else {
//                           print('关闭了 cell -- $index');
//                           openedIndices.remove(index);
//                         }
//                       },
//                     );
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 10, // 这里放入第二个列表的数量
//                   itemBuilder: (BuildContext context, int index) {
//                     // 同样的逻辑构建第二个列表的cell
//                     return FoldingCell2(
//                       key: ValueKey(index),
//                       foldingState: openedIndices.contains(index)
//                           ? FoldingState2.open
//                           : FoldingState2.close,
//                       onChanged: (foldState) {
//                         if (foldState == FoldingState.open) {
//                           print('打开了 cell -- $index');
//                           openedIndices.add(index);
//                         } else {
//                           print('关闭了 cell -- $index');
//                           openedIndices.remove(index);
//                         }
//                       },
//                     );
//                   },
//                 ),
//               ),
//               Positioned(
//                 top: 20, // 调整标题的位置
//                 right: 20,
//                 child: Text(
//                   'Title 2',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 20, // 调整标题的位置
//                 right: 20,
//                 child: Text(
//                   'Title 2',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'dart:typed_data';

import 'package:admin/constants.dart';
import 'package:admin/screens/extinguisher/part01/folding_cell_01.dart';
import 'package:admin/screens/extinguisher/part01/folding_cell_02.dart';
import 'package:admin/screens/extinguisher/part01/folding_cell_03.dart';
import 'package:admin/screens/extinguisher/part01/folding_cell_04.dart';
import 'package:admin/screens/extinguisher/part02/folding_cell2_01.dart';
import 'package:admin/screens/extinguisher/part02/folding_cell2_02.dart';
import 'package:admin/screens/extinguisher/part02/folding_cell2_03.dart';
import 'package:admin/screens/extinguisher/part02/folding_cell2_04.dart';
import 'package:flutter/material.dart';
// import 'package:admin/screens/extinguisher/folding_cell.dart';
// import 'package:admin/screens/extinguisher/folding_cell2.dart';

class FoldingCellListPage extends StatefulWidget {
  const FoldingCellListPage({Key? key}) : super(key: key);

  @override
  _FoldingCellListPageState createState() => _FoldingCellListPageState();
}

class _FoldingCellListPageState extends State<FoldingCellListPage> {
  late Set<int> openedIndices = {};
  //   WebSocket? _socket;
  // List<Uint8List> _images = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _connectToWebSocket();
  // }

  // Future<void> _connectToWebSocket() async {
  //   try {
  //     _socket = await WebSocket.connect('ws://localhost:8765');
  //     _socket!.listen((dynamic data) {
  //       Uint8List bytes = data;
  //       setState(() {
  //         _images.add(bytes);
  //       });
  //     });
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  //   @override
  // void dispose() {
  //   _socket?.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '消防器材隐患巡检情况>',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '消防风险预警巡检情况>',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //  Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20), // 调整标题之间的分割线的左右边距
          //   child: Divider( // 添加标题之间的分割线
          //     color: Colors.white,
          //     thickness: 2.0,
          //     height: 0,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // 添加标题下方的分割线的左右边距
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10), // 设置标题1下方分割线的右边距
                    child: Divider(
                      // 添加标题1下方的分割线
                      color: Colors.white,
                      thickness: 1.0,
                      height: 0,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10), // 设置标题2下方分割线的左边距
                    child: Divider(
                      // 添加标题2下方的分割线
                      color: Colors.white,
                      thickness: 1.0,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          FoldingCell01(
                            key: ValueKey(0),
                            foldingState: openedIndices.contains(0)
                                ? FoldingState.open
                                : FoldingState.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 0');
                                openedIndices.add(0);
                              } else {
                                print('关闭了 cell -- 0');
                                openedIndices.remove(0);
                              }
                            },
                          ),
                          FoldingCell02(
                            key: ValueKey(1),
                            foldingState: openedIndices.contains(1)
                                ? FoldingState.open
                                : FoldingState.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 1');
                                openedIndices.add(1);
                              } else {
                                print('关闭了 cell -- 1');
                                openedIndices.remove(1);
                              }
                            },
                          ),
                          FoldingCell03(
                            key: ValueKey(2),
                            foldingState: openedIndices.contains(2)
                                ? FoldingState.open
                                : FoldingState.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 2');
                                openedIndices.add(2);
                              } else {
                                print('关闭了 cell -- 2');
                                openedIndices.remove(2);
                              }
                            },
                          ),
                          FoldingCell04(
                            key: ValueKey(3),
                            foldingState: openedIndices.contains(3)
                                ? FoldingState.open
                                : FoldingState.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 3');
                                openedIndices.add(3);
                              } else {
                                print('关闭了 cell -- 3');
                                openedIndices.remove(3);
                              }
                            },
                          ),
                          // FoldingCell01(
                          //   key: ValueKey(4),
                          //   foldingState: openedIndices.contains(4)
                          //       ? FoldingState.open
                          //       : FoldingState.close,
                          //   onChanged: (foldState) {
                          //     if (foldState == FoldingState.open) {
                          //       print('打开了 cell -- 4');
                          //       openedIndices.add(4);
                          //     } else {
                          //       print('关闭了 cell -- 4');
                          //       openedIndices.remove(4);
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                    )
                        // ListView.builder(
                        //   itemCount: 10,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return FoldingCell(
                        //       key: ValueKey(index),
                        //       foldingState: openedIndices.contains(index)
                        //           ? FoldingState.open
                        //           : FoldingState.close,
                        //       onChanged: (foldState) {
                        //         if (foldState == FoldingState.open) {
                        //           print('打开了 cell -- $index');
                        //           openedIndices.add(index);
                        //         } else {
                        //           print('关闭了 cell -- $index');
                        //           openedIndices.remove(index);
                        //         }
                        //       },
                        //     );
                        //   },
                        // ),
                        ),
                    // Container(
                    //   width: 1, // 设置分割线的宽度
                    //   color: Colors.white, // 设置分割线的颜色
                    // ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          FoldingCell201(
                            key: ValueKey(0),
                            foldingState: openedIndices.contains(0)
                                ? FoldingState2.open
                                : FoldingState2.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 0');
                                openedIndices.add(0);
                              } else {
                                print('关闭了 cell -- 0');
                                openedIndices.remove(0);
                              }
                            },
                          ),
                          FoldingCell204(
                            key: ValueKey(3),
                            foldingState: openedIndices.contains(3)
                                ? FoldingState2.open
                                : FoldingState2.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 3');
                                openedIndices.add(3);
                              } else {
                                print('关闭了 cell -- 3');
                                openedIndices.remove(3);
                              }
                            },
                          ),
                          FoldingCell203(
                            key: ValueKey(2),
                            foldingState: openedIndices.contains(2)
                                ? FoldingState2.open
                                : FoldingState2.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 2');
                                openedIndices.add(2);
                              } else {
                                print('关闭了 cell -- 2');
                                openedIndices.remove(2);
                              }
                            },
                          ),
                          FoldingCell202(
                            key: ValueKey(1),
                            foldingState: openedIndices.contains(1)
                                ? FoldingState2.open
                                : FoldingState2.close,
                            onChanged: (foldState) {
                              if (foldState == FoldingState.open) {
                                print('打开了 cell -- 1');
                                openedIndices.add(1);
                              } else {
                                print('关闭了 cell -- 1');
                                openedIndices.remove(1);
                              }
                            },
                          ),
                          // FoldingCell201(
                          //   key: ValueKey(4),
                          //   foldingState: openedIndices.contains(4)
                          //       ? FoldingState2.open
                          //       : FoldingState2.close,
                          //   onChanged: (foldState) {
                          //     if (foldState == FoldingState.open) {
                          //       print('打开了 cell -- 4');
                          //       openedIndices.add(4);
                          //     } else {
                          //       print('关闭了 cell -- 4');
                          //       openedIndices.remove(4);
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                    )
                        // ListView.builder(
                        //   itemCount: 10,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return FoldingCell2(
                        //       key: ValueKey(index),
                        //       foldingState: openedIndices.contains(index)
                        //           ? FoldingState2.open
                        //           : FoldingState2.close,
                        //       onChanged: (foldState) {
                        //         if (foldState == FoldingState.open) {
                        //           print('打开了 cell -- $index');
                        //           openedIndices.add(index);
                        //         } else {
                        //           print('关闭了 cell -- $index');
                        //           openedIndices.remove(index);
                        //         }
                        //       },
                        //     );
                        //   },
                        // ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
