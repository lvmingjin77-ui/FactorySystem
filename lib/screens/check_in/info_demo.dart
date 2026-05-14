import 'package:admin/screens/check_in/pie/pie_demo.dart';
import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
// import 'package:admin/screens/check_in/pie/pie1.dart';

class ShowRowInfoDemo extends StatefulWidget {
  const ShowRowInfoDemo({Key? key}) : super(key: key);

  @override
  State<ShowRowInfoDemo> createState() => ShowRowInfoDemoState();
}

class ShowRowInfoDemoState extends State<ShowRowInfoDemo> {
  List<Map<String, dynamic>> latestData = [
    {"id": 7, "name": "吴勇", "position": "财务经理", "department": "财务部", "work_status": "签退", "timestamp": "2024-03-20 18:43:00"},
    {"id": 13, "name": "马丽", "position": "运营经理", "department": "运营部", "work_status": "签退", "timestamp": "2024-03-20 18:40:00"},
    {"id": 9, "name": "李明", "position": "工程师", "department": "研发部", "work_status": "签退", "timestamp": "2024-03-20 18:35:00"},
    {"id": 18, "name": "曹静", "position": "财务助理", "department": "财务部", "work_status": "签退", "timestamp": "2024-03-20 18:31:00"},
    {"id": 12, "name": "赵伟", "position": "测试工程师", "department": "技术部", "work_status": "签退", "timestamp": "2024-03-20 18:30:00"},
    {"id": 1, "name": "王宁", "position": "软件工程师", "department": "技术部", "work_status": "签退", "timestamp": "2024-03-20 18:20:00"},
    {"id": 15, "name": "何洋", "position": "销售助理", "department": "销售部", "work_status": "签退", "timestamp": "2024-03-20 18:15:00"},
    {"id": 11, "name": "许娟", "position": "质量控制经理", "department": "质量控制部", "work_status": "签退", "timestamp": "2024-03-20 18:12:00"},
    {"id": 16, "name": "郑敏", "position": "客户服务代表", "department": "客户服务部", "work_status": "签退", "timestamp": "2024-03-20 18:10:00"},
    {"id": 6, "name": "黄芳", "position": "销售经理", "department": "销售部", "work_status": "签退", "timestamp": "2024-03-20 18:07:00"},
    {"id": 5, "name": "林晨", "position": "工程师", "department": "策划部", "work_status": "签退", "timestamp": "2024-03-20 18:05:00"},
    {"id": 17, "name": "孙强", "position": "系统管理员", "department": "技术部", "work_status": "签退", "timestamp": "2024-03-20 18:02:00"},
    {"id": 2, "name": "张磊", "position": "系统工程师", "department": "技术部", "work_status": "早退", "timestamp": "2024-03-20 17:30:00"},
    {"id": 14, "name": "朱军", "position": "人事专员", "department": "人力资源部", "work_status": "早退", "timestamp": "2024-03-20 17:20:00"},
    {"id": 4, "name": "刘阳", "position": "项目经理", "department": "项目部", "work_status": "早退", "timestamp": "2024-03-20 17:15:00"},
    {"id": 19, "name": "蒋勇", "position": "市场专员", "department": "市场部", "work_status": "早退", "timestamp": "2024-03-20 17:10:00"},
    {"id": 8, "name": "徐秀英", "position": "人力资源经理", "department": "人力资源部", "work_status": "早退", "timestamp": "2024-03-20 17:07:00"},
    {"id": 10, "name": "周涛", "position": "客户服务经理", "department": "客户服务部", "work_status": "迟到", "timestamp": "2024-03-20 09:45:00"},
    {"id": 2, "name": "张磊", "position": "系统工程师", "department": "技术部", "work_status": "迟到", "timestamp": "2024-03-20 09:31:00"},
    {"id": 7, "name": "吴勇", "position": "财务经理", "department": "财务部", "work_status": "迟到", "timestamp": "2024-03-20 09:27:00"},
    {"id": 20, "name": "丁娟", "position": "采购经理", "department": "采购部", "work_status": "签到", "timestamp": "2024-03-20 08:50:00"},
    {"id": 19, "name": "蒋勇", "position": "市场专员", "department": "市场部", "work_status": "签到", "timestamp": "2024-03-20 08:45:00"},
    {"id": 4, "name": "刘阳", "position": "项目经理", "department": "项目部", "work_status": "签到", "timestamp": "2024-03-20 08:42:00"},
    {"id": 14, "name": "朱军", "position": "人事专员", "department": "人力资源部", "work_status": "签到", "timestamp": "2024-03-20 08:40:00"},
    {"id": 17, "name": "孙强", "position": "系统管理员", "department": "技术部", "work_status": "签到", "timestamp": "2024-03-20 08:38:00"},
    {"id": 15, "name": "何洋", "position": "销售助理", "department": "销售部", "work_status": "签到", "timestamp": "2024-03-20 08:35:00"},
    {"id": 11, "name": "许娟", "position": "质量控制经理", "department": "质量控制部", "work_status": "签到", "timestamp": "2024-03-20 08:32:00"},
    {"id": 16, "name": "郑敏", "position": "客户服务代表", "department": "客户服务部", "work_status": "签到", "timestamp": "2024-03-20 08:30:00"},
    {"id": 6, "name": "黄芳", "position": "销售经理", "department": "销售部", "work_status": "签到", "timestamp": "2024-03-20 08:27:00"},
    {"id": 5, "name": "林晨", "position": "工程师", "department": "策划部", "work_status": "签到", "timestamp": "2024-03-20 08:26:00"},
    {"id": 18, "name": "曹静", "position": "财务助理", "department": "财务部", "work_status": "签到", "timestamp": "2024-03-20 08:24:00"},
  ];
  // List<int> signNum = [10, 20, 30, 40]; // Example signNum data

  bool showDataList = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
        child: Column(
          children: [
            Expanded(
              child: showDataList ? buildDataList() : buildPieChart(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      showDataList = true;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      showDataList = false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDataList() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: defaultPadding,
                      columns: [
                        DataColumn(label: Text("员工ID",style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),)),
                        DataColumn(label: Text("姓名",style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),)),
                        DataColumn(label: Text("职位",style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),)),
                        DataColumn(label: Text("部门",style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),)),
                        DataColumn(label: Text("签到状态",style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),)),
                        DataColumn(label: Text("签到时间",style: TextStyle(
                                      fontSize: 20, // 设置字号为16
                                      fontWeight: FontWeight.bold, // 加粗
                                      fontFamily: 'Roboto', // 设置字体
                                      color: Color.fromRGBO(197, 184, 110, 1)
                                      // 可以根据需要添加更多样式选项，比如颜色、行高等
                                      ),)),
                      ],
                      rows: List.generate(
                        latestData.length,
                        (index) {
                          var data = latestData[index];
                          return DataRow(
                            cells: [
                              DataCell(Text(data["id"].toString())),
                              DataCell(Text(data["name"] ?? "")),
                              DataCell(Text(data["position"] ?? "")),
                              DataCell(Text(data["department"] ?? "")),
                              DataCell(Text(data["work_status"] ?? "")),
                              DataCell(Text(data["timestamp"] ?? "")),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPieChart() {
    return Container(
      child: PieChartDemo(),
    );
  }
}
