import 'field_validator.dart';

class UserAccountValidator implements FieldValidator {
  @override
  String? validate(String? value) {
    RegExp regExp = RegExp(r'^\d{11}$');
    if (!regExp.hasMatch(value!)) {
      return '手机号非法或长度不够11位';
    }
    return null;
  }
}
