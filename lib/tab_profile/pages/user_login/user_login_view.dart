import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_login_logic.dart';
import 'user_login_state.dart';

class UserLoginPage extends StatelessWidget {
  UserLoginPage({Key? key}) : super(key: key);

  final UserLoginLogic _logic = Get.find<UserLoginLogic>();
  final UserLoginState _state = Get.find<UserLoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _state.globalKey,
          child: Column(
            children: [
              TextFormField(
                cursorColor:Theme.of(context).primaryColor ,

                keyboardType: TextInputType.phone,
                validator: (val) => _logic.validateUserAccount(val),
                decoration: InputDecoration(
                  label: Text('用户名'),
                  hintText: '请输入用户名', focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal,width: 2.0,))

                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              TextFormField(
                cursorColor:Theme.of(context).primaryColor ,
                obscureText: true,
                validator: (val) => _logic.validateUserPassword(val),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal,width: 2,)),
                  label: Text('密码'),
                  hintText: '请输入密码',
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _logic.handlerRegister,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: const Text('登录'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('还没有账号?'),
                  TextButton(
                    onPressed: _logic.jumpToUserRegisterPage,
                    child: Text(
                      '去注册',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
