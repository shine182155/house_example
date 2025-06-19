import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_home/tab_home_state.dart';
import 'package:house_example/tab_search/tab_search_logic.dart';
import 'package:house_example/tab_search/tab_search_state.dart';

import '../tab_home/tab_home_logic.dart';
import '../utils/common_utils.dart' show showToast;

class CommonSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLocation;
  final bool showMap;

  CommonSearchBar({
    super.key,
    required this.showLocation,
    required this.showMap,
  });

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight +
        MediaQueryData.fromView(WidgetsBinding.instance.window).padding.top,
  );

  final TabHomeLogic _tabHomeLogic = Get.find<TabHomeLogic>();
  final TabHomeState _tabHomeState = Get.find<TabHomeLogic>().state;

  final TabSearchLogic _tabSearchLogic = Get.find<TabSearchLogic>();
  final TabSearchState _tabSearchState = Get.find<TabSearchLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabSearchLogic>(
      builder: (logic) {
        return SizedBox(child: _buildRow(context));
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
        children: [_buildLocation(), _buildExpanded(context), _buildMap()],
      ),
    );
  }

  Expanded _buildExpanded(BuildContext context) {
    return Expanded(
      child: Container(
        height: 34.h,
        margin: EdgeInsets.only(left: showMap ? 5.w : 15, right:showMap ? 5.w : 15.w),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(17.r),
        ),
        child: TextField(
          cursorColor: Theme.of(context).primaryColor,
          controller: _tabSearchState.controller,
          onChanged: (value) => _tabSearchLogic.onSearchInputChanged(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '请输入关键词',
            hintStyle: TextStyle(color: Colors.black38),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _setIconBySearchWord(),
          ),
        ),
      ),
    );
  }

  Widget _setIconBySearchWord() {
    return GestureDetector(
      onTap: () => _tabSearchLogic.onDeleteSearchWord(),
      child: Icon(
        Icons.clear,
        color:
            _tabSearchState.searchWord == '' ? Colors.grey[200] : Colors.grey,
      ),
    );
  }

  Widget _buildLocation() {
    if (showLocation != false) {
      return Row(
        children: [
          const Icon(Icons.room, size: 25, color: Colors.lightGreen),
          Text('${_tabHomeState.cityName}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              )),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget _buildMap() {
    if (showMap != false) {
      return GestureDetector(
        onTap: () => showToast(content: "功能未实现"),
        child: Image.asset(
          'static/icons/widget_search_bar_map.png',
          color: Colors.orangeAccent,
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
