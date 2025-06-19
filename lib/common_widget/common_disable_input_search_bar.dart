import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_home/tab_home_state.dart';

import '../tab_home/tab_home_logic.dart';

class CommonDisableInputSearchBar extends StatelessWidget implements PreferredSizeWidget {
  CommonDisableInputSearchBar({super.key});

  final TabHomeLogic _tabHomeLogic = Get.find<TabHomeLogic>();

  final TabHomeState _tabHomeState = Get.find<TabHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabHomeLogic>(
      builder: (logic) {
        return Container(child: _buildRow(context));
      },
    );
  }

 Widget _buildRow(BuildContext context) {
    final statusBar = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBar),
      height: preferredSize.height,
      color: Colors.teal,
      child: Row(
        children: [
          _buildGestureDetector(),
          _buildExpanded(context),
          _buildImage(),
        ],
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: null,
      child: Row(
        children: [
          Icon(Icons.room, size: 25.r, color: Colors.lightGreen),
          Text(_tabHomeState.cityName,style: TextStyle(fontSize: 16.sp,color: Colors.white),),
        ],
      ),
    );
  }

  Image _buildImage() {
    return Image.asset(width: 44.r,
      'static/icons/widget_search_bar_map.png',
      color: Colors.orangeAccent,
    );
  }

  Expanded _buildExpanded(BuildContext context) {
    return Expanded(
      child: Container(
        height: 34.h,
        margin: EdgeInsets.only(left: 5.w),
        padding: EdgeInsets.only(left: 15.w, right: 10.w),
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(17.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _tabHomeState.cityName,
              style: TextStyle(color: Colors.black26, fontSize: 16.sp),
            ),
            Icon(Icons.search, color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + MediaQueryData.fromView(WidgetsBinding.instance.window).padding.top,
  );

}
