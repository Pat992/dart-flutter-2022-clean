String? emailValidator(String? input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (input == null || input.isEmpty) {
    return 'Please enter an E-Mail';
  } else if (RegExp(emailRegex).hasMatch(input)) {
    return null;
  }
  return 'Please enter a valid E-Mail';
}
