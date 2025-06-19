import 'package:get/get.dart';

import 'room_release_logic.dart';

class RoomReleaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomReleaseLogic());
  }
}
