import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/app/core/util/validator.dart';

class CepInputFormatter extends CompoundableFormatter {
  TextEditingController? controller;

  CepInputFormatter({this.controller});
  @override
  String hint = '00000-000';
  @override
  String label = AppStrings.cepLabel;
  @override
  String get labelTip => '';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String sanitizedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (sanitizedText.length > 8) {
      return oldValue;
    }

    final formattedValue = StringBuffer();

    if (sanitizedText.length > 5) {
      formattedValue.write('${sanitizedText.substring(0, 5)}-');
    } else {
      formattedValue.write(sanitizedText);
    }

    if (sanitizedText.length > 5) {
      formattedValue.write(sanitizedText.substring(5));
    }

    return TextEditingValue(
        text: formattedValue.toString(),
        selection: TextSelection.collapsed(offset: formattedValue.length));
  }

  @override
  int? get maxLength => null;

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateCEP(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
        mask: '#####-###',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy,
        initialText: controller?.text,
      );
}
