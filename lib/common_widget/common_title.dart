import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTitle extends StatelessWidget {
  final String title;

  const CommonTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return Container(alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.w),
      child: Text(
        title,
        style:  TextStyle(
            fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
