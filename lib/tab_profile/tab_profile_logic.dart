import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_example/route/route_config.dart';

import 'tab_profile_state.dart';

class TabProfileLogic extends GetxController {
  final TabProfileState state = TabProfileState();

  //跳转到用户设置
  navigateToUserSetting() => Get.toNamed('/userSetting');

  // 跳转到登录页面
  navigateToUserLogin() => Get.toNamed(RouteGet.userLogin);

  // 跳转到注册页面
  navigateToUserRegister() => Get.toNamed(RouteGet.userRegister);

  // 跳转到房间管理页面
  navigateToRoomManage() => Get.toNamed(RouteGet.roomManage);
}
