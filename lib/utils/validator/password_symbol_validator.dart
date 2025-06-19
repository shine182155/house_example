import 'field_validator.dart';

class PasswordSymbolValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || !RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return '密码必须包含至少一个特殊字符';
    }
    return null;
  }
}
