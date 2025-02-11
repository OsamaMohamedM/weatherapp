import 'dart:convert';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String baseUrl;
  final String apiKey;
  final http.Client httpClient;


  WeatherService({
    required this.baseUrl,
    required this.apiKey,
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  Future<WeatherModel> getWeather({required String cityName}) async {
    final Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    try {
      final http.Response response = await httpClient.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return WeatherModel.fromJson(data);
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw WeatherServiceException(errorData['error']['message']);
      } else {
        throw WeatherServiceException('Unexpected error occurred.');
      }
    } catch (e) {
      throw WeatherServiceException('Failed to fetch weather data: $e');
    }
  }
}

class WeatherServiceException implements Exception {
  final String message;
  WeatherServiceException(this.message);

  @override
  String toString() => 'WeatherServiceException: $message';
}
