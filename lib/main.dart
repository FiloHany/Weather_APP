// Entry point for the WeatherApp Flutter application.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/views/home_view.dart';

/// The main function initializes the app and provides the [WeatherProvider]
/// to the widget tree using [ChangeNotifierProvider].
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const WeatherApp(),
    ),
  );
}

/// The root widget of the WeatherApp.
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            weatherProvider.weatherData?.getThemeColor() ?? Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
