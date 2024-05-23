import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/app/core/util/validator.dart';

class TaxVatInputFormatter extends CompoundableFormatter {
  TaxVatInputFormatter({this.controller});

  TextEditingController? controller;
  @override
  int get maxLength => 14;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength) return oldValue;

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValue.text.length >= 4) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 3)}.');
      if (newValue.selection.end >= 3) posicaoCursor++;
    }
    if (newValue.text.length >= 7) {
      valorFinal.write('${newValue.text.substring(3, substrIndex = 6)}.');
      if (newValue.selection.end >= 6) posicaoCursor++;
    }
    if (newValue.text.length >= 10) {
      valorFinal.write('${newValue.text.substring(6, substrIndex = 9)}-');
      if (newValue.selection.end >= 9) posicaoCursor++;
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
  String get hint => '000.000.000-00';

  @override
  String get label => AppStrings.cpfLabel;

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateTaxVat(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);
}

class RgInputFormatter extends CompoundableFormatter {
  RgInputFormatter({this.controller});

  TextEditingController? controller;
  @override
  int get maxLength => 10;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > maxLength) return oldValue;

    var posicaoCursor = newValue.selection.end;
    var substrIndex = 0;
    final valorFinal = StringBuffer();

    if (newValue.text.length >= 4) {
      valorFinal.write('${newValue.text.substring(0, substrIndex = 3)}.');
      if (newValue.selection.end >= 3) posicaoCursor++;
    }
    if (newValue.text.length >= 7) {
      valorFinal.write('${newValue.text.substring(3, substrIndex = 6)}.');
      if (newValue.selection.end >= 6) posicaoCursor++;
    }
    if (newValue.text.length >= 10) {
      valorFinal.write('${newValue.text.substring(6, substrIndex = 9)}-');
      if (newValue.selection.end >= 9) posicaoCursor++;
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
  String get hint => '00.000-000';

  @override
  String get label => 'RG';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateTaxVat(value);

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '##.###-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);
}

class CnpjInputFormatter extends CompoundableFormatter {
  CnpjInputFormatter({this.controller});

  TextEditingController? controller;
  @override
  int get maxLength => 18;

  @override
  String get hint => '00.000.000/0000-00';

  @override
  String get label => 'CNPJ';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.number;

  @override
  String? Function(String? value)? get validator => (value) => null;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      mask: '##.###.###/####-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: controller?.text);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    throw UnimplementedError();
  }
}
