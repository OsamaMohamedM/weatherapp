import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weatherCubits/WeatherCubit.dart';

class SearchPage extends StatelessWidget {
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          onChanged: (value) {
            city = value;
          },
          onSubmitted: (value) {
            city = value;
            BlocProvider.of<Weathercubit>(context)
              ..getWeatherData(city!)
              ..cityName = city;
            Navigator.of(context).pop();
          },
          decoration: InputDecoration(
            hintText: 'Enter City',
            suffixIcon: IconButton(
                onPressed: () {
                  BlocProvider.of<Weathercubit>(context)
                    ..getWeatherData(city!)
                    ..cityName = city;
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.search)),
            border: const OutlineInputBorder(),
          ),
        ),
      )),
    );
  }
}
