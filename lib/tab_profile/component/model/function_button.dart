import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_profile/component/model/FunctionButtonItemData.dart';

import '../../tab_profile_logic.dart';

class FunctionButton extends StatelessWidget {
  final List<FunctionButtonItemData> list;

const FunctionButton({super.key, required this.list});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      child: Wrap(
        spacing: 1,
        runSpacing: 1,
        children: list.map((item) => FunctionButtonItem(data: item)).toList(),
      ),
    );
  }
}
class FunctionButtonItem extends StatelessWidget {
  final FunctionButtonItemData data;

   FunctionButtonItem({
    super.key,
    required this.data,
  });

  /// GestureDetector.onTap 点击跳转到 [RoomManage]

    final _logic = Get.find<TabProfileLogic>();
  @override
  Widget build(BuildContext context) {

    return GestureDetector(onTap: _logic.navigateToRoomManage,
      child: SizedBox(
        height: 80.h,
        width: MediaQuery.of(context).size.width * 0.33,
        child: Column(children: [
          Image.asset(data.imageUrl,width: 45.w,height: 45.w,),
          Text(data.title,style: TextStyle(fontSize: 13),)
        ],),
      ),
    );
  }
}
