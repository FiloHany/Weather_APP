# WeatherApp

A cross-platform weather application built with Flutter. This app allows users to search for weather information by city, displaying current temperature, weather conditions, and more, with dynamic theming and weather icons.

## Features
- Search for weather by city name
- Displays current temperature, max/min temperature, and weather state
- Dynamic theme color and weather icons based on weather state
- Responsive UI for mobile and desktop
- Built with [Provider](https://pub.dev/packages/provider) for state management
- Uses [http](https://pub.dev/packages/http) for API requests

## Screenshots
<!-- Add screenshots here if available -->

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=3.5.3 <4.0.0)
- Dart SDK (>=3.5.3 <4.0.0)

### Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/weatherapp.git
   cd weatherapp
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the app:**
   ```sh
   flutter run
   ```
   You can specify a device or platform (Android, iOS, web, etc.) as needed.

### Building for Release
- **Android:**
  ```sh
  flutter build apk --release
  ```
- **iOS:**
  ```sh
  flutter build ios --release
  ```
- **Web:**
  ```sh
  flutter build web
  ```

## Project Structure
```
lib/
  main.dart                # App entry point
  models/weather_model.dart
  providers/weather_provider.dart
  services/weather_services.dart
  views/
    home_view.dart
    search_view.dart
  widgets/
    no_weather_body.dart
    weather_info_body.dart
assets/images/             # Weather icons (clear, cloudy, rainy, snow, thunderstorm)
```

## Assets
- Weather icons are located in `assets/images/` and are referenced in the app based on weather state.
- Ensure assets are declared in `pubspec.yaml` under the `assets` section.

## Dependencies
- [provider](https://pub.dev/packages/provider) ^6.1.2
- [http](https://pub.dev/packages/http) ^1.3.0
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) ^1.0.8

See `pubspec.yaml` and `pubspec.lock` for the full list and versions.

## Code Quality
- This project uses [Flutter Lints](https://pub.dev/packages/flutter_lints) for recommended best practices.
- See `analysis_options.yaml` for linting rules.
- Run static analysis:
  ```sh
  flutter analyze
  ```

## Testing
- (No tests are currently included. Add tests in the `test/` directory and run with `flutter test`.)

## Contributing
Contributions are welcome! Please open issues or submit pull requests for improvements or bug fixes.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Acknowledgements
- [WeatherAPI](https://www.weatherapi.com/) for weather data
- Flutter and Dart teams for their awesome frameworks
