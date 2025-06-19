import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_profile/pages/room_release/room_release_logic.dart';
import 'package:house_example/tab_profile/pages/room_release/room_release_state.dart';

import '../tab_profile/pages/room_release/enum/room_property_type.dart';
import 'common_form_item.dart';
import 'common_picker.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final int value;
  final List<String> options;
  final RoomPropertyType type;

  CommonSelectFormItem({
    super.key,
    required this.label,
    required this.options,
    required this.value,
    required this.type,
  });

  final RoomReleaseLogic logic = Get.find<RoomReleaseLogic>();
  final RoomReleaseState state = Get.find<RoomReleaseLogic>().state;

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => _handlerOnTap(context),
          child: _buildChildContainer(),
        );
      },
    );
  }

  Widget _buildChildContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(options[value]),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }

  /// 处理点击事件
  Future<void> _handlerOnTap(BuildContext context) async {
    // 显示选择器
    var result = await CommonPicker.showCupertinoPicker(
      context: context,
      options: options,
      initialIndex: value,
    );
    // 选择器返回的值
    if (result != null ) {
      logic.updateProperty(type, result);
    }
  }
}
