import 'package:get/get.dart';
import 'package:house_example/route/route_config.dart';

import 'room_manage_state.dart';

class RoomManageLogic extends GetxController {
  final RoomManageState state = RoomManageState();



  void navigateToRoomRelease() {
    Get.toNamed(RouteGet.roomRelease);
  }
}
