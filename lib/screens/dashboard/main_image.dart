import 'package:flutter/material.dart';

class MainImage extends StatefulWidget {
  const MainImage({super.key});

  @override
  State<MainImage> createState() => _MainImageState();
}

class _MainImageState extends State<MainImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 0,
          )
        ],
        image: DecorationImage(
          image: AssetImage('assets/mainImage.png'), // 您的图片路径
          fit: BoxFit.cover, // 图片适配方式，这里是填充整个Container
        ),
      ),
    );
  }
}
