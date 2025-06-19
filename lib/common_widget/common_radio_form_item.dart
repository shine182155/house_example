import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_profile/pages/room_release/room_release_logic.dart';

import '../tab_profile/pages/room_release/enum/room_property_type.dart';
import '../tab_profile/pages/room_release/room_release_state.dart';
import 'common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int initValue;
  final RoomPropertyType type;

  CommonRadioFormItem({
    super.key,
    required this.label,
    required this.options,
    required this.initValue, required this.type,
  });

  final RoomReleaseLogic _logic = Get.find<RoomReleaseLogic>();
  final RoomReleaseState _state = Get.find<RoomReleaseLogic>().state;

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            options.length,
            (index) => Row(
              children: [
                Radio(
                  value: index,   //0
                  groupValue: initValue,//0
                  onChanged: (value) {
                    _logic.changeValue(value, type: type);
                  },
                  fillColor: WidgetStatePropertyAll(
                    Theme.of(context).primaryColor,
                  ),
                ),
                Text(options[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
