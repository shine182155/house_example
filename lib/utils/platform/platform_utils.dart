import 'package:flutter/services.dart';

import 'package:flutter/services.dart';

import 'package:flutter/services.dart';

class PlatformExceptionWrapper implements Exception {
  final String message;
  final String? code;
  final dynamic details;
  final Object? original;

  PlatformExceptionWrapper({
    required this.message,
    this.code,
    this.details,
    this.original,
  });

  @override
  String toString() =>
      'PlatformExceptionWrapper: $message (code: $code, details: $details)';
}


class PlatformUtils {

  static const String _channelName = 'com.example.house_example';
  static final MethodChannel _channel = const MethodChannel(_channelName); // 静态

  static Future<T?> invokeMethod<T>({
    required String methodName,
    Map<String, dynamic>? arguments,
  }) async {
    try {
      return await _channel.invokeMethod<T>(methodName, arguments);
    } on PlatformException catch (e) {
      // 封装更详细的异常信息
      throw PlatformExceptionWrapper(
        message: e.message ?? '未知平台异常',
        code: e.code,
        details: e.details,
        original: e,
      );
    } catch (e) {
      throw PlatformExceptionWrapper(
        message: '未知错误: ${e.toString()}',
        original: e,
      );
    }
  }
}