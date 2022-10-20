String? titleValidator(String? input) {
  if (input == null || input.isEmpty) {
    return "Please enter a title";
  } else if (input.length < 30) {
    return null;
  } else {
    return "title is too long";
  }
}
