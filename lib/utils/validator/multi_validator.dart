import 'field_validator.dart';

class MultiValidator implements FieldValidator {
  final List<FieldValidator> validators;

  MultiValidator(this.validators);

  @override
  String? validate(String? value) {
    for (var validator in validators) {
      final result = validator.validate(value);
      if (result != null) return result; // 返回第一个出错信息
    }
    return null;
  }
}
