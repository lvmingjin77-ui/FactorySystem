import 'package:admin/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ShowBarChart extends StatefulWidget {
  const ShowBarChart({super.key});

  @override
  State<ShowBarChart> createState() => ShowBarChartState();
}

class ShowBarChartState extends State<ShowBarChart> {
  bool isHovered7 = false;
  final pilateColor = Colors.purple;
  final cyclingColor = Colors.cyan;
  final quickWorkoutColor = Colors.blue;
  List<int> numbers = [25, 17, 22, 21, 15];

    // 添加一个函数用于更新员工信息
  void updateListDisplay() {
    setState(() {
      numbers = [16,24,18,31,11];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovered7 = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovered7 = false;
                    });
                  },
                  child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 42, 55, 82),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
                        BoxShadow(
                          color: isHovered7 ? Colors.white : Colors.black,
                          blurRadius: 10,
                          spreadRadius: 0,
                        )
                      ],
      ),
      child: Container(
        // padding: EdgeInsets.all(defaultPadding*3),
padding: EdgeInsets.only(left: defaultPadding*5, right: defaultPadding*5,top: defaultPadding*3,bottom: defaultPadding*3),
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '车间调度人数',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cyclingColor,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          "车间人数",
          style: const TextStyle(
            color: Color(0xff757391),
            fontSize: 20,
          ),
        ),
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
                      return '车间${value.toInt()+1}';
                    },
                    margin: 10,
                  ),
                ),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.blueGrey,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final String data = rod.y.toStringAsFixed(0); // 只显示整数位
                      return BarTooltipItem("人数：$data",TextStyle(color: Colors.white,fontSize: 20) );
                    },
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barGroups: List.generate(
                  numbers.length,
                  (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        y: numbers[index].toDouble(),
                        colors: [cyclingColor],
                        width: 15,
                        
                      ),
                    ],
                  ),
                ),
                maxY: numbers.reduce((value, element) => value > element ? value : element).toDouble() + 5,
              ),
            ),
          ),
        ],
      ),
      ),
    ),);
    
  }
}
