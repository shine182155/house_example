import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/privacy_authorization_dialog/privacy_authorization_dialog_logic.dart';

import '../utils/shared_preferences/prefs_keys.dart';
import '../utils/shared_preferences/prefs_utils.dart';

class PrivacyAuthorizationDialogPage extends StatefulWidget {
  @override
  _PrivacyAuthorizationDialogPageState createState() =>
      _PrivacyAuthorizationDialogPageState();
}

class _PrivacyAuthorizationDialogPageState
    extends State<PrivacyAuthorizationDialogPage> {
  final _logic = Get.put(PrivacyAuthorizationDialogLogic());


  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  void initState() {
    super.initState();

    // 确保在应用启动时检查隐私协议
    _checkPrivacyAgreement();
  }

  Future<void> _checkPrivacyAgreement() async {
    // 检查本地存储的隐私协议同意状态
    final agreed =
        await PrefsUtils.getBool(key: PrefsKeys.PRIVACY_KEY) ?? false;

    // 如果已同意隐私协议，直接初始化并导航到主界面
    if (agreed) {
      //本地存储的隐私协议同意状态   跳转主界面
      _logic.initializeAndNavigate();
    } else {
      _logic.showPrivacyAgreementDialog();
    }
  }


}
