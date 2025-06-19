import 'dart:async';

import 'package:get/get.dart';
import 'package:house_example/tab_profile/pages/user_login/user_login_state.dart';

import '../models/InfoItem.dart';
import '../route/route_config.dart';
import '../tab_profile/pages/user_login/user_login_logic.dart';
import '../utils/common_utils.dart';
import 'tab_home_state.dart';

class TabHomeLogic extends GetxController {
  final TabHomeState state = TabHomeState();

  setCityName(String newCityName) => state.cityName = newCityName;

  saveCityName(String cityName) {
    // var pres = await AppPreferences.getInstance();
    // pres.setString(StoreKeys.city, cityName);
    state.cityName = cityName;
    update();
  }


  /// [ ImageDetailPage]
  void navigateToImageDetailPage(InfoItem data){

    Get.toNamed(RouteGet.imageDetail,arguments: data);

  }
  void checkIsLogin(){
    final UserLoginLogic _logic = Get.find<UserLoginLogic>();
    final UserLoginState _state = _logic.state;


    if(_state.isLogin ==false){
     showToast(content:'您未登录,必须先登录');
        Timer(const Duration(milliseconds: 600), () {

          Get.toNamed(RouteGet.userLogin);
        });

    }

  }
}
