// ignore_for_file: avoid_print

import 'dart:math';

class PasswordGenerator {
  final bool includeNumbers;
  final bool includeCapitals;
  final bool includeSymbols;
  final int length;

  PasswordGenerator({
    required this.includeNumbers,
    required this.includeCapitals,
    required this.includeSymbols,
    required this.length,
  });

  String generatePassword() {
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

    if (charPool.isEmpty || length <= 0) {
      throw ArgumentError('Invalid password options or length');
    }

    final random = Random();

    return List.generate(
        length, (index) => charPool[random.nextInt(charPool.length)]).join();
  }

  gnp(int length) {
    length = 8;
    String password = "";
    String name = "Ganesh";
    for (int i = 0; i < length; i++) {
      print('===startgen==');
      var random = Random();

      String generated = name[random.nextInt(name.length - 1)];
      print(generated);
      password += generated;
      print('==current==');
      print('passwordgen=$password\n\n');
    }

    print("====generating random ====");

    print(password);
  }
}
