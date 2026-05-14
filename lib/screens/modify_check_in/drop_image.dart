import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
// import 'package:cross_file/cross_file.dart';
import 'package:image_picker/image_picker.dart';

class DropImage extends StatefulWidget {
  const DropImage({Key? key}) : super(key: key);

  @override
  _DropImageState createState() => _DropImageState();
}

List<XFile> _list = [];

// 从文件路径中提取文件名
String getFileName() {
  return _list.last.path.split('\\').last;
}

// 从文件路径中提取文件名
String getFileFullName() {
  return _list.last.path;
}

void clearImages() {
  _list.clear();
}

class _DropImageState extends State<DropImage> {
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _list.isEmpty
            ? DropTarget(
                onDragDone: (detail) {
                  setState(() {
                    _list.addAll(detail.files);
                  });
                },
                onDragEntered: (detail) {
                  setState(() {
                    _dragging = true;
                  });
                },
                onDragExited: (detail) {
                  setState(() {
                    _dragging = false;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      color: _dragging
                          ? Colors.white.withAlpha(250)
                          : Colors.white.withAlpha(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 40,
                            Icons.image_outlined,
                          ),
                          Text(" drop files here"),
                        ],
                      ),
                    ),
                  ],
                ))
            : Images(),// 移除 const
        SizedBox(height: 10), // 添加垂直间距
        ElevatedButton(
          onPressed: () => _pickImageFromLocal(),
          child: Text("Pick Image"),
        ),
      ],
    ); 
  }

  // 从本地文件选择图片
  Future<void> _pickImageFromLocal() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _list.add(XFile(pickedFile.path));
      });
    }
  }
}


class Images extends StatelessWidget {
  Images({Key? key}) : super(key: key); // 移除 const

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_list.length, (index) {
          return SizedBox(
            width: 200,
            height: 200,
            child: Image.file(
              File(_list[index].path),
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}
