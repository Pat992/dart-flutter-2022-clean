String? bodyValidator(String? input) {
  if (input == null || input.isEmpty) {
    return "Please enter a description";
  } else if (input.length < 300) {
    return null;
  } else {
    return "Description is too long";
  }
}
