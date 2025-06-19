import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_example/tab_profile/tab_profile_logic.dart';

import '../../pages/user_login/user_login_logic.dart';

TextStyle loginRegisterTextStyle = TextStyle(color: Colors.white, fontSize: 18.sp);
String loginImg =
    'https://tva1.sinaimg.cn/large/008i3skNgy1gsuhtensa6j30lk0li76f.jpg';
String unLoginImg =
    'https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg';

class Header extends StatefulWidget {
  // final bool isLogin;
   Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {



  final TabProfileLogic _tabProfileLogic = Get.find<TabProfileLogic>();
  final UserLoginLogic _userLoginLogic = Get.put(UserLoginLogic());


  @override
  Widget build(BuildContext context) {


    final isLogin = _userLoginLogic.state.isLogin;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
  Container _notLoginBuilder(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      height: 75.h,
      decoration: BoxDecoration(color: Theme
          .of(context)
          .primaryColor),
      child: Row(
        children:  [
          CircleAvatar(radius: 30.r, backgroundImage: NetworkImage(unLoginImg)),
           Padding(padding: EdgeInsets.only(left: 10.w)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: _tabProfileLogic.navigateToUserLogin,
                    child: Text('登陆/', style: loginRegisterTextStyle),
                  ),
                  GestureDetector(
                    onTap:
                    _tabProfileLogic.navigateToUserRegister,
                    child: Text('注册', style: loginRegisterTextStyle),
                  ),
                ],
              ),
              const Text('登录后体验', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
  Container _loginBuilder(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 75,
      decoration: BoxDecoration(color: Theme
          .of(context)
          .primaryColor),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(loginImg)),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('已经登录', style: loginRegisterTextStyle),
              const Text(
                  '登录后体验更多功能', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}






