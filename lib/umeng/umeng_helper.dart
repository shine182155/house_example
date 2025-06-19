import 'package:http/http.dart' as http;

import '../utils/platform/platform_utils.dart';
import '../utils/validator/platform_method_names.dart';

class UmengHelper {
  /// 用户已经在界面点击授权 需跳转到原生代码执行授权代码
  static Future<void> agree() async {
    try {
      final data = await PlatformUtils.invokeMethod(
        methodName: PlatformMethodNames.set_umeng_privacy,
        arguments: {'isAgreed': true},
      );
    } catch (e) {
      /// 如果需要上传日志  则将错误日志到远程服务器
      RemoteLogger.uploadLog('友盟隐私授权状态设置失败: $e');

      print(' $e');
    }
  }
}

class RemoteLogger {
  static Future<void> uploadLog(String message) async {
    await http.post(
      Uri.parse('https://your-server.com/api/log'),
      body: {'log': message},
    );
  }
}
