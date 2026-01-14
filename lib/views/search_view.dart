import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_cubit.dart';
import 'package:weatherapp/services/weather_services.dart';

/// Search view for entering a city name and fetching weather data.
class SearchView extends StatelessWidget {

  SearchView({Key? key}) : super(key: key);

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
              cityName = value;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!.trim());
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);
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
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeather(cityName: cityName!.trim());
                    BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                    Navigator.pop(context);
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
