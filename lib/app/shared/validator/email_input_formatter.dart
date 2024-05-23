import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/app/core/util/validator.dart';

class EmailInputFormatter extends CompoundableFormatter {
  @override
  String hint = AppStrings.emailExample;
  @override
  String label = AppStrings.emailTitle;
  @override
  String get labelTip => '';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var posicaoCursor = newValue.selection.end;

    if (newValue.text.length > 50) {
      return oldValue;
    }

    final valorFinal = StringBuffer();

    valorFinal.write(newValue.text);

    return TextEditingValue(
      text: valorFinal.toString(),
      selection: TextSelection.collapsed(offset: posicaoCursor),
    );
  }

  @override
  int? get maxLength => null;

  @override
  TextInputType get textInputType => TextInputType.emailAddress;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateEmail(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-ZÀ-ÿ ]')},
      type: MaskAutoCompletionType.lazy);
}
