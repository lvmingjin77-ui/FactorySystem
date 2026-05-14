import 'dart:async';
// import 'dart:convert';
import 'dart:math';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:web_socket_channel/io.dart';

class LineChartSocketDemo extends StatefulWidget {
  final Function(double temperature, double humidity) updateTemperatureCallback;

  const LineChartSocketDemo({Key? key, required this.updateTemperatureCallback})
      : super(key: key);

  @override
  _LineChartSocketDemoState createState() => _LineChartSocketDemoState();
}

class _LineChartSocketDemoState extends State<LineChartSocketDemo> {
  List<double> temperatureData = [0];
  List<double> humidityData = [0];
  int currentTime = 0;
  late Timer timer;
  // late IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();

    // 初始化温湿度数据列表，初始值为10和30
    // temperatureData = List.filled(20, 10);
    // humidityData = List.filled(20, 30);

    // 每秒更新温湿度数据
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      // 生成随机的温度和湿度数据
      final double newTemperature =
          generateRandomChange(temperatureData.last, 2, 14.5, 30);
      final double newHumidity =
          generateRandomChange(humidityData.last, 3, 42.6, 80);
      widget.updateTemperatureCallback(newTemperature, newHumidity);

      setState(() {
        temperatureData.add(newTemperature);
        humidityData.add(newHumidity);
        if (temperatureData.length > 20 || temperatureData[0] == 0) {
          temperatureData.removeAt(0);
        }
        if (humidityData.length > 20 || humidityData[0] == 0) {
          humidityData.removeAt(0);
        }
        currentTime++;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // 生成在给定范围内随机变化的数值
  double generateRandomChange(
      double lastValue, double maxChange, double minValue, double maxValue) {
    final double randomChange =
        Random().nextDouble() * maxChange * (Random().nextBool() ? 1 : -1);
    double newValue = lastValue + randomChange;
    if (newValue < minValue) {
      newValue = minValue;
    } else if (newValue > maxValue) {
      newValue = maxValue;
    }
    return newValue;
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
                        lineTouchData: LineTouchData(
                          enabled: true,
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.deepOrange.withOpacity(0.8),
                            getTooltipItems:
                                (List<LineBarSpot> touchedBarSpots) {
                              return touchedBarSpots.map((barSpot) {
                                final flSpot = barSpot;
                                return LineTooltipItem(
                                  '${flSpot.y.toStringAsFixed(2)}℃', // 修改此处，以两位小数显示
                                  const TextStyle(color: Colors.white),
                                );
                              }).toList();
                            },
                          ),
                        ),
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
                                  return '${value.toStringAsFixed(2)}℃';
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
                        lineTouchData: LineTouchData(
                          enabled: true,
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.blue.withOpacity(0.8),
                            getTooltipItems:
                                (List<LineBarSpot> touchedBarSpots) {
                              return touchedBarSpots.map((barSpot) {
                                final flSpot = barSpot;
                                return LineTooltipItem(
                                  '${flSpot.y.toStringAsFixed(2)}%', // 修改此处，以两位小数显示
                                  const TextStyle(color: Colors.white),
                                );
                              }).toList();
                            },
                          ),
                        ),
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
                                return '${value.toStringAsFixed(2)}%';
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
