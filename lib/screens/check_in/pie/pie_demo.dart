import 'package:admin/screens/check_in/pie/legend_widget.dart';
// import 'package:admin/screens/check_in/pie/line1.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:admin/screens/check_in/pie/indicator.dart';
import 'package:admin/constants.dart';
// import 'package:socket_io_client/socket_io_client.dart' as io;
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

class PieChartDemo extends StatefulWidget {
  const PieChartDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartDemoState();
}

class PieChartDemoState extends State<PieChartDemo> {
  int touchedIndex = -1;
  int touchedIndex1 = -1;
  int signInCount = 83;
  int lateCount = 13;
  int allCount = 100;
  int signOutCount = 94;
  int leaveEarlyCount = 5;
  final pilateColor = Colors.blue;
  final cyclingColor = Colors.purple;
  final quickWorkoutColor = Colors.cyan;
  final betweenSpace = 0.2;
  // int allCount = 10;
  List<int> signInData = [87,89,98,92,91,85,83];
  List<int> lateData = [5,7,1,6,3,11,13];
  List<int> signOutData = [91,94,89,93,92,91,94];
  List<int> leaveEarlyData = [3,4,6,2,4,5,5];
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndexLine = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '上班情况统计', // 标题内容
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
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
                                  swapAnimationCurve: Curves.linear, // Optional
                                ),
                              ),
                            ),
                            // 标识文字部分
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Indicator(
                                  color: pilateColor,
                                  text: '签到',
                                  isSquare: true,
                                ),
                                SizedBox(height: 4),
                                Indicator(
                                  color: quickWorkoutColor,
                                  text: '迟到',
                                  isSquare: true,
                                ),
                                SizedBox(height: 4),
                                Indicator(
                                  color: cyclingColor,
                                  text: '未到',
                                  isSquare: true,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: defaultPadding * 2,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * 2),
                            decoration: BoxDecoration(
                              color: bgColor, // 背景色
                              borderRadius: BorderRadius.circular(20), // 圆角
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 16, 14, 14)
                                      .withOpacity(0.5), // 阴影颜色
                                  spreadRadius: 5, // 阴影扩散半径
                                  blurRadius: 7, // 阴影模糊半径
                                  offset: Offset(0, 3), // 阴影偏移量
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '过去七天',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                LegendsListWidget(
                                  legends: [
                                    Legend('签到', pilateColor),
                                    Legend('迟到', quickWorkoutColor),
                                    Legend('缺勤', cyclingColor),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: BarChart(
                                    BarChartData(
                                      alignment: BarChartAlignment.spaceBetween,
                                      titlesData: FlTitlesData(
                                        leftTitles:
                                            SideTitles(showTitles: false),
                                        rightTitles:
                                            SideTitles(showTitles: false),
                                        topTitles:
                                            SideTitles(showTitles: false),
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          getTextStyles: (value) =>
                                              const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          getTitles: (double value) {
                                            final today = DateTime.now();
                                            final date = today.subtract(
                                                Duration(
                                                    days: (6 - value.toInt())));
                                            return '${date.month}/${date.day}';
                                          },
                                          margin: 10,
                                        ),
                                      ),
                                      barTouchData: BarTouchData(
                                        enabled: true,
                                        touchTooltipData: BarTouchTooltipData(
                                          tooltipBgColor: Colors.blueGrey,
                                          getTooltipItem: (group, groupIndex,
                                              rod, rodIndex) {
                                            final String data = rod.y
                                                .toStringAsFixed(0); // 只显示整数位
                                            switch (rodIndex) {
                                              case 0:
                                                return BarTooltipItem(
                                                  '签到: $data',
                                                  TextStyle(
                                                      color: Colors.white),
                                                );
                                              case 1:
                                                return BarTooltipItem(
                                                  '迟到: $data',
                                                  TextStyle(
                                                      color: Colors.white),
                                                );
                                              case 2:
                                                return BarTooltipItem(
                                                  '缺勤: $data',
                                                  TextStyle(
                                                      color: Colors.white),
                                                );
                                              default:
                                                return BarTooltipItem(
                                                    '',
                                                    TextStyle(
                                                        color: Colors.white));
                                            }
                                          },
                                        ),
                                      ),
                                      borderData: FlBorderData(show: false),
                                      gridData: FlGridData(show: false),
                                      barGroups: List.generate(
                                        7,
                                        (index) => BarChartGroupData(
                                          x: index,
                                          barRods: [
                                            BarChartRodData(
                                              y: signInData[index].toDouble(),
                                              colors: [pilateColor],
                                              width: 5,
                                            ),
                                            BarChartRodData(
                                              y: lateData[index].toDouble(),
                                              colors: [quickWorkoutColor],
                                              width: 5,
                                            ),
                                            BarChartRodData(
                                              y: allCount.toDouble() -
                                                  (signInData[index] +
                                                      lateData[index]),
                                              colors: [cyclingColor],
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      maxY: allCount.toDouble() +
                                          (betweenSpace * 3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: defaultPadding,
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '下班情况统计', // 标题内容
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding * 2),
                      decoration: BoxDecoration(
                        color: bgColor, // 背景色
                        borderRadius: BorderRadius.circular(20), // 圆角
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 16, 14, 14)
                                .withOpacity(0.5), // 阴影颜色
                            spreadRadius: 5, // 阴影扩散半径
                            blurRadius: 7, // 阴影模糊半径
                            offset: Offset(0, 3), // 阴影偏移量
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '过去七天',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          LegendsListWidget(
                            legends: [
                              Legend('签退', pilateColor),
                              Legend('早退', quickWorkoutColor),
                              Legend('缺勤', cyclingColor),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceBetween,
                                titlesData: FlTitlesData(
                                  leftTitles: SideTitles(showTitles: false),
                                  rightTitles: SideTitles(showTitles: false),
                                  topTitles: SideTitles(showTitles: false),
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (value) => const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    getTitles: (double value) {
                                      final today = DateTime.now();
                                      final date = today.subtract(
                                          Duration(days: (6 - value.toInt())));
                                      return '${date.month}/${date.day}';
                                    },
                                    margin: 10,
                                  ),
                                ),
                                barTouchData: BarTouchData(
                                  enabled: true,
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.blueGrey,
                                    getTooltipItem:
                                        (group, groupIndex, rod, rodIndex) {
                                      final String data =
                                          rod.y.toStringAsFixed(0); // 只显示整数位
                                      switch (rodIndex) {
                                        case 0:
                                          return BarTooltipItem(
                                            '签到: $data',
                                            TextStyle(color: Colors.white),
                                          );
                                        case 1:
                                          return BarTooltipItem(
                                            '迟到: $data',
                                            TextStyle(color: Colors.white),
                                          );
                                        case 2:
                                          return BarTooltipItem(
                                            '缺勤: $data',
                                            TextStyle(color: Colors.white),
                                          );
                                        default:
                                          return BarTooltipItem('',
                                              TextStyle(color: Colors.white));
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                gridData: FlGridData(show: false),
                                barGroups: List.generate(
                                  7,
                                  (index) => BarChartGroupData(
                                    x: index,
                                    barRods: [
                                      BarChartRodData(
                                        y: signOutData[index].toDouble(),
                                        colors: [pilateColor],
                                        width: 5,
                                      ),
                                      BarChartRodData(
                                        y: lateData[index].toDouble(),
                                        colors: [quickWorkoutColor],
                                        width: 5,
                                      ),
                                      BarChartRodData(
                                        y: allCount.toDouble() -
                                            (signOutData[index] +
                                                leaveEarlyData[index]),
                                        colors: [cyclingColor],
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                maxY: allCount.toDouble() + (betweenSpace * 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                child: Column(children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     '下班情况统计', // 标题内容
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
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
                                  sections: showingSections2(),
                                  pieTouchData: PieTouchData(
                                      touchCallback: (pieTouchResponse) {
                                    setState(() {
                                      if (pieTouchResponse.touchInput
                                          is FlTouchData) {
                                        touchedIndex1 = -1;
                                      } else {
                                        touchedIndex1 = pieTouchResponse
                                            .touchedSection!
                                            .touchedSectionIndex;
                                      }
                                    });
                                  }),
                                ),

                                swapAnimationDuration:
                                    Duration(milliseconds: 150), // Optional
                                swapAnimationCurve: Curves.linear, // Optional
                              ),
                            ),
                          ),
                          // 标识文字部分
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Indicator(
                                color: pilateColor,
                                text: '签退',
                                isSquare: true,
                              ),
                              SizedBox(height: 4),
                              Indicator(
                                color: quickWorkoutColor,
                                text: '早退',
                                isSquare: true,
                              ),
                              SizedBox(height: 4),
                              Indicator(
                                color: cyclingColor,
                                text: '未退',
                                isSquare: true,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: defaultPadding * 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),

              // Expanded(
              //   flex: 1,
              //   child: Padding(padding: EdgeInsets.all(defaultPadding),
              //   child: Container(

              //     decoration: BoxDecoration(
              //                     color: bgColor, // 背景色
              //       borderRadius: BorderRadius.circular(20), // 圆角
              //       boxShadow: [
              //         BoxShadow(
              //           color: const Color.fromARGB(255, 16, 14, 14).withOpacity(0.5), // 阴影颜色
              //           spreadRadius: 5, // 阴影扩散半径
              //           blurRadius: 7, // 阴影模糊半径
              //           offset: Offset(0, 3), // 阴影偏移量
              //         ),
              //       ],
              //     ),
              //     child: BarChartSample6(),
              //   ),)

              // )
            ],
          ),
        )
      ],
    );
  }

  List<PieChartSectionData> showingSections1() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 90.0 : 80.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: pilateColor,
            value: signInCount.toDouble(),
            title: '${(signInCount / allCount * 100).toStringAsFixed(2)}%',
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
            color: quickWorkoutColor,
            value: lateCount.toDouble(),
            title: '${(lateCount / allCount * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: cyclingColor,
            value: allCount.toDouble() -
                signInCount.toDouble() -
                lateCount.toDouble(),
            title:
                '${((allCount - signInCount - lateCount) / allCount * 100).toStringAsFixed(2)}%',
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

  List<PieChartSectionData> showingSections2() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex1;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 90.0 : 80.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: pilateColor,
            value: signOutCount.toDouble(),
            title: '${(signOutCount / allCount * 100).toStringAsFixed(2)}%',
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
            color: quickWorkoutColor,
            value: leaveEarlyCount.toDouble(),
            title: '${(leaveEarlyCount / allCount * 100).toStringAsFixed(2)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: cyclingColor,
            value: allCount.toDouble() -
                signOutCount.toDouble() -
                leaveEarlyCount.toDouble(),
            title:
                '${((allCount - signOutCount - leaveEarlyCount) / allCount * 100).toStringAsFixed(2)}%',
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
