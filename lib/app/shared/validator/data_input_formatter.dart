import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/validator.dart';

import '../../core/util/compoundable_formatter.dart';

class DataInputFormatter implements CompoundableFormatter {
  TextEditingController? controller;

  DataInputFormatter({this.controller});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 8) return oldValue;

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValue.text.length >= 3) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 2)}/');
      if (newValue.selection.end >= 2) posicaoCursor++;
    }
    if (newValue.text.length >= 5) {
      valorFinal.write('${newValue.text.substring(2, substrIndex = 4)}/');
      if (newValue.selection.end >= 4) posicaoCursor++;
    }
    if (newValue.text.length >= substrIndex) {
      valorFinal.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: valorFinal.toString(),
      selection: TextSelection.collapsed(offset: posicaoCursor),
    );
  }

  @override
  String get hint => '00/00/0000';

  @override
  String get label => AppStrings.dateOfBirth;

  @override
  String get labelTip => '';

  @override
  int? get maxLength => null;

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateDate(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  Iterable<String>? get autofillHints => null;
}
