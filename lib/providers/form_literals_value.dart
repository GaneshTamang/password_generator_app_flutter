// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

//public   type def
typedef PasswordSettingOptions = Map<String, bool>;

class FormLiteralsValues with ChangeNotifier {
  int _passwordLength = 0;

  final PasswordSettingOptions _passwordSetting = {
    "include-small-letters": true,
    "include-capital-letters": false,
    "include-numbers": false,
    "include-symbols": false,
  };

//! getters
  int get getPasswordLength => _passwordLength;

  PasswordSettingOptions get getPasswordOptions => _passwordSetting;

// ! setters
  void changeValue(String changeValue) {
    try {
      _passwordLength = int.parse(changeValue);
    } catch (e) {
      _passwordLength = 0; // Set a default value or handle the error gracefully
    }
    notifyListeners(); //notify and re render
  }

  void changePasswordSetting(String passwordOptionsKey, bool keyValue) {
    //! check if contains key
    if (_passwordSetting.containsKey(passwordOptionsKey)) {
      // change value oppsite
      _passwordSetting[passwordOptionsKey] = keyValue;
      print('password set for check box as :$_passwordSetting');
      notifyListeners(); // Notify once after update
    }
  }
}
