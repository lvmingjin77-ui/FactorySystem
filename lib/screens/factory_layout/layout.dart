// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:io';

import 'package:admin/constants.dart';
import 'package:admin/screens/check_in/pie/indicator.dart';
import 'package:admin/screens/factory_layout/draggable_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Layout extends StatefulWidget {
  final Function() updateEmployeesCallBack;
  final Function() updataListCallBack;

  const Layout(
      {Key? key,
      required this.updateEmployeesCallBack,
      required this.updataListCallBack});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool isHovered5 = false;
  bool isHovered8 = false;
  int touchedIndex = -1;
  int _targetProduction = 1000; // 目标总产量
  int _currentProduction = 50; // 当前已完成产量
  late TextEditingController _productionController;
  TextEditingController cargoController = TextEditingController();
  double _currentTimeWeight = 0.5;
  double _currentProfitWeight = 0.5;
  bool isOvertime = false;
  late DateTime expectedCompletionDate = DateTime.now().add(
    Duration(days: ((_targetProduction - _currentProduction) / 50).toInt()),
  );

  void _updateExpectedCompletionDate() {
    setState(() {
      expectedCompletionDate =
          DateTime.now().add(Duration(days: 22)); // 更新为7天后的时间
    });
  }

  @override
  void initState() {
    super.initState();
    _productionController = TextEditingController();
  }

  @override
  void dispose() {
    _productionController.dispose();
    super.dispose();
  }

  void _increaseTargetProduction(int value) {
    setState(() {
      _targetProduction += value;
    });
  }

  void sendDataToBackend() async {
    try {
      // Establish connection with backend
      Socket socket = await Socket.connect('localhost', 12345);

      // Prepare data
      Map<String, dynamic> data = {
        'production': _productionController.text,
        'isOvertime': isOvertime ? 0 : 4,
        'timeWeight': _currentTimeWeight,
        'profitWeight': _currentProfitWeight,
      };

      // Convert data to JSON and send
      socket.write(jsonEncode(data));

      // Listen for response
      socket.listen((List<int> event) {
        String response = utf8.decode(event);
        print('Response from server: $response');
        // Close the socket
        socket.close();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void receiveDataFromBackend() async {
    try {
      // Establish connection with backend
      Socket socket = await Socket.connect('localhost', 12345);

      // Listen for response
      socket.listen((List<int> event) {
        String response = utf8.decode(event);
        print('Response from server: $response');

        // Handle received data
        // ignore: unused_local_variable
        Map<String, dynamic> responseData = jsonDecode(response);
        // Update UI with received data
        setState(() {
          // Update UI elements with received data
          // Example:
          // _someVariable = responseData['someKey'];
        });

        // Close the socket
        socket.close();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double progressPercentage = _currentProduction / _targetProduction;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered5 = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered5 = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 42, 55, 82),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: isHovered5 ? Colors.white : Colors.black,
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
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0), // 可以添加一些内边距以使文本与底色之间有间隔
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 168, 146), // 设置底色
                          borderRadius: BorderRadius.circular(10.0), // 可以添加圆角
                          boxShadow: [
                            BoxShadow(
                              color: bgColor.withOpacity(0.5), // 阴影颜色
                              spreadRadius: 5, // 阴影扩散范围
                              blurRadius: 7, // 阴影模糊度
                              offset: Offset(0, 3), // 阴影位置，x轴和y轴偏移量
                            ),
                          ],
                        ),
                        child: Text(
                          "生产调度完成情况",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 350,
                          width: 300,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: PieChart(
                                    PieChartData(
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      sectionsSpace: 5,
                                      centerSpaceRadius: 40,
                                      sections: showingSections1(),
                                      pieTouchData: PieTouchData(
                                          touchCallback: (pieTouchResponse) {
                                        setState(() {
                                          if (pieTouchResponse.touchInput
                                              is FlTouchData) {
                                            touchedIndex = -1;
                                          } else {
                                            touchedIndex = pieTouchResponse
                                                .touchedSection!
                                                .touchedSectionIndex;
                                          }
                                        });
                                      }),
                                    ),
                                    swapAnimationDuration:
                                        Duration(milliseconds: 150), // Optional
                                    swapAnimationCurve:
                                        Curves.linear, // Optional
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Indicator(
                                    color: Colors.blue,
                                    text: '已完成',
                                    isSquare: true,
                                  ),
                                  SizedBox(width: defaultPadding),
                                  Indicator(
                                    color: Color.fromARGB(255, 173, 112, 233),
                                    text: '未完成',
                                    isSquare: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: defaultPadding * 2,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // 将交叉轴对齐方式设置为靠左对齐
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/target.svg', // 替换成你的SVG图标路径
                                  width: 36, // 调整图标的宽度
                                  height: 36, // 调整图标的高度
                                  color: Colors.red, // 调整图标的颜色
                                ),
                                SizedBox(width: 8), // 添加一些间距
                                Text(
                                  '目标需求量: $_targetProduction',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: defaultPadding),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ok.svg', // 替换成你的SVG图标路径
                                  width: 36, // 调整图标的宽度
                                  height: 36, // 调整图标的高度
                                  color: Colors.green, // 调整图标的颜色
                                ),
                                SizedBox(width: 8), // 添加一些间距
                                Text(
                                  '已完成产量: $_currentProduction',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/date.svg', // 替换成你的SVG图标路径
                        width: 36, // 调整图标的宽度
                        height: 36, // 调整图标的高度
                        color: Colors.yellow, // 调整图标的颜色
                      ),
                      SizedBox(width: 8), // 添加一些间距
                      Text(
                        '预期完成时间: ${DateFormat('yyyy-MM-dd').format(expectedCompletionDate)}',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered8 = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered8 = false;
        });
      },child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 42, 55, 82),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                        BoxShadow(
                          color: isHovered8 ? Colors.white : Colors.black,
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
                child: Column(children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0), // 可以添加一些内边距以使文本与底色之间有间隔
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 168, 146), // 设置底色
                          borderRadius: BorderRadius.circular(10.0), // 可以添加圆角
                          boxShadow: [
                            BoxShadow(
                              color: bgColor.withOpacity(0.5), // 阴影颜色
                              spreadRadius: 5, // 阴影扩散范围
                              blurRadius: 7, // 阴影模糊度
                              offset: Offset(0, 3), // 阴影位置，x轴和y轴偏移量
                            ),
                          ],
                        ),

                        child: Text(
                          "调度安排",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "新增货物量: ",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: _productionController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: '请输入整数',
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {
                                  int value = int.tryParse(
                                          _productionController.text) ??
                                      0; // 将值解析为整数类型
                                  _increaseTargetProduction(value); // 传递整数值
                                  _productionController.clear();
                                },
                                child: Text('增加'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "是否加班: ",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 8.0),
                              Radio(
                                value: true,
                                groupValue: isOvertime,
                                onChanged: (value) {
                                  setState(() {
                                    isOvertime = (value as bool?)!;
                                  });
                                },
                              ),
                              Text("是"),
                              SizedBox(width: 8.0),
                              Radio(
                                value: false,
                                groupValue: isOvertime,
                                onChanged: (value) {
                                  setState(() {
                                    isOvertime = (value as bool?)!;
                                  });
                                },
                              ),
                              Text("否"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "时间/利润比重: ",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                          flex: 3,
                          child: DraggableLine(
                            onWeightChanged: (timeWeight, profitWeight) {
                              setState(() {
                                _currentTimeWeight = timeWeight;
                                _currentProfitWeight = profitWeight;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: defaultPadding),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 60)),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => secondaryColor),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                )),
                                elevation: MaterialStateProperty.all(10),
                                shadowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black),
                                overlayColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 66, 85, 128)), //字体颜色
                              ),
                              child: Text("生成最新调度安排"),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('是否要生成最新调度安排？'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: defaultPadding,
                                                right: defaultPadding),
                                            child: Divider(
                                              color: Colors.grey,
                                              thickness: 1.5,
                                              height: 20,
                                              indent: 0,
                                              endIndent: 0,
                                            ),
                                          ),
                                          Text(
                                            '    加班 : ${isOvertime ? "是" : "否"}',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            ' 时间权重 : ${_currentTimeWeight.toStringAsFixed(2)}',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            ' 利润权重 : ${_currentProfitWeight.toStringAsFixed(2)}',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('取消'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            widget.updateEmployeesCallBack();
                                            widget.updataListCallBack();
                                            _updateExpectedCompletionDate(); // 调用更新预期时间的函数
                                            // print(expectedCompletionDate);
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  '生成成功!',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor: Colors.black,
                                              ),
                                            );
                                          },
                                          child: Text('确认'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),),
            
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections1() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 80.0 : 70.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: _currentProduction.toDouble(),
            title:
                '${(_currentProduction / _targetProduction * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 173, 112, 233),
            value: _targetProduction.toDouble() - _currentProduction.toDouble(),
            title:
                '${((_targetProduction - _currentProduction) / _targetProduction * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
