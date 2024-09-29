import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather? weather;
  final String? errorMessage;

  const WeatherDisplay({Key? key, this.weather, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Text(
        errorMessage!,
        style: const TextStyle(color: Colors.red, fontSize: 18),
        textAlign: TextAlign.center,
      );
    }

    return weather != null
        ? Column(
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                child: Text('City: ${weather!.cityName}'),
              ),
              const SizedBox(height: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                child: Text('Temperature: ${weather!.temperature}°C'),
              ),
              const SizedBox(height: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                child: Text('Description: ${weather!.description}'),
              ),
            ],
          )
        : const Text(
            'Enter a city name and press "Get Weather"',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          );
  }
}
