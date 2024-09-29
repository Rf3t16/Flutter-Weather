import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherController extends ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;
  final WeatherService _weatherService = WeatherService();

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      Weather weather = await _weatherService.fetchWeather(city);
      _weather = weather;
    } catch (e) {
      _errorMessage = 'Failed to load weather data. Please try again later.';
      _weather = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
