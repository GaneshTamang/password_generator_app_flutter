String? emailValidation(String email) {
  if (email == "" || email.isEmpty) {
    return 'Empty please enter email';
  }
  if (!RegExp(r'^[a-zA-Z0-9.%+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(email)) {
    return "invalid email";
  }
  return null;
}

String? passwordValidation(String password) {
  if (password == "" || password.isEmpty) {
    return 'Empty please enter password';
  }
  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return 'Enter at least one capital letter';
  }
  if (!RegExp(r'[a-z]').hasMatch(password)) {
    return 'Enter at least one small letter';
  }
  if (!RegExp(r'[!#@$%*]').hasMatch(password)) {
    return 'Enter at least one symbol';
  }
  if (!RegExp(r'^.{8,}$').hasMatch(password)) {
    return 'Must be at least 8 characters';
  }
  if (!RegExp(r'^.{0,16}$').hasMatch(password)) {
    return 'Must be at most 16 characters';
  }
  return null;
}
