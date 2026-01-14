import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_cubit.dart';
import 'package:weatherapp/cubit/weather_cubit/weather_state.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/no_weather_body.dart';

/// The main home view of the WeatherApp.
class HomeView extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchView(),
                ),
              );
            },
            icon: const Icon(Icons.search, size: 32, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return WeatherInfo(weatherData: weatherData);
        } else if (state is WeatherFailure) {
          return const Center(
            child: Text('Failed to fetch weather data'),
          );
        } else {
          return const NoWeatherBody();
        }
      }),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Text(
            weatherData?.cityName ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            weatherData?.date ?? '',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                weatherData?.getImage() ?? 'assets/images/clear.png',
                width: 100,
                height: 100,
              ),
              Text(
                weatherData?.currentTemp.toInt().toString() ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'max temp : ${weatherData?.maxtemp.toInt() ?? ''}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'min temp : ${weatherData?.mintemp.toInt() ?? ''}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            weatherData?.weatherStateName ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
