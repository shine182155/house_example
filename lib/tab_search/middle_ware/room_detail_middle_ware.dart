import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_profile/pages/user_login/user_login_logic.dart';

import '../../route/route_config.dart';
import '../../utils/common_utils.dart';

class RoomDetailMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    UserLoginLogic _logic = Get.put(UserLoginLogic());

    //TODO
    // if (_logic.state.isLogin == false) {
    //   showToast(content: '您未登录,必须先登录!');
    //
    //   return const RouteSettings(name: RouteGet.userLogin);
    // } else {
    //   return null;
    // }
  }
}
