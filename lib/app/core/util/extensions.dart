import 'package:intl/intl.dart';

extension StringExt on String {
  String get numbersOnly => replaceAll(RegExp(r'[^0-9]'), '');
  String get convertPoint => replaceAll('.', ',');

  String get dateTimeString {
    DateTime parsedDate = DateTime.parse(this);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    String returnData = formatter.format(parsedDate);
    return returnData;
  }

  String get formattedTaxVat {
    final taxVatRegex = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');
    return numbersOnly.replaceFirstMapped(taxVatRegex,
        (match) => '${match[1]}.${match[2]}.${match[3]}-${match[4]}');
  }

  String get formattedCellphone {
    final cellphoneRegex = RegExp(r'^(\d{2})(\d{1})(\d{4})(\d{4})$');
    return replaceFirstMapped(cellphoneRegex,
        (match) => '(${match[1]}) ${match[2]} ${match[3]}-${match[4]}');
  }

  String get formattedCep {
    final cellphoneRegex = RegExp(r'^(\d{2})(\d{5})(\d{4})$');
    return numbersOnly.replaceFirstMapped(
        cellphoneRegex, (match) => '(${match[1]}) ${match[2]}-${match[3]}');
  }

  String get formattedCEP {
    final cepRegex = RegExp(r'^(\d{5})(\d{3})$');
    return replaceAllMapped(cepRegex, (match) => '${match[1]}-${match[2]}');
  }

  String get firstWord {
    return split(' ').firstWhere((word) => word.isNotEmpty, orElse: () => '');
  }

  bool equals(String x) => this == x;

  bool contaisUpperCase() => contains(RegExp(r'[A-Z]'));

  bool contaisLowerCase() => contains(RegExp(r'[a-z]'));

  bool contaisNumber() => contains(RegExp(r'[0-9]'));

  bool contaisSpecialCharacters() => contains(RegExp(r'[!@#\$&*~]'));

  bool contaisMinLength(int minlength) => length >= minlength;
}
