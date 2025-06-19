import 'dart:io';

import 'app_closer.dart';

class IOSAppCloser implements AppCloser {
  @override
  void closeApp() {
    exit(0);
  }
}
