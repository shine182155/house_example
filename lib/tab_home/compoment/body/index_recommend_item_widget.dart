import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Index_recommendItem.dart';


var textStyle = TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title,
                style: textStyle,
              ),
              Text(
                data.subTitle,
                style: textStyle,
              )
            ],
          ),
          Image.asset(
            data.imageUrl,
            width: 60.r,
          )
        ],
      ),
    );
  }
}
