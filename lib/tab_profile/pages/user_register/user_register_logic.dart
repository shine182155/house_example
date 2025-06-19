import 'package:get/get.dart';
import 'package:house_example/utils/validator/user_account_validator.dart';

import '../../../route/route_config.dart' show RouteGet;
import '../../../utils/common_utils.dart' show showToast;
import '../../../utils/validator/password_length_validator.dart';
import 'user_register_state.dart';

class UserRegisterLogic extends GetxController {
  final UserRegisterState state = UserRegisterState();

  void handlerRegister() {
    state.globalKey.currentState!.save();
    if (state.globalKey.currentState!.validate()) {
      showToast(content: '注册成功');

      Future.delayed(Duration(milliseconds: 600), () {
        Get.offNamed(RouteGet.userLogin);
      });
      // Timer(Duration(milliseconds: 600), () {
      //   Get.offNamed(RouteGet.login);
      // });
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
}
