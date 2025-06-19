import 'package:get/get.dart';
import 'package:house_example/tab_home/tab_home_logic.dart';

import '../tab_home/tab_home_state.dart';
import '../utils/common_utils.dart' show showToast;
import 'tab_info_state.dart';

class TabInfoLogic extends GetxController {
  final TabInfoState state = TabInfoState();

  Future<void> handlerOnRefresh() async {
    await Future.delayed(const Duration(seconds: 1)); // 模拟网络请求

    final TabHomeState tabHomeState = Get.find<TabHomeLogic>().state;
    tabHomeState.infoItems = tabHomeState.infoItems.reversed.toList();
    showToast(content: "刷新成功");
    update();
  }
}

