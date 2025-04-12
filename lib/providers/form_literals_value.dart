// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

//public   type def
typedef PasswordSettingOptions = Map<String, bool>;

class FormLiteralsValuesProvider with ChangeNotifier {
  String _passwordLength = '0';

  final PasswordSettingOptions _passwordSetting = {
    "include_small_letters": true,
    "include_capital_letters": false,
    "include_numbers": false,
    "include_symbols": false,
  };
  final Map<String, Object> _passwordStatus = {
    "generated_password": "",
    "is_password_generated": false,
    "is_status_valid": false,
    "password_error": "",
  };

// ! getters
  String get getPasswordLength => _passwordLength;
  Map<String, Object> get getpasswordStatus => _passwordStatus;
  PasswordSettingOptions get getPasswordOptions => _passwordSetting;

// ! setters
  // void changeValue(String changeValue) {
  //   try {
  //     _passwordLength = int.parse(changeValue);

  //     _passwordStatus["password_error"] = "";
  //   } catch (e) {
  //     _passwordLength = 0; // Set a default value or handle the error gracefully
  //     _passwordStatus["password_error"] = "invalid value";
  //   }
  //   notifyListeners(); //notify and re render
  // }

  void changePasswordSetting(String passwordOptionsKey, bool keyValue) {
    //! check if contains key
    if (_passwordSetting.containsKey(passwordOptionsKey)) {
      // change value oppsite
      _passwordSetting[passwordOptionsKey] = keyValue;
      print('password set for check box as :$_passwordSetting');
      notifyListeners(); // Notify once after update
    }
  }

  // ! setters
  changePasswordStatus(
    bool isStatusValid,
    String passwordErrors,
    String passwordLength,
  ) {
    _passwordStatus["is_status_valid"] = isStatusValid;
    _passwordStatus["password_error"] = passwordErrors;
    _passwordLength = passwordLength;
    notifyListeners();
  }

  setPassword(
    String generatedPassword,
    bool isPasswordGenerated,
  ) {
    _passwordStatus["generated_password"] = generatedPassword;
    _passwordStatus["is_password_generated"] = isPasswordGenerated;
    notifyListeners();
  }

  resetPassword() {
    //status
    _passwordStatus["generated_password"] = "resetted pass";
    _passwordStatus["is_password_generated"] = false;
    _passwordStatus["is_status_valid"] = false;
    _passwordStatus["password_error"] = 'no errors after reset';
    //options
    _passwordSetting["include_small_letters"] = true;
    _passwordSetting["include_capital_letters"] = false;
    _passwordSetting["include_numbers"] = false;
    _passwordSetting["include_symbols"] = false;
    //passlength
    _passwordLength = "0";
    notifyListeners();
  }
}
