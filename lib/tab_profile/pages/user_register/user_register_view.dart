import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_register_logic.dart';
import 'user_register_state.dart';

class UserRegisterPage extends StatelessWidget {
  UserRegisterPage({super.key});

  final UserRegisterLogic _logic = Get.put(UserRegisterLogic());
  final UserRegisterState _state = Get.find<UserRegisterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      body: _buildBody(context),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(padding: EdgeInsets.all(20), child: _buildForm(context));
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _state.globalKey,
      child: Column(
        children: [
          _buildUserAccount(),
          const Padding(padding: EdgeInsets.all(5)),
          _buildUserPassword(),
          const Padding(padding: EdgeInsets.all(5)),
          const Padding(padding: EdgeInsets.all(10)),
          _buildSizedBox(context),
        ],
      ),
    );
  }

  SizedBox _buildSizedBox(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _logic.handlerRegister,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Theme.of(context).primaryColor,
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
        child: const Text('注册'),
      ),
    );
  }

  TextFormField _buildUserPassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (val) => _logic.validateUserPassword(val),
      decoration: const InputDecoration(
        label: Text('密码'),
        hintText: '请输入密码',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2.0),
        ),
      ),
    );
  }

  TextFormField _buildUserAccount() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (val) => _logic.validateUserAccount(val),
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2.0),
        ),

        label: Text('用户名'),
        hintText: '请输入用户名',
      ),
    );
  }
}
