import 'package:get/get.dart';
import 'package:house_example/tab_profile/pages/user_login/user_login_logic.dart';

import '../tab_home/tab_home_logic.dart';
import '../tab_info/tab_info_logic.dart';
import '../tab_profile/tab_profile_logic.dart';
import '../tab_search/tab_search_logic.dart';
import 'home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());


    Get.lazyPut(() => TabHomeLogic(),fenix: true);
    Get.lazyPut(() => TabSearchLogic(),fenix: true);
    Get.lazyPut(() => TabInfoLogic(),fenix: true);
    Get.lazyPut(() => TabProfileLogic(),fenix: true);
     Get.lazyPut(() => UserLoginLogic(),fenix: true) ;
  }
}
