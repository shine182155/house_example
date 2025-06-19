import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:house_example/privacy_authorization_dialog/privacy_agreement_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route/route_config.dart';
import '../umeng/umeng_helper.dart';
import '../utils/shared_preferences/prefs_keys.dart';
import '../utils/shared_preferences/prefs_utils.dart';

const platform = MethodChannel('com.example.app');

class PrivacyAuthorizationDialogLogic extends GetxController {
  void navigateToMainScreen() {
    Get.offNamed(RouteGet.loadingPage);
  }

  Future<void> initUmengSDK() async {
    // UmengCommonSdk.preInit();

    // 1.  设置隐私授权状态
    try {
      await platform.invokeMethod('setUmengPrivacy', {'isAgreed': true});
      print('友盟隐私授权状态设置成功');
    } catch (e) {
      print('友盟隐私授权状态设置失败: $e');
      return; //  如果设置失败，直接返回
    }

    // 2.  初始化友盟 SDK (正确的初始化方式)
    //  注意：UmengCommonSdk 没有 preInit 方法
    // Future.delayed(Duration(milliseconds: 100), () {
    //   UmengCommonSdk.initCommon(
    //     '68340e64bc47b67d83727fae',
    //     '68355b44bc47b67d83738075',
    //     'HUAWEI',
    //   ); // 替换为你的appkey
    // });
  }

  Future<void> initializeAndNavigate() async {
    await UmengHelper.agree(); // 每次启动都
    _navigateToHomeScreen();
  }


  ///导航到 LoadingPage
  void _navigateToHomeScreen() {
    Get.offNamed(RouteGet.loadingPage); // 使用GetX导航到主界面
  }

  Future<void> showPrivacyAgreementDialog() async {
    await Get.dialog(
      PrivacyAgreementDialog(
        onAgreed: _handlePrivacyAgreed,
        onDisagreed: SystemNavigator.pop,
      ),
      barrierDismissible: false,
    );
  }

  void _handlePrivacyAgreed() async {
    // 同意隐私协议后，设置本地存储的同意状态
    await PrefsUtils.setBool(key: PrefsKeys.PRIVACY_KEY, value: true);
    await UmengHelper.agree();
    // await UmengHelper.initUmeng();

    // 初始化成功后，导航到主界面
    _navigateToHomeScreen();
  }

  // void showInitializationError() {
  //   showDialog(
  //     context: context,
  //     builder:
  //         (context) => AlertDialog(
  //       title: Text('初始化失败'),
  //       content: Text('友盟SDK初始化失败，应用功能可能受限'),
  //       actions: [
  //         TextButton(
  //           child: Text('继续'),
  //           onPressed: () {
  //             Navigator.pop(context);
  //             _navigateToHomeScreen();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
