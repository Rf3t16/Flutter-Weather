String? validateCityName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a city name';
  }
  if (RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'City name cannot contain only numbers';
  }
  return null;
}
