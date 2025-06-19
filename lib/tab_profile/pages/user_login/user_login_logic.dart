import 'package:get/get.dart';
import 'package:house_example/utils/app_closer/app_closer_factory.dart';
import 'package:house_example/utils/validator/user_account_validator.dart';

import '../../../route/route_config.dart';
import '../../../utils/common_utils.dart';
import '../../../utils/validator/password_length_validator.dart';
import 'user_login_state.dart';

class UserLoginLogic extends GetxController {
  final UserLoginState state = UserLoginState();
  static const String headerId = 'header';
  void handlerRegister() {
    if (state.globalKey.currentState!.validate()) {
      showToast(content: '登录成功');

      Future.delayed(Duration(milliseconds: 600), () {
        loginAndReturnToHome();
        // Get.offNamed(RouteGet.userLogin);
      });
    }
  }

  String? validateUserAccount(String? value) {
    var validate = UserAccountValidator().validate(value);
    return validate;
  }

  String? validateUserPassword(String? value) {
    var validate = PasswordLengthValidator().validate(value);

    return validate;
  }

  void jumpToUserRegisterPage() {
    Get.offNamed(RouteGet.userRegister);
  }

  void loginAndReturnToHome() {
    state.isLogin = true;
    update([UserLoginLogic.headerId]);
    Get.back();
  }

  void logoutAndReturnToHome() {
    showToast(content: "已经退出登录");
    state.isLogin = false;
    update([UserLoginLogic.headerId]);
    Get.back();
  }

  /// This method is used to close the app.
  void closeApp() {
    var app = AppCloserFactory.create();
    app.closeApp();
  }
}
