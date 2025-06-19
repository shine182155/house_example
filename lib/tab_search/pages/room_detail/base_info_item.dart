import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseInfoItem extends StatelessWidget {
  final String data;

  const BaseInfoItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
      child: Text(
        data,
        style:  TextStyle(fontSize: 16.sp),
      ),
    );
  }
}
