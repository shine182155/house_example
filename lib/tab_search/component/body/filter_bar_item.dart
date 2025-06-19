import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:house_example/tab_search/component/body/enum/filter_bar_property_type.dart';

import '../../../models/general_type.dart';
import '../../tab_search_logic.dart';

class FliterBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final FilterBarPropertyType type;
  final List<GeneralType> generalTypeList;


   FliterBarItem({super.key,
    required this.title,
    required this.isSelected, required this.type, required this.generalTypeList});
  final TabSearchLogic _logic = Get.find<TabSearchLogic>();

  @override
  Widget build(BuildContext context) {
    //根据是否选中来更新Color颜色
    var color = isSelected ? Colors.teal : Colors.black87;

    return GestureDetector(
      onTap:  ()  => _logic.onFilterBarItemClick(isSelected, type, generalTypeList, context),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: color,fontSize: 14.sp),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: color,
          )
        ],
      ),
    );
  }
}

