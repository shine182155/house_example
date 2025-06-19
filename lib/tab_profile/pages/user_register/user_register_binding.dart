import 'package:get/get.dart';

import 'user_register_logic.dart';

class UserRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRegisterLogic());
  }
}
