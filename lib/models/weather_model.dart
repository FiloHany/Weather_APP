import 'package:flutter/material.dart';

/// Model representing weather data for a specific city and date.
class WeatherModel {
  /// The local date and time of the weather data.
  final String date;

  /// The name of the city.
  final String cityName;

  /// The current temperature in Celsius.
  final double currentTemp;

  /// The maximum temperature for the day in Celsius.
  final double maxtemp;

  /// The minimum temperature for the day in Celsius.
  final double mintemp;

  /// The weather state description (e.g., 'Clear', 'Rainy').
  final String weatherStateName;

  /// Creates a [WeatherModel] instance.
  WeatherModel({
    required this.date,
    required this.cityName,
    required this.currentTemp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherStateName,
  });

  /// Factory constructor to create a [WeatherModel] from JSON data.
  factory WeatherModel.fromJson(dynamic data) {
    final jsonData = data['forecast']['forecastday'][0]['day'];
    final date = data['location']['localtime'];
    final cityName = data['location']['name'];
    final maxtemp = jsonData['maxtemp_c'];
    final mintemp = jsonData['mintemp_c'];
    final avgtempc = jsonData['avgtemp_c'];
    final weatherStateName = jsonData['condition']['text'];
    return WeatherModel(
      date: date,
      cityName: cityName,
      currentTemp: avgtempc,
      maxtemp: maxtemp,
      mintemp: mintemp,
      weatherStateName: weatherStateName,
    );
  }

  @override
  String toString() {
    return 'WeatherModel{date: $date, city: $cityName, currentTemp: $currentTemp, maxtemp: $maxtemp, mintemp: $mintemp, weatherStateName: $weatherStateName}';
  }

  /// Returns the asset path for the weather icon based on [weatherStateName].
  String getImage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'light cloud' ||
        weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'light rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Patchy rain nearby') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'heavy cloud' ||
        weatherStateName == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  /// Returns a [MaterialColor] for theming based on [weatherStateName].
  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'light cloud' ||
        weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'light rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy rain' ||
        weatherStateName == 'Patchy rain nearby') {
      return Colors.blue;
    } else if (weatherStateName == 'heavy cloud' ||
        weatherStateName == 'Cloudy') {
      return Colors.grey;
    } else if (weatherStateName == 'thunderstorm') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
