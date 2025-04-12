// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:password_generator_app/providers/form_literals_value.dart';
import 'package:provider/provider.dart';
// !generators

String generatePassword(
  final bool includeSmallLetters,
  final bool includeCapitals,
  final bool includeNumbers,
  final bool includeSymbols,
  final String passwordLength,
) {
  final integerValueLength = int.parse(passwordLength);
  const String lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numbers = '0123456789';
  const String symbols = '!@#\$%&()-_=+[]{}|,.<>?';

  String charPool = lowerCaseLetters;

  if (includeCapitals) {
    charPool += upperCaseLetters;
  }
  if (includeNumbers) {
    charPool += numbers;
  }
  if (includeSymbols) {
    charPool += symbols;
  }

  // if (charPool.isEmpty || passwordLength <= 0) {
  //   throw ArgumentError('Invalid password options or length');
  // }

  //*  instance created
  final Random random = Random();
// make array list join
  String generatePass = List.generate(integerValueLength,
      (index) => charPool[random.nextInt(charPool.length)]).join();
  return generatePass;
}

// !checkers

String? passwordLengthValidation(String inputLength) {
  int? changedInputInInt = int.tryParse(inputLength);

  if (inputLength.isEmpty) {
    return 'Empty?';
  }
  if (!RegExp(r'^\d+$').hasMatch(inputLength)) {
    return 'Invalid: Not a Number,please enter integer number';
  }

  if (changedInputInInt == null) {
    return 'null ';
  } else {
    if (changedInputInInt < 0) {
      return 'less than 0';
    }
    if (changedInputInInt < 8) {
      return 'less than 8 must be atleast 8 character length';
    }
    if (changedInputInInt > 16) {
      return 'must not be greater than 16 length characters';
    }
  }
  return null;
}

checkAndValidatePasswordLength(String passwordLength, BuildContext context) {
  String? errorcheck = passwordLengthValidation(passwordLength);

  final provider =
      Provider.of<FormLiteralsValuesProvider>(context, listen: false);

  if (errorcheck == null) {
    provider.changePasswordStatus(true, '', passwordLength);
  } else if (errorcheck == "Empty?") {
    provider.changePasswordStatus(false, '', '0');
  } else {
    provider.changePasswordStatus(false, errorcheck, passwordLength);
  }
}

checkAndCreatePassWord(BuildContext context) {
  final providerWatch =
      Provider.of<FormLiteralsValuesProvider>(context, listen: false);
  bool isPasswordStatusValid =
      providerWatch.getpasswordStatus['is_status_valid'] as bool;
  bool isPasswordGenerated =
      providerWatch.getpasswordStatus['is_password_generated'] as bool;
  Map<String, dynamic> passwordOptions = providerWatch.getPasswordOptions;

  if (!isPasswordGenerated) {
    if (isPasswordStatusValid) {
      String generatePass = generatePassword(
        passwordOptions['include_small_letters'],
        passwordOptions['include_capital_letters'],
        passwordOptions['include_symbols'],
        passwordOptions['include_numbers'],
        providerWatch.getPasswordLength,
      );
      providerWatch.setPassword(generatePass, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Inputs!')),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password already generated!')),
    );

  }
}
