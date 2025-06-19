import 'dart:io';

import 'android_app_closer.dart';
import 'app_closer.dart';
import 'default_app_closer.dart';
import 'ios_app_closer.dart';

class AppCloserFactory {
  static AppCloser create() {
    if (Platform.isAndroid) {
      return AndroidAppCloser();
    } else if (Platform.isIOS) {
      return IOSAppCloser();
    } else {
      return DefaultAppCloser();
    }
  }
}

