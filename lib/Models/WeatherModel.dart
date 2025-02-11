import 'package:flutter/material.dart';

class WeatherModel {
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  
  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: DateTime.parse(data['current']['last_updated']),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }

  @override
  String toString() {
    return 'Temp = $temp°C, MinTemp = $minTemp°C, Date = $date';
  }
}

class WeatherUtils {
  static const Map<String, String> _weatherImages = {
    'Sunny': 'assets/images/clear.png',
    'Clear': 'assets/images/clear.png',
    'Partly cloudy': 'assets/images/clear.png',
    'Blizzard': 'assets/images/snow.png',
    'Patchy snow possible': 'assets/images/snow.png',
    'Patchy sleet possible': 'assets/images/snow.png',
    'Patchy freezing drizzle possible': 'assets/images/snow.png',
    'Blowing snow': 'assets/images/snow.png',
    'Freezing fog': 'assets/images/cloudy.png',
    'Fog': 'assets/images/cloudy.png',
    'Heavy Cloud': 'assets/images/cloudy.png',
    'Mist': 'assets/images/cloudy.png',
    'Patchy rain possible': 'assets/images/rainy.png',
    'Heavy Rain': 'assets/images/rainy.png',
    'Showers': 'assets/images/rainy.png',
    'Thundery outbreaks possible': 'assets/images/thunderstorm.png',
    'Moderate or heavy snow with thunder': 'assets/images/thunderstorm.png',
    'Patchy light snow with thunder': 'assets/images/thunderstorm.png',
    'Moderate or heavy rain with thunder': 'assets/images/thunderstorm.png',
    'Patchy light rain with thunder': 'assets/images/thunderstorm.png',
  };

  static const Map<String, MaterialColor> _weatherColors = {
    'Sunny': Colors.orange,
    'Clear': Colors.orange,
    'Partly cloudy': Colors.orange,
    'Blizzard': Colors.blue,
    'Patchy snow possible': Colors.blue,
    'Patchy sleet possible': Colors.blue,
    'Patchy freezing drizzle possible': Colors.blue,
    'Blowing snow': Colors.blue,
    'Freezing fog': Colors.blueGrey,
    'Fog': Colors.blueGrey,
    'Heavy Cloud': Colors.blueGrey,
    'Mist': Colors.blueGrey,
    'Patchy rain possible': Colors.blue,
    'Heavy Rain': Colors.blue,
    'Showers': Colors.blue,
    'Thundery outbreaks possible': Colors.deepPurple,
    'Moderate or heavy snow with thunder': Colors.deepPurple,
    'Patchy light snow with thunder': Colors.deepPurple,
    'Moderate or heavy rain with thunder': Colors.deepPurple,
    'Patchy light rain with thunder': Colors.deepPurple,
  };


  static String getImage(String weatherStateName) {
    return _weatherImages[weatherStateName] ?? 'assets/images/clear.png';
  }

  static MaterialColor getThemeColor(String weatherStateName) {
    return _weatherColors[weatherStateName] ?? Colors.orange;
  }
}
