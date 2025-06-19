
import 'package:flutter/material.dart';

import '../../../../common_widget/common_title.dart';
import '../../../../models/general_type.dart';
import '../../tab_search_logic.dart';
import 'package:get/get.dart';

import '../../tab_search_state.dart';

class FilterDraw extends StatefulWidget {
  const FilterDraw({super.key});

  @override
  State<FilterDraw> createState() => _FilterDrawState();
}

class _FilterDrawState extends State<FilterDraw> {
  final TabSearchLogic logic = Get.find<TabSearchLogic>();
  final TabSearchState state = Get.find<TabSearchLogic>().state;

  var roomTypeActiveList = [true, false];
  var orientedActiveList = [false, true];
  var floorActiveList = [true, false];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: ListView(
          children: [
            const CommonTitle(title: '户型'),
            FilterDrawItem(
              list: state.roomTypeList,
              isActiveList: roomTypeActiveList,
              valueChanged: _updateRoomTypeActiveByIndex,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: CommonTitle(title: '朝向'),
            ),
            FilterDrawItem(
              list: state.orientedList,
              isActiveList: orientedActiveList,
              valueChanged: _updateOrientedActiveByIndex,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: CommonTitle(title: '楼层'),
            ),
            FilterDrawItem(
              list: state.floorList,
              isActiveList: floorActiveList,
              valueChanged: _updateFloorActiveList,
            ),
          ],
        ),
      ),
    );
  }

  ///通过返回的[index]更改数据
  void _updateRoomTypeActiveByIndex(int index) {
    setState(() {
      roomTypeActiveList[index] = !roomTypeActiveList[index];
    });
  }

  void _updateOrientedActiveByIndex(int index) {
    setState(() {
      orientedActiveList[index] = !orientedActiveList[index];
    });
  }

  void _updateFloorActiveList(int index) {
    setState(() {
      floorActiveList[index] = !floorActiveList[index];
    });
  }
}

class FilterDrawItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<bool> isActiveList;
  final ValueChanged<int> valueChanged;

  const FilterDrawItem(
      {super.key,
      required this.list,
      required this.isActiveList,
      required this.valueChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(list.length, (index) {
        var title = list[index].name;
        var isActive = isActiveList[index];

        var textColors = isActive ? Colors.white : Colors.green;
        var backgroundColors = isActive ? Colors.green : Colors.white;

        return GestureDetector(
          onTap: () {
            valueChanged(index);
          },
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: backgroundColors,
                border: Border.all(color: Colors.green)),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: textColors),
              ),
            ),
          ),
        );
      }),
    );
  }
}
