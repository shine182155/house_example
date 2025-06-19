
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_profile/pages/user_login/user_login_state.dart';
import 'package:house_example/utils/common_utils.dart';

import '../user_login/user_login_logic.dart';

class UserSetting extends StatelessWidget {
   UserSetting({super.key});
  final UserLoginLogic _logic = Get.find<UserLoginLogic>();
  final UserLoginState _state = Get.find<UserLoginLogic>().state;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('设置'),
      ),
      body: _buildBody(_state, context),
    );
  }

  Widget _buildBody(UserLoginState state, BuildContext context) {
    if (state.isLogin) {
      return _buildLoggedIn(context, state);
    } else {
      return _buildNotLoggedIn(context);
    }
  }

  Container _buildNotLoggedIn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: _logic.closeApp,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.teal[400]),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          ),
          // WidgetStateProperty.all<RoundedRectangleBorder>(
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(0.0),
          //   ),
          // )
        ),
        child: const Text('退出APP'),
      ),
    );
  }

  Column _buildLoggedIn(BuildContext context, UserLoginState state) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ElevatedButton(
            onPressed: _logic.logoutAndReturnToHome,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.teal[400]),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
            ),
            child: const Text('退出登录'),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ElevatedButton(
            onPressed: _logic.closeApp,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.teal[400]),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),

              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              // WidgetStateProperty.all<RoundedRectangleBorder>(
              //   RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(0.0),
              //   ),
              // )
            ),
            child: const Text('退出APP'),
          ),
        ),
      ],
    );
  }

  // void _exitApp() {
  //   if (Platform.isIOS) {
  //     exit(0);
  //   }
  //
  //   if (Platform.isAndroid) {
  //     SystemNavigator.pop();
  //   }
  // }
}
