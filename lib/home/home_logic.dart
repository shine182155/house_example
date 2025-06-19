import 'package:get/get.dart';
import 'package:house_example/utils/app_closer/app_closer_factory.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  handlerOnTap(int index) {
    state.currentIndex = index;
    update();
  }

  /// 处理物理返回键
  handlerOnPopInvokedWithResult(bool didPop, dynamic result) {
    if (closeOnConfirm()) {
      // 系统级别导航栈 退出程序
      closeApp();
    }
  }

  /// 返回键退出
  bool closeOnConfirm() {
    DateTime now = DateTime.now();
    // 物理键，两次间隔大于4秒, 退出请求无效
    if (state.currentBackPressTime == null ||
        now.difference(state.currentBackPressTime!).inSeconds > 8) {
      state.currentBackPressTime = now;

      Get.snackbar('提示', '再次按下以关闭应用程序', snackPosition: SnackPosition.BOTTOM);

      return false;
    } else {
      return true;
    }

    // currentBackPressTime = null;
  }

  void closeApp() {
    // 关闭应用程序
    var app = AppCloserFactory.create();
    app.closeApp();
  }
}
