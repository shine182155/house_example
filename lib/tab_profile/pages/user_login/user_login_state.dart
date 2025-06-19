
import 'package:flutter/material.dart' ;

class UserLoginState {
  late final GlobalKey<FormState> globalKey;
  bool isLogin = false;
  UserLoginState() {
    ///Initialize variables
    globalKey = GlobalKey<FormState>();
  }
}
