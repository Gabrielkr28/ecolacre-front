import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/app/core/util/validator.dart';

class PhoneInputFormatter extends CompoundableFormatter {
  TextEditingController? controller;

  PhoneInputFormatter({this.controller});
  @override
  String hint = '(00) 0 0000 - 0000';
  @override
  String label = AppStrings.cellPhoneLabel;
  @override
  String get labelTip => '';
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 11) return oldValue;

    final newValueLength = newValue.text.length;
    if (newValueLength == 11) {
      if (newValue.text.toString()[2] != '9') {
        return oldValue;
      }
    }

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValueLength >= 1) {
      valorFinal.write('(');
      if (newValue.selection.end >= 1) posicaoCursor++;
    }

    if (newValueLength >= 3) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 2)}) ');
      if (newValue.selection.end >= 2) posicaoCursor += 2;
    }

    if (newValue.text.length == 11) {
      if (newValueLength >= 8) {
        valorFinal.write('${newValue.text.substring(2, substrIndex = 7)}-');
        if (newValue.selection.end >= 7) posicaoCursor++;
      }
    } else {
      if (newValueLength >= 7) {
        valorFinal.write('${newValue.text.substring(2, substrIndex = 6)}-');
        if (newValue.selection.end >= 6) posicaoCursor++;
      }
    }

    if (newValueLength >= substrIndex) {
      valorFinal.write(newValue.text.substring(substrIndex));
    }

    return TextEditingValue(
      text: valorFinal.toString(),
      selection: TextSelection.collapsed(offset: posicaoCursor),
    );
  }

  @override
  int? get maxLength => null;

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validatePhoneNumber(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);
}
