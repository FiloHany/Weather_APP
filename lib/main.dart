// Entry point for the WeatherApp Flutter application.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_cubit.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_state.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';
import 'package:weatherapp/views/home_view.dart';

/// The main function initializes the app and provides the [WeatherProvider]
/// to the widget tree using [ChangeNotifierProvider].
void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(WeatherServices()),
      child: const WeatherApp(),
    ),
  );
}

/// The root widget of the WeatherApp.
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
        final themeColor = weatherModel?.getThemeColor() ?? Colors.blue;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: themeColor,
            scaffoldBackgroundColor: themeColor.shade50,
            appBarTheme: AppBarTheme(
              backgroundColor: themeColor,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: themeColor,
            ),
          ),
          home: HomeView(),
        );
      },
    );
  }
}
