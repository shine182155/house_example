import 'dart:io';
import 'package:flutter/material.dart';

class AutoExpandImage extends StatefulWidget {
  final String imagePath;

  AutoExpandImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _AutoExpandImageState createState() => _AutoExpandImageState();
}

class _AutoExpandImageState extends State<AutoExpandImage> {
  double _imageHeight = 0; // 初始高度为 0
  double _imageWidth = 0; // 初始宽度为 0

  @override
  void initState() {
    super.initState();
    // 在 Widget 构建完成后执行动画
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _imageHeight = 250; // 设置目标高度，触发动画
        _imageWidth = MediaQuery.of(context).size.width - 20; // 设置目标宽度
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),  // 动画持续时间
        curve: Curves.easeInOut,  // 动画曲线
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: _imageHeight,
        width: _imageWidth,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: FileImage(File(widget.imagePath)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}