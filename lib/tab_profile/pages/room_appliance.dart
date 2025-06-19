import 'package:flutter/material.dart';

import '../../models/config.dart';


List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

class RoomApplianceList extends StatelessWidget {
  final List<String> list;

  RoomApplianceList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    var showList =
        _dataList.where((item) => list.contains(item.title)).toList();
    return Wrap(
        children: showList
            .map((item) => Container(
                  width: (MediaQuery.of(context).size.width) / 5,
                  child: Column(
                    children: [
                      Icon(
                        IconData(item.iconPoint, fontFamily: Config.commonIcon),
                        size: 40,
                      ),
                      Text(item.title),
                    ],
                  ),
                ))
            .toList());
  }
}
