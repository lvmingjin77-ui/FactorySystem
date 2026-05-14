import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/temper_humidity/components/header.dart';
// import 'package:admin/screens/temper_humidity/components/line_chart.dart';
// import 'package:admin/screens/temper_humidity/components/line_chart_1.dart';
// import 'package:admin/screens/temper_humidity/components/line_chart_2.dart';
// import 'package:admin/screens/temper_humidity/components/my_fields.dart';
// import 'package:admin/screens/temper_humidity/components/recent_files.dart';
// import 'package:admin/screens/temper_humidity/components/storage_details.dart';
import 'package:admin/screens/temper_humidity/show_TH.dart';
// import 'package:admin/screens/temper_humidity/socket.dart';
import 'package:admin/screens/temper_humidity/socket_demo.dart';
import 'package:flutter/material.dart';

class TemperHumidityScreen extends StatefulWidget {
  const TemperHumidityScreen({super.key});

  @override
  State<TemperHumidityScreen> createState() => _TemperHumidityScreenState();
}

class _TemperHumidityScreenState extends State<TemperHumidityScreen> {
  // 创建 GlobalKey 以引用 ShowTH 组件的状态
  final GlobalKey<ShowTHState> showTHKey = GlobalKey<ShowTHState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: defaultPadding * 2),
            Expanded(
              flex: 5,
              child: LineChartSocketDemo(
                updateTemperatureCallback: (temperature, humidity) {
                  showTHKey.currentState?.updateTemperatureDisplay(temperature, humidity);
                },
              ),
              // child: LineChartSocket(
              //   // 传递 updateTemperatureCallback 函数
              //   updateTemperatureCallback: (temperature, humidity) {
              //     // 调用 ShowTH 组件的方法来更新温度显示
              //     showTHKey.currentState?.updateTemperatureDisplay(temperature, humidity);
              //   },
              // ),
            ),
            SizedBox(height: defaultPadding),
            if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
            if (Responsive.isMobile(context))
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 42, 55, 82),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            SizedBox(height: defaultPadding),
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 2,
                child: ShowTH(
                  key: showTHKey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
