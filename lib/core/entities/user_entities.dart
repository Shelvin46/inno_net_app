class UserEntities {
  // validate password

  String? validatePassword(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    }
    if (value.length < 8) {
      return 'Password does not meet the criteria';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password does not meet the criteria';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password does not meet the criteria';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password does not meet the criteria';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password does not meet the criteria';
    }
    return null;
  }

  //validate email
  String? isValidEmail(String? value) {
    value = value?.trim();
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value ?? '')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // validate name
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your name';
    }
    return null;
  }
}
