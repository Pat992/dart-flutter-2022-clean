String? passwordValidator(String? input) {
  if (input == null || input.isEmpty) {
    return 'Please enter a Password';
  } else if (input.length >= 6) {
    return null;
  }
  return 'Please enter a Password with at least 6 characters';
}
