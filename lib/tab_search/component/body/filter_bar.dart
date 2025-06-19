import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_example/tab_search/component/body/filter_bar_item.dart';

import '../../tab_search_logic.dart';
import '../../tab_search_state.dart';
import 'package:get/get.dart';

import 'enum/filter_bar_property_type.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  final TabSearchLogic _logic = Get.find<TabSearchLogic>();
  final TabSearchState _state = Get.find<TabSearchLogic>().state;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 41.h,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.7, color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FliterBarItem(
            title: '区域',
            isSelected: _state.isAreaSelected,
            type: FilterBarPropertyType.areaType,
            generalTypeList: _state.areaList,
          ),
          FliterBarItem(
            title: '方式',
            isSelected: _state.isRentTypeSelected,
            type: FilterBarPropertyType.rentType,
            generalTypeList: _state.rentTypeList,
          ),
          FliterBarItem(
            title: '租金',
            isSelected: _state.isPriceSelected,
            type: FilterBarPropertyType.priceSeType,
            generalTypeList: _state.priceList,
          ),
          _buildFilterBarDrawer(),
        ],
      ),
    );
  }

  onFilterChange(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
    setState(() {
      // _state.isFilterSelected = false;
    });
  }

  _buildFilterBarDrawer() {
    return GestureDetector(
      onTap: () => _logic.openEndDrawer(context),
      child: Row(
        children: [
          Text(
            "筛选",
            // style: TextStyle(
            //   color: _state.isFilterSelected ? Colors.teal : Colors.black87,
            // ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: _state.isFilterSelected ? Colors.teal : Colors.black87,
          ),
        ],
      ),
    );
  }
}
