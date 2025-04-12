import 'package:flutter/widgets.dart';

class PasswordStatusProvider with ChangeNotifier {
  final Map<String, Object> _passwordStatus = {
    "generated_password ": "",
    "is_password_generated": false,
    "is_valid": false,
    "error": ""
  };
  Map<String, Object> get getpasswordStatus => _passwordStatus;
}
