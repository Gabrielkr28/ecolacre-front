import 'package:flutter/services.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/compoundable_formatter.dart';
import 'package:project/app/core/util/validator.dart';

class NameInputFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => AppStrings.completeNameLabel;

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateName(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}

class MotivoCadeiraFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => 'Motivo da cadeira';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateName(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}

class EnderecoInputFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => 'Endereco';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateName(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}

class SegmentoInputFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => 'Segmento instituição';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateSegmento(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}

class CidadeInputFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => 'Cidade';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateName(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}

class QtdColaboradoresInputFormatter implements CompoundableFormatter {
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
  String get label => 'Quantidade Colaboradores:';

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

class UsoCadeiraInputFormatter implements CompoundableFormatter {
  @override
  int get maxLength => 200;

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
  String get label => 'Emprestimo ou instituiçao?';

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

class ModeloCadeiraInputFormatter implements CompoundableFormatter {
  @override
  int get maxLength => 300;

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
  String get label => 'Modelo da cadeira de rodas';

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

class QuantidadeCadeirasInputFormatter implements CompoundableFormatter {
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
  String get label => 'Quantidade cadeiras:';

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

class IncentivoFinanceiroInputFormatter implements CompoundableFormatter {
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
  String get label => 'Recebe algum incentivo financeiro';

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

class RazaoSocialFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => 'Razao social';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateName(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}

class NomeFantasiaFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => 'Nome fantasia';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateName(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}

class CNPJFormatter implements CompoundableFormatter {
  @override
  Iterable<String>? get autofillHints => null;
  @override
  int? get maxLength => null;

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
  String get label => 'CNPJ da instituição';

  @override
  String get labelTip => '';

  @override
  TextInputType get textInputType => TextInputType.name;

  @override
  String? Function(String? value)? get validator =>
      (value) => TextFormValidator.validateName(
            value,
          );

  @override
  bool get obscure => false;

  @override
  TextInputFormatter get inputFormatter =>
      FilteringTextInputFormatter.allow(RegExp("[a-z A-ZÀ-ÿ]"));
}
