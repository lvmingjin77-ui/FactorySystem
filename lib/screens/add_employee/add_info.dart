// import 'dart:io';

import 'dart:convert';
import 'dart:io';

import 'package:admin/constants.dart';
import 'package:admin/screens/add_employee/drop_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _employeeNameController = TextEditingController();
  TextEditingController _employeeAgeController = TextEditingController();
  TextEditingController _employeeSloganController = TextEditingController();
  var genders = ['男', '女'];
  var position = ['网络编辑', '软件架构师', '运维工程师', '前端工程师', '后端工程师'];
  var department = ['项目部', '设计部', '项目策划部', '文秘部'];
  String? selectedGender;
  String? selectedPosition;
  String? selectedDepartment;
  TimeOfDay _selectedStartTime = TimeOfDay.now();
  TimeOfDay _selectedEndTime = TimeOfDay.now();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedStartTime,
    );

    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedStartTime = picked;
        _startTimeController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedEndTime,
    );

    if (picked != null && picked != _selectedEndTime) {
      setState(() {
        _selectedEndTime = picked;
        _endTimeController.text = picked.format(context);
      });
    }
  }

  void _clearData() {
    setState(() {
      _employeeIdController.clear();
      _employeeNameController.clear();
      _employeeAgeController.clear();
      _employeeSloganController.clear();
      _startTimeController.clear();
      _endTimeController.clear();
      selectedGender = null;
      selectedPosition = null;
      selectedDepartment = null;
      clearImages();
    });
  }

  void _submitData() async {
    try {
      // Prepare data to be sent
      Map<String, dynamic> data = {
        'uid': _employeeIdController.text,
        'avatar': null, // Add your avatar data here
        'name': _employeeNameController.text,
        'sex': selectedGender,
        'age': int.parse(_employeeAgeController.text),
        'level': selectedPosition, // Add your level data here
        'department': selectedDepartment,
        'workon_t': _startTimeController.text,
        'workout_t': _endTimeController.text,
        'work_night': null, // Add your work night data here
        'slogan': _employeeSloganController.text,
        'add_time': null,
        'update_time': null,
        'avatar_name': getFileName(), // Add your avatar name data here
      };

      // Send data to the Flask server
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/store_data'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        // Data stored successfully on the server
        print('Data stored successfully');
      } else {
        // Failed to store data on the server
        print('Failed to store data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors
      print('Error: $e');
    }
  }

  void copyImageToFolder(String imagePath, String targetFolderPath) {
    imagePath = imagePath.replaceAll('\\', '/');
    targetFolderPath = targetFolderPath.replaceAll('\\', '/');
    // print(imagePath);
    // print(targetFolderPath);
    try {
      File imageFile = File(imagePath);
      Directory targetFolder = Directory(targetFolderPath);

      if (!targetFolder.existsSync()) {
        targetFolder.createSync(recursive: true);
      }

      String imageName = imagePath.split('/').last;
      File newFile = File('${targetFolder.path}/$imageName');

      imageFile.copySync(newFile.path);
      print('Image copied to: ${newFile.path}');
    } catch (e) {
      print('Error copying image: $e');
    }
  }

  String readIniFile(String iniFilePath) {
    try {
      File iniFile = File(iniFilePath);
      if (iniFile.existsSync()) {
        String content = iniFile.readAsStringSync();
        return content.trim(); // 返回去除首尾空格的目标文件夹路径
      } else {
        print('INI file not found.');
        return '';
      }
    } catch (e) {
      print('Error reading INI file: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        DropImage(),
        SizedBox(height: 10), // 添加垂直间距
        Container(
          alignment: Alignment.center,
          width: 500,
          // constraints: BoxConstraints(
          //   maxWidth: 500.0, // 设置最大宽度为 500 像素
          // ),
          child: Column(children: [
            TextField(
              controller: _employeeIdController,
              decoration: InputDecoration(
                labelText: '员工工号',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0), // 调整上方和下方的垂直填充
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _employeeNameController,
              decoration: InputDecoration(
                labelText: '员工姓名',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0), // 调整上方和下方的垂直填充
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '性别',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0), // 调整上方和下方的垂直填充
              ),
              // 设置默认值
              value: null,
              // 选择回调
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
              },
              // 传入可选的数组
              items: genders.map((String sex) {
                return DropdownMenuItem(value: sex, child: Text(sex));
              }).toList(),
            ),
            TextField(
              controller: _employeeAgeController,
              decoration: InputDecoration(
                labelText: '员工年龄',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0), // 调整上方和下方的垂直填充
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '职位',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0), // 调整上方和下方的垂直填充
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPosition = newValue!;
                });
              },
              // 传入可选的数组
              items: position.map((String p) {
                return DropdownMenuItem(value: p, child: Text(p));
              }).toList(),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '所属部门',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0), // 调整上方和下方的垂直填充
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDepartment = newValue!;
                });
              },
              // 传入可选的数组
              items: department.map((String d) {
                return DropdownMenuItem(value: d, child: Text(d));
              }).toList(),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _employeeSloganController,
              decoration: InputDecoration(
                labelText: '口号',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0), // 调整上方和下方的垂直填充
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _startTimeController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: '上班时间',
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () => _selectStartTime(context),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _endTimeController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: '下班时间',
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () => _selectEndTime(context),
                ),
              ),
            ),
            SizedBox(height: 10),
          ]),
        ),

        // ElevatedButton(
        //   onPressed: () {
        //     String employeeId = _employeeIdController.text;
        //     String employeeName = _employeeNameController.text;
        //     print('Employee ID: $employeeId, Employee Name: $employeeName');
        //     // 在这里可以执行其他操作，例如将员工信息发送到服务器等。
        //   },
        //   child: Text('Get Employee Info'),
        // ),
        SizedBox(
          height: 30,
        ),
        Container(
          // padding: EdgeInsets.only(bottom: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 60)),
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
                  child: Text("清空信息"),
                  onPressed: _clearData),
              SizedBox(
                width: 200,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 60)),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => secondaryColor),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  )),
                  elevation: MaterialStateProperty.all(10),
                  shadowColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  overlayColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 66, 85, 128)), //字体颜色
                ),
                child: Text("提交信息"),
                onPressed: () {
                  _submitData();
                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('提交成功!',
                                      style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.black,
                                    ),
                                  );
                  // copyImageToFolder(getFileFullName(), 'E:\competition\Flutter-Responsive-Admin-Panel-or-Dashboard-master\employee_image');
                  // print("提交信息");
                  // print(_employeeIdController.text +
                  //     _employeeNameController.text +
                  //     _employeeAgeController.text +
                  //     _employeeSloganController.text +
                  //     selectedGender! +
                  //     selectedPosition! +
                  //     selectedDepartment! +
                  //     _startTimeController.text +
                  //     _endTimeController.text +
                  //     getFileName());
                  // 获取当前工作目录
                  String currentDirectory = Directory.current.path;
                  // print(currentDirectory);

                  // 相对路径
                  String relativePath = 'lib\\config.ini';

                  // 构建完整的INI文件路径
                  String iniPath = '$currentDirectory\\$relativePath';
                  // print(iniPath);

                  // 通过iniPath获取目标文件夹路径
                  String targetFolderPath = readIniFile(iniPath);
                  // print(targetFolderPath);
                  String imagePath = getFileFullName();

                  // 从.ini文件中读取目标文件夹路径
                  // String iniPath = '../../config.ini';
                  // String targetFolderPath = readIniFile(iniPath);

                  // 复制图片到指定文件夹
                  copyImageToFolder(imagePath, targetFolderPath);
                },
                // onPressed: _submitData, // 调用提交数据的方法
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
