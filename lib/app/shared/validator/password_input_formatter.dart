import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/app/core/util/validator.dart';

class PasswordInputFormatter extends CompoundableFormatter {
  TextEditingController? controller;
  @override
  int? get maxLength => null;

  PasswordInputFormatter(
      {required this.isLogin,
      required this.isConfirmPassword,
      this.isnew = false,
      this.controller});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text);
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => isnew
      ? isConfirmPassword
          ? AppStrings.newpasswordConfirmLabel
          : AppStrings.newpasswordLabel
      : isConfirmPassword
          ? AppStrings.passwordConfirmLabel
          : AppStrings.passwordLabel;

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.visiblePassword;

  final bool isLogin;
  final bool isConfirmPassword;
  final bool isnew;
  @override
  String? Function(String? value)? get validator =>
      !isLogin ? (value) => TextFormValidator.validatePassword(value) : null;

  @override
  bool get obscure => true;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      type: MaskAutoCompletionType.lazy, initialText: controller?.text);

  @override
  Iterable<String>? get autofillHints => [AutofillHints.oneTimeCode];
}
