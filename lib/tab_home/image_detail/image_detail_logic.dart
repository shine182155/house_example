import 'package:get/get.dart';

import 'image_detail_state.dart';

class ImageDetailLogic extends GetxController {
  final ImageDetailState state = ImageDetailState();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.infoItem =  Get.arguments;

  }
  void onBack() {
    Get.back();
  }
}
