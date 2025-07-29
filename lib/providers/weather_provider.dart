import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

/// Provider for managing and notifying weather data changes.
class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  /// The name of the current city for which weather is shown.
  String? cityName;

  /// Sets the weather data and notifies listeners.
  set weatherData(WeatherModel? weatherData) {
    _weatherData = weatherData;
    notifyListeners();
  }

  /// Gets the current weather data.
  WeatherModel? get weatherData => _weatherData;
}
