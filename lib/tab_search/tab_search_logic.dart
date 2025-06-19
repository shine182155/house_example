import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/models/general_type.dart';
import 'package:house_example/route/route_config.dart';
import 'package:house_example/tab_search/component/body/enum/filter_bar_property_type.dart';
import 'package:house_example/utils/common_utils.dart';

import '../common_widget/common_picker.dart';
import 'tab_search_state.dart';

class TabSearchLogic extends GetxController {


  /// GetBuilder 局部刷新页面ID
  static const String roomListId = 'roomList';
  static const String filterBarId = 'filterBar';


  final TabSearchState state = TabSearchState();

  Future<void> handlerOnRefresh() async {
    await Future.delayed(const Duration(seconds: 1)); // 模拟网络请求
    state.roomListItemDatas =state.roomListItemDatas.reversed.toList();
    showToast(content: "刷新成功");
    update([TabSearchLogic.roomListId]);
    
  }

  void navigatorToRoomDetail() {
    // Navigate to room detail page
    Get.toNamed(RouteGet.roomDetail);
  }

  Future<void> onFilterBarItemClick(
    bool isSelected,
    FilterBarPropertyType type,
    List<GeneralType> generalTypeList,
    BuildContext context,
  ) async {
    var result = await CommonPicker.showCupertinoPicker(
      context: context,
      options: generalTypeList.map((item) => item.name).toList(),
      initialIndex: 0,
    );
    if (result != null) {
      updateProperty(type, true);
    } else {
      updateProperty(type, false);

    }
  }
/// 处理区域选择
  void updateProperty(FilterBarPropertyType type,bool isSelected) {
    switch (type) {
      case FilterBarPropertyType.areaType:
        state.isAreaSelected = isSelected;
        update([TabSearchLogic.filterBarId]);

        break;
      case FilterBarPropertyType.rentType:
        state.isRentTypeSelected = isSelected;
        update([TabSearchLogic.filterBarId]);
        update();


        break;
      case FilterBarPropertyType.priceSeType:
        state.isPriceSelected = isSelected;
        update([TabSearchLogic.filterBarId]);
          update();

        break;
    }
  }

  void openEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
    state.isFilterSelected = true;
    update();
  }

  void onSearchInputChanged(String value) {
    state.searchWord = value;
    update();
  }
  void onDeleteSearchWord() {
    state.controller.text = '';
    state.searchWord = '';
    update();
  }
}
