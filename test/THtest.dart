import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;

class DataFetcher {
  Future<void> fetchTemperatureHumidity() async {
    // 发送 HTTP GET 请求
    final response = await http.get(Uri.parse('http://192.168.137.21/'));

    if (response.statusCode == 200) {
      // 解析 HTML
      final document = htmlParser.parse(response.body);

      // 提取温度和湿度数据
      final temperatureInput = document.querySelector('input[value]');
      final humidityInput = document.querySelector('input[value]');

      if (temperatureInput != null && humidityInput != null) {
        // 使用 double.parse 将字符串转换为 double
        final temperature = double.parse(temperatureInput.attributes['value']!);
        final humidity = double.parse(humidityInput.attributes['value']!);

        print('Temperature: $temperature, Humidity: $humidity');
        // 这里可以添加将数据插入数据库的逻辑
      }
    } else {
      print('Failed to fetch data');
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Temperature & Humidity Data')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             DataFetcher().fetchTemperatureHumidity();
//           },
//           child: Text('Fetch Data'),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
}