import 'package:get/get.dart';

import 'room_manage_logic.dart';

class RoomManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomManageLogic());
  }
}
