import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/Services/Service.dart';
import 'package:weatherapp/cubits/weatherCubits/weatherState.dart';

class Weathercubit extends Cubit<Weatherstate> {
  final WeatherService weatherService = new WeatherService(
      baseUrl: "http://api.weatherapi.com/v1",
      apiKey: "3677bed892474b30b7a122242220806");
  Weathercubit() : super(WeatherIntialState());
  String? cityName;
   WeatherModel? weatherModel;
  void getWeatherData(String countryName) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: countryName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFaild());
    }
  }
}
