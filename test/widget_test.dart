// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:house_example/utils/validator/user_account_validator.dart';
import 'package:house_example/utils/validator/password_length_validator.dart';

void main() {
  group('UserAccountValidator', () {
    final validator = UserAccountValidator();

    test('手机号为11位数字时通过', () {
      expect(validator.validate('13812345678'), null);
    });

    test('手机号不足11位时不通过', () {
      expect(validator.validate('1381234'), isNotNull);
    });


  });

  group('PasswordLengthValidator', () {
    final validator = PasswordLengthValidator();

    test('密码长度大于6位时通过', () {
      expect(validator.validate('abcdefg'), null);
    });


    test('密码长度小于6位时不通过', () {
      expect(validator.validate('12345'), isNotNull);
    });

    test('密码为null时不通过', () {
      expect(validator.validate(null), isNotNull);
    });
  });
}