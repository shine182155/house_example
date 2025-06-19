import 'dart:io';
import 'package:flutter/services.dart';

import 'app_closer.dart';

class AndroidAppCloser implements AppCloser {
  @override
  void closeApp() {
    SystemNavigator.pop();
  }
}


