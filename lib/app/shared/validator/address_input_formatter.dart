import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/app/core/util/validator.dart';

import '../../core/util/app_strings.dart';

class AddressInputFormatter extends CompoundableFormatter {
  @override
  int? get maxLength => null;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText =
        newValue.text.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ0-9 ]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get labelTip => '';

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.addressLabelsingular;

  @override
  TextInputType get textInputType => TextInputType.text;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-Z ]')}, type: MaskAutoCompletionType.lazy);
}

class NeighborhoodInputFormatter implements CompoundableFormatter {
  @override
  int? get maxLength => null;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get labelTip => '';

  @override
  String get label => AppStrings.neighborhoodLabel;

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-Z ]')}, type: MaskAutoCompletionType.lazy);

  @override
  Iterable<String>? get autofillHints => null;
}

class CityInputFormatter implements CompoundableFormatter {
  @override
  int? get maxLength => null;
  @override
  Iterable<String>? get autofillHints => null;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z ]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.cityLabel;

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-zA-Z ]')}, type: MaskAutoCompletionType.lazy);
}

class StateInputFormatter implements CompoundableFormatter {
  @override
  int get maxLength => 11;
  @override
  Iterable<String>? get autofillHints => null;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z ]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.stateLabel;

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
      filter: {"#": RegExp(r'[^a-z]')}, type: MaskAutoCompletionType.lazy);
}

class NumberInputFormatter implements CompoundableFormatter {
  @override
  int get maxLength => 5;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.numberLabel;

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType =>
      const TextInputType.numberWithOptions(decimal: true, signed: true);

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.deny(
        RegExp(r'^0+'),
      );

  @override
  Iterable<String>? get autofillHints => null;
}

class QtdPessoasInputFormatter implements CompoundableFormatter {
  @override
  int get maxLength => 5;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => 'Quantas pessoas vivem na casa';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType =>
      const TextInputType.numberWithOptions(decimal: true, signed: true);

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.deny(
        RegExp(r'^0+'),
      );

  @override
  Iterable<String>? get autofillHints => null;
}

class RendaInputFormatter implements CompoundableFormatter {
  @override
  int get maxLength => 5;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => 'Renda familiar média';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType =>
      const TextInputType.numberWithOptions(decimal: true, signed: true);

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateAddress(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => FilteringTextInputFormatter.deny(
        RegExp(r'^0+'),
      );

  @override
  Iterable<String>? get autofillHints => null;
}

class ComplementInputFormatter implements CompoundableFormatter {
  ComplementInputFormatter({this.labelTipFormated = '(opcional)'});

  @override
  int? get maxLength => null;
  final String labelTipFormated;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      selection: TextSelection.collapsed(offset: newValue.text.length),
    );
  }

  @override
  String get hint => AppStrings.typeHere;

  @override
  String get label => AppStrings.complementLabel;

  @override
  String get labelTip => labelTipFormated;

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator => (value) => null;

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
        filter: {"#": RegExp(r'[^a-zA-ZÀ-ÿ0-9 ]')},
        type: MaskAutoCompletionType.lazy,
      );
  @override
  Iterable<String>? get autofillHints => null;
}
