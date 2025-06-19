
import 'field_validator.dart';

class PasswordLengthValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.length < 6) {
      return '密码安全系数不够,长度必须大于6位';
    }
    return null;
  }
}
