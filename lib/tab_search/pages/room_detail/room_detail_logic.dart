import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/utils/common_utils.dart';
import 'package:house_example/utils/platform/platform_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_widget/open_app_setting_with_callphone.dart';
import '../../../utils/validator/platform_method_names.dart';
import 'room_detail_state.dart';

class RoomDetailLogic extends GetxController {
  static const String bottomButtonId = "bottomButton";
  static const String roomDetailsId = "roomDetails";

  final RoomDetailState state = RoomDetailState();

  void updateShowAllTextStatus() {
    state.showAllText = !state.showAllText;
    update([RoomDetailLogic.roomDetailsId]);
  }

  void updateCollectStatus() {
    state.isCollected = !state.isCollected;
    if (state.isCollected) {
      showToast(content: "收藏成功");
    } else {
      showToast(content: "取消收藏");
    }
    update([RoomDetailLogic.bottomButtonId]);
  }

  Future<void> launchPhoneCall(String phoneNumber) async {
    if (Platform.isAndroid) {
      // Android 平台：需要手动请求权限

      await _dialPhoneNumberAndroid(phoneNumber);
    } else if (Platform.isIOS) {
      // TODO  未实现
      // iOS 平台：不需要手动请求权限，直接调用 _launchPhoneCallIos
      await _launchPhoneCallIos(phoneNumber);
    }
  }

  Future<dynamic> toAppSettingWithDenied() {
    return Get.dialog(_buildDialog(), barrierDismissible: false);
  }

  Future<void> toCallPhone(String phoneNumber) async {



    try {
      if (Platform.isAndroid) {
        await _dialPhoneNumberAndroid(phoneNumber);
      } else if (Platform.isIOS) {
        await _launchPhoneCallIos(phoneNumber);
      }
    } catch (e) {
      // 处理异常
      print("Error calling phone number: $e");
      // 可以显示一个 SnackBar
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("拨打电话失败：$e")));
      // 或者弹出一个对话框
      // showDialog(context: context, builder: (context) => AlertDialog(title: Text("错误"), content: Text("拨打电话失败：$e")));
    }
  }

  Widget _buildDialog() {
    return OpenAppSettingWithCallPhone();
  }

  Future _dialPhoneNumberAndroid(String phoneNumber) async {
    // Android 平台：需要手动请求权限
    final status = await Permission.phone.request();

    if (status == PermissionStatus.granted) {
      // 权限已授予，可以拨打电话
      try {
        PlatformUtils.invokeMethod(
          methodName: PlatformMethodNames.dial_phone_number,
          arguments: {"phoneNumber": phoneNumber},
        );
      } on PlatformExceptionWrapper catch (e) {

        _showErrorSnackBar("拨打电话失败，请检查电话号码或稍后重试"); // 显示SnackBar
      }
    } else {
      // 权限被拒绝
      toAppSettingWithDenied();
    }
  }

  Future _launchPhoneCallIos(String phoneNumber) async {
    try {
      PlatformUtils.invokeMethod(
        methodName: PlatformMethodNames.dial_phone_number,
        arguments: {"phoneNumber": phoneNumber},
      );
    } catch (e) {
      print("Error launching phone call on iOS: $e");
    }
  }

  void _showErrorSnackBar(String message) {
    Get.snackbar('拨打电话错误', message);
    // 显示SnackBar
  }
}
