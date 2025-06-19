import 'package:get/get.dart';

import 'room_detail_logic.dart';

class RoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomDetailLogic());
  }
}
