import 'dart:async';

import 'package:get/get.dart';

import '../route/route_config.dart';
import 'loading_state.dart';

class LoadingLogic extends GetxController {
  final LoadingState state = LoadingState();

  void startTimer() {
    const oneSec = const Duration(seconds: 1);

    Timer.periodic(oneSec, (Timer timer) {
      if (state.remainingTime <= 1) {
        timer.cancel();
        navigateHomaPage();
      } else {
        state.remainingTime--;
        update();
      }
    });
  }

  navigateHomaPage() => Get.offNamed(RouteGet.home);

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
}
