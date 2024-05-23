import 'package:intl/intl.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/core/util/extensions.dart';

class TextFormValidator {
  static String? validateName(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryNameField;
    }

    // List<String> words = value.split(RegExp(r'\s+'));
    // if (words.length < 2) {
    //   return ValidatorErrorStrings.mandatoryCompleteNameField;
    // }

    final hasNumbers = value.contains(RegExp(r'[0-9]'));
    if (hasNumbers) {
      return ValidatorErrorStrings.containNumberError;
    }

    return null;
  }

  static String? validateSegmento(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu segmento';
    }

    // List<String> words = value.split(RegExp(r'\s+'));
    // if (words.length < 2) {
    //   return ValidatorErrorStrings.mandatoryCompleteNameField;
    // }

    final hasNumbers = value.contains(RegExp(r'[0-9]'));
    if (hasNumbers) {
      return ValidatorErrorStrings.containNumberError;
    }

    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.nullError;
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryPhoneField;
    }
    final cleanedPhone = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedPhone.length < 11) {
      return ValidatorErrorStrings.phoneFieldLengthError;
    }

    return null;
  }

  static String? validateQtdCadeira(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a quantidade de cadeiras';
    }

    return null;
  }

  static String? validateQtdColaboradores(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a quantidade de colaboradores';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryEmailField;
    }

    // Use uma expressão regular simples para verificar se o formato do e-mail é válido
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    if (!emailRegex.hasMatch(value)) {
      return ValidatorErrorStrings.emailInvalidError;
    }

    return null;
  }

  static String? validateCEP(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryCepField;
    }

    String sanitizedCEP = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (sanitizedCEP.length != 8) {
      return ValidatorErrorStrings.cepLengthError;
    }

    return null;
  }

  static String? validateDate(String? date) {
    if (date == null || date.isEmpty) {
      return ValidatorErrorStrings.mandatoryData;
    }

    final datePattern = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!datePattern.hasMatch(date)) {
      return ValidatorErrorStrings.dataInvalid;
    }

    final parts = date.split('/');
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    if (day == null || month == null || year == null) {
      return ValidatorErrorStrings.dataInvalid;
    }

    if (month < 1 || month > 12) {
      return ValidatorErrorStrings.dataInvalid;
    }

    if (day < 1 || day > 31) {
      return ValidatorErrorStrings.dataInvalid;
    }

    if (year < 1900 || year > 2100) {
      return ValidatorErrorStrings.dataInvalid;
    }

    final now = DateTime.now();
    final dateParts = date.split('/');
    final year1 = int.parse(dateParts[2]);
    final month1 = int.parse(dateParts[1]);
    final day1 = int.parse(dateParts[0]);
    final submittedDate = DateTime(year1, month1, day1);

    if (submittedDate.isAfter(now)) {
      return ValidatorErrorStrings.dataInvalid;
    }

    String dateFormat = "dd/MM/yyyy";
    try {
      DateFormat(dateFormat).parseStrict(date);
    } on Exception {
      return ValidatorErrorStrings.dataInvalid;
    }

    return null;
  }

  static String? validateTaxVat(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        final cleanedTaxVat = value.replaceAll(RegExp(r'[^0-9]'), '');

        if (RegExp(r'^(\d)\1+$').hasMatch(cleanedTaxVat)) {
          return '';
        }
        if (cleanedTaxVat.length == 11) {
          String numbers = value.numbersOnly.substring(0, 9);
          numbers += _verifierDigit(numbers).toString();
          numbers += _verifierDigit(numbers).toString();

          if (numbers.substring(numbers.length - 2) !=
              value.substring(value.length - 2)) {
            return '';
          }
        }

        return null;
      }
    }
    return null;
  }

  static String? validateCnpj(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        final cleanedTaxVat = value.replaceAll(RegExp(r'[^0-9]'), '');
        if (RegExp(r'^(\d)\1+$').hasMatch(cleanedTaxVat)) {
          return '';
        }
        if (cleanedTaxVat.length < 14) {
          return '';
        }

        return null;
      }
    }
    return null;
  }

  static int _verifierDigit(String taxVat) {
    List<int> numbers =
        taxVat.split("").map((number) => int.parse(number, radix: 10)).toList();

    int modulus = numbers.length + 1;

    List<int> multiplied = [];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  static int _verifierDigit2(String taxVat) {
    List<int> numbers =
        taxVat.split("").map((number) => int.parse(number, radix: 10)).toList();

    int modulus = numbers.length + 1;

    List<int> multiplied = [];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    int mod = multiplied.reduce((buffer, number) => buffer + number) % 14;

    return (mod < 2 ? 0 : 11 - mod);
  }

  static String? validatePasswordLogin(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryPasswordField;
    }
    if (value.length < 8) {
      return ValidatorErrorStrings.passwordLengthError;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return ValidatorErrorStrings.mandatoryPasswordField;
    }

    if (value.length < 8) {
      return ValidatorErrorStrings.passwordLengthError;
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return ValidatorErrorStrings.uppercaseLetterError;
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return ValidatorErrorStrings.lowercaseLetterError;
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return ValidatorErrorStrings.numberError;
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return ValidatorErrorStrings.specialCharacterError;
    }

    return null;
  }

  static bool validatePasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static String? validateString(String? value) {
    if (value == null) {
      return ValidatorErrorStrings.mandatoryNullField;
    }

    return null;
  }
}
