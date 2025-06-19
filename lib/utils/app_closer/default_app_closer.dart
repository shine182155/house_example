import 'app_closer.dart';

class DefaultAppCloser implements AppCloser {
  @override
  void closeApp() {
    print('不支持的操作系统，无法关闭应用');
  }
}
