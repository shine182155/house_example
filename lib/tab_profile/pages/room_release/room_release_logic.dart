
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:house_example/auto_expand_image.dart';
import 'package:house_example/utils/common_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'enum/room_property_type.dart';
import 'room_release_state.dart';

class RoomReleaseLogic extends GetxController {
  static const String imagePickerId = "imagePicker";
  static const String rentRadioId= "rentRadio";
  static const String decorationRadioId = "decorationRadio";
  static const String roomTypeSelectId = "roomTypeSelect";
  static const String floorTypeSelectId = "floorTypeSelect";
  static const String orientedTypeSelectId = "orientedTypeSelect";

  final RoomReleaseState state = RoomReleaseState();

  // 根据类型动态设置对应的属性值
  void updateProperty(RoomPropertyType type, int value) {
    if (type == RoomPropertyType.roomType) {
      state.roomType = value;
      update([RoomReleaseLogic.roomTypeSelectId]);
    } else if (type == RoomPropertyType.floorType) {
      state.floorType = value;
      update([RoomReleaseLogic.floorTypeSelectId]);
    } else if (type == RoomPropertyType.orientedType) {
      state.orientedType = value;
      update([RoomReleaseLogic.orientedTypeSelectId]);
    }
  }

  void releaseRoom() {
    showToast(content: "功能未实现");
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    state.files = state.files..add(image);
    update([RoomReleaseLogic.imagePickerId]);
  }

  void removeImage(XFile imageUri) {
    state.files = state.files..remove(imageUri);
    showToast(content: '已经删除该图片');

    update([RoomReleaseLogic.imagePickerId]);
  }

  void changeValue(int? value, {required RoomPropertyType type}) {
    if (value == null) return;
    if (type == RoomPropertyType.rentType) {
      state.rentType = value;
      update([RoomReleaseLogic.rentRadioId]);
    } else {
      state.decorationType = value;
      update([RoomReleaseLogic.decorationRadioId]);
    }

    // if (value == null) return;
    // state.rentType = value;
    // update();
  }

  void buildImageDialog(String path) {
    Get.dialog(_buildImageDialog(path));
  }

  Widget _buildImageDialog(String path) {
    return AutoExpandImage(imagePath: path);
  }
}
