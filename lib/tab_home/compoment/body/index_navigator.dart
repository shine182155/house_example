import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_home/tab_home_logic.dart';

import 'index_navigator_item.dart';

class IndexNavigator extends StatelessWidget {
   IndexNavigator({super.key});


  final TabHomeLogic _logic = Get.find<TabHomeLogic>();
  @override
  Widget build(BuildContext context) {

    return Container(
      padding:  EdgeInsets.only(top: 6.h, bottom: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: indexNavigatorItemList
            .map((item) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _logic.checkIsLogin,
                  child: Column(
                    children: [
                      Image.asset(
                        item.imageUri,
                        height: 45.r,
                      ),
                      Text(
                        item.title,
                        style:  TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
