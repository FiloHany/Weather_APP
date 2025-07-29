import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';

/// Search view for entering a city name and fetching weather data.
class SearchView extends StatelessWidget {
  /// Callback to update the UI after a search.
  final VoidCallback? updateUI;

  SearchView({this.updateUI, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (value) => cityName = value,
            onSubmitted: (value) async {
              if (value.trim().isEmpty) return;
              cityName = value.trim();
              final service = WeatherServices();
              final weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
              updateUI?.call();
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              label: const Text("Search"),
              hintText: 'Enter city',
              border: const OutlineInputBorder(),
              suffixIcon: Builder(
                builder: (context) => GestureDetector(
                  onTap: () async {
                    if (cityName == null || cityName!.trim().isEmpty) return;
                    final service = WeatherServices();
                    final weather =
                        await service.getWeather(cityName: cityName!.trim());
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                    updateUI?.call();
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
