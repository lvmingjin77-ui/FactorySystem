import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:web_socket_channel/io.dart';

class LineChartSocket extends StatefulWidget {
  final Function(double temperature, double humidity) updateTemperatureCallback;

  const LineChartSocket({Key? key, required this.updateTemperatureCallback})
      : super(key: key);

  @override
  _LineChartSocketState createState() => _LineChartSocketState();
}

class _LineChartSocketState extends State<LineChartSocket> {
  List<double> temperatureData = [0];
  List<double> humidityData = [0];
  int currentTime = 0;
  late Timer timer;
  late IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();

    // WebSocket连接
    channel =
        IOWebSocketChannel.connect('ws://localhost:8765'); // 替换为你的服务器地址和端口号

    // 定时获取温湿度数据
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      // 发送请求，获取温湿度数据
      channel.sink.add('getTemperatureHumidity');
    });

    // 监听WebSocket数据
    channel.stream.listen((data) {
      if (data != null) {
        final jsonData = json.decode(data);
        final temperature = jsonData['temperature'];
        final humidity = jsonData['humidity'];
        print(temperatureData);
        // print(humidityData);

        if (temperature != null && humidity != null) {
          // 调用回调函数更新温度值
          widget.updateTemperatureCallback(double.parse(temperature), double.parse(humidity));
          setState(() {
            temperatureData.add(double.parse(temperature));
            humidityData.add(double.parse(humidity));
            if (temperatureData.first == 0 || temperatureData.length == 21) {
              temperatureData.removeAt(0);
            }
            if (humidityData.first == 0 || humidityData.length == 21) {
              humidityData.removeAt(0);
            }
            currentTime++;
          });
        } else {
          print("Temperature/humidity data is null");
        }
      } else {
        print("Received null data from WebSocket");
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    channel.sink.close(); // 关闭WebSocket连接
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 找到temperatureData中的最小值和最大值
    double minTemperature =
        temperatureData.reduce((min, value) => value < min ? value : min);
    double maxTemperature =
        temperatureData.reduce((max, value) => value > max ? value : max);
    double minHumidity =
        humidityData.reduce((min, value) => value < min ? value : min);
    double maxHumidity =
        humidityData.reduce((max, value) => value > max ? value : max);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 42, 45, 62),
                    Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  // 标题部分
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Text(
                      '实时温度情况',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(enabled: true),
                        lineBarsData: [
                          LineChartBarData(
                            colors: [
                              Colors.deepOrangeAccent,
                              Colors.orangeAccent,
                            ],
                            spots: temperatureData.asMap().entries.map((entry) {
                              return FlSpot(
                                entry.key.toDouble(),
                                entry.value,
                              );
                            }).toList(),
                            isCurved: true,
                            isStrokeCapRound: true,
                            barWidth: 5,
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                            dotData: FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) =>
                                  FlDotCirclePainter(
                                radius: 7,
                                color: Colors.deepOrange.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 50, // 增加一些额外空间用于单位标题
                              getTitles: (value) {
                                // 设置左侧纵轴的范围
                                if (value.toInt() >= minTemperature &&
                                    value.toInt() <= maxTemperature) {
                                  return value.toString() + '℃';
                                } else {
                                  return '';
                                }
                              },
                              getTextStyles: (value) => const TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                              margin: 10,
                              interval: 0.5),
                          rightTitles: SideTitles(
                            showTitles: false,
                          ),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            // reservedSize: ,
                            margin: 10,
                            getTextStyles: (value) => const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            getTitles: (value) {
                              return (value.toInt() + 1).toString();
                            },
                          ),
                          topTitles: SideTitles(showTitles: false),
                        ),
                        gridData: FlGridData(
                          show: true,
                          horizontalInterval: 0.5,
                          drawVerticalLine: true,
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.transparent),
                            bottom: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded(
          flex: 5,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 42, 45, 62),
                    Color.fromARGB(255, 42, 45, 62).withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  // 标题部分
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Text(
                      '实时湿度情况',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(enabled: true),
                        lineBarsData: [
                          LineChartBarData(
                            colors: [
                              Colors.lightBlueAccent,
                              Colors.blue,
                            ],
                            spots: humidityData.asMap().entries.map((entry) {
                              return FlSpot(
                                entry.key.toDouble(),
                                entry.value,
                              );
                            }).toList(),
                            isCurved: true,
                            isStrokeCapRound: true,
                            barWidth: 5,
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                            dotData: FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) =>
                                  FlDotCirclePainter(
                                radius: 7,
                                color: Colors.blue.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 50, // 增加一些额外空间用于单位标题
                            getTitles: (value) {
                              // 设置左侧纵轴的范围
                              if (value.toInt() >= minHumidity &&
                                  value.toInt() <= maxHumidity) {
                                return value.toString() + '%';
                              } else {
                                return '';
                              }
                            },
                            getTextStyles: (value) => const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            margin: 10,
                          ),
                          rightTitles: SideTitles(
                            showTitles: false,
                          ),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            // reservedSize: ,
                            margin: 10,
                            getTextStyles: (value) => const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            getTitles: (value) {
                              return (value.toInt() + 1).toString();
                            },
                          ),
                          topTitles: SideTitles(showTitles: false),
                        ),
                        gridData: FlGridData(
                          show: true,
                          // horizontalInterval: 1,
                          drawVerticalLine: true,
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.transparent),
                            bottom: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
