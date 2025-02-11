import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/cubits/weatherCubits/WeatherCubit.dart';
import 'package:weatherapp/pages/home.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => Weathercubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomePage(),
    );
  }
}
