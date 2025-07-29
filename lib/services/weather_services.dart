import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

/// Service class for fetching weather data from the WeatherAPI.
class WeatherServices {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'API_KEY';

  /// Fetches weather data for the given [cityName].
  ///
  /// Returns a [WeatherModel] with the current weather information.
  Future<WeatherModel> getWeather({required String cityName}) async {
    final Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    final http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather data');
    }

    final Map<String, dynamic> weatherData = jsonDecode(response.body);
    return WeatherModel.fromJson(weatherData);
  }
}
