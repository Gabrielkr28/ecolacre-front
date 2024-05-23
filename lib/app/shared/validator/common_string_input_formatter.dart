// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/validator.dart';

import '../../core/util/compoundable_formatter.dart';

class CommonStringInputFormatter implements CompoundableFormatter {
  final String labelTitle;
  final String labelTipFormated;
  late int? maxLengthField = 100;
  late String hintText;
  TextInputType? customTextInputType;
  TextEditingController? controller;

  CommonStringInputFormatter({
    required this.labelTitle,
    this.labelTipFormated = '',
    this.maxLengthField,
    this.hintText = AppStrings.typeHere,
    this.customTextInputType,
    this.controller,
  });
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;
  @override
  String get hint => hintText;
  @override
  String get labelTip => labelTipFormated;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      selection: TextSelection.collapsed(offset: newValue.text.length),
    );
  }

  @override
  String get label => labelTitle;

  @override
  TextInputType get textInputType => customTextInputType ?? TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateString(value);

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter => MaskTextInputFormatter(
        initialText: controller?.text,
      );
}
