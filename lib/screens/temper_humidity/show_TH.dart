import 'package:flutter/material.dart';
// import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ShowTH extends StatefulWidget {
  const ShowTH({super.key});

  @override
  State<ShowTH> createState() => ShowTHState();
}

class ShowTHState extends State<ShowTH> {
  double maxTemperature = 0; // 用于存储最高温度值
  double minTemperature = 100; // 用于存储最低温度值
  double currentTemperature = 0; // 用于存储当前温度值
  String temperatureStatus = '正常'; // 默认状态为正常
  Color statusColor_T = Colors.green; // 默认颜色为绿色
  double maxHumidity = 0; // 用于存储最高温度值
  double minHumidity = 100; // 用于存储最低温度值
  double currentHumidity = 0; // 用于存储当前温度值
  String humidityStatus= '正常'; // 默认状态为正常
  Color statusColor_H = Colors.green; // 默认颜色为绿色

  // 函数，用于更新温度显示
  void updateTemperatureDisplay(double newTemperature, double newHumidity) {
    setState(() {
      // 更新当前温度
      currentTemperature = newTemperature;
      currentTemperature = currentTemperature > 100 ? 100 : currentTemperature;
      currentTemperature = currentTemperature < 0 ? 0 : currentTemperature;

      if (currentTemperature > 0 && currentTemperature < 10) {
        temperatureStatus = '偏低';
        statusColor_T = Colors.orange;
      } else if (currentTemperature > 30 && currentTemperature < 45) {
        temperatureStatus = '偏高';
        statusColor_T = Colors.orange;
      } else if (currentTemperature == 0 || currentTemperature >= 45) {
        temperatureStatus = '异常';
        statusColor_T = Colors.red;
      }else{
        temperatureStatus = '正常';
        statusColor_T = Colors.green;
      }

      // 更新最高温度
      if (newTemperature > maxTemperature || maxTemperature == 0.0) {
        maxTemperature = newTemperature;
      }
      maxTemperature = maxTemperature > 100 ? 100 : maxTemperature;

      // 更新最低温度
      if (newTemperature < minTemperature || minTemperature == 0.0) {
        minTemperature = newTemperature;
      }
      minTemperature = minTemperature < 0 ? 0 : minTemperature;

      // 更新当前湿度
      currentHumidity = newHumidity;
      currentHumidity = currentHumidity > 100 ? 100 : currentHumidity;
      currentHumidity = currentHumidity < 0 ? 0 : currentHumidity;

      if (currentHumidity >= 20 && currentHumidity < 30) {
        humidityStatus = '偏低';
        statusColor_H = Colors.orange;
      } else if (currentHumidity > 60 && currentHumidity <= 70) {
        humidityStatus = '偏高';
        statusColor_H = Colors.orange;
      } else if (currentHumidity < 20 || currentHumidity > 70) {
        humidityStatus = '异常';
        statusColor_H = Colors.red;
      }else{
        humidityStatus = '正常';
        statusColor_H = Colors.green;
      }

      // 更新最高温度
      if (newHumidity > maxHumidity || maxHumidity == 0.0) {
        maxHumidity = newHumidity;
      }
      maxHumidity = maxHumidity > 100 ? 100 : maxHumidity;

      // 更新最低温度
      if (newHumidity < minHumidity || minHumidity == 0.0) {
        minHumidity = newHumidity;
      }
      minHumidity = minHumidity < 0 ? 0 : minHumidity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Container(//左半个
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
            child: Container(//左半个
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
              child: Row(
                children: [
                  // 第一部分
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black, width: 1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(
                                right: 30, bottom: 10), // 调整垂直间距
                            title: Text(
                              '今日最高温度:',
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                            subtitle: Text(
                              '     ' +
                                  '${maxTemperature.toStringAsFixed(1)}°C', // 替换为你的数据
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          ListTile(
                            contentPadding:
                                EdgeInsets.only(right: 30), // 调整垂直间距
                            title: Text(
                              '今日最低温度:',
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 20),
                            ),
                            subtitle: Text(
                              '     ' +
                                  '${minTemperature.toStringAsFixed(1)}°C', // 替换为你的数据
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 第二部分
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black, width: 1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 30), // 调整title和subtitle之间的垂直间距
                              child: Text(
                                '当前温度状况：',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                            subtitle: Text(
                              '   ' + temperatureStatus, // 替换为你的数据
                              style: TextStyle(
                                color: statusColor_T,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 第三部分
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 140, // 设置直径
                                height: 140, // 设置直径
                                child: CircularProgressIndicator(
                                  // value: temperature / 100.0, // 根据温度值计算进度
                                  value:
                                      currentTemperature / 100.0, // 根据温度值计算进度
                                  color: Colors.deepOrange, // 进度条颜色
                                  strokeWidth: 15.0, // 进度条宽度
                                ),
                              ),
                              Text(
                                // '$temperature°C', // 显示温度值
                                '${currentTemperature.toStringAsFixed(2)}°C',
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
              child: Row(
                children: [
                  // 第一部分
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black, width: 1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(
                                right: 30, bottom: 10), // 调整垂直间距
                            title: Text(
                              '今日最高湿度:',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20),
                            ),
                            subtitle: Text(
                              '     ' +
                                  '${maxHumidity.toStringAsFixed(1)}%', // 替换为你的数据
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          ListTile(
                            contentPadding:
                                EdgeInsets.only(right: 30), // 调整垂直间距
                            title: Text(
                              '今日最低湿度:',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20),
                            ),
                            subtitle: Text(
                              '     ' +
                                  '${minHumidity.toStringAsFixed(1)}%', // 替换为你的数据
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 第二部分
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black, width: 1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 30), // 调整title和subtitle之间的垂直间距
                              child: Text(
                                '当前湿度状况：',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                            subtitle: Text(
                              '   ' + humidityStatus, // 替换为你的数据
                              style: TextStyle(
                                color: statusColor_H,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 第三部分
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 140, // 设置直径
                                height: 140, // 设置直径
                                child: CircularProgressIndicator(
                                  // value: temperature / 100.0, // 根据温度值计算进度
                                  value:
                                      currentHumidity / 100.0, // 根据温度值计算进度
                                  color: Colors.blue, // 进度条颜色
                                  strokeWidth: 15.0, // 进度条宽度
                                ),
                              ),
                              Text(
                                // '$temperature°C', // 显示温度值
                                '${currentHumidity.toStringAsFixed(2)}%',
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
