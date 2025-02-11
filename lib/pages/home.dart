import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/cubits/weatherCubits/WeatherCubit.dart';
import 'package:weatherapp/cubits/weatherCubits/weatherState.dart';
import 'package:weatherapp/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _BuildSuccessState(BuildContext context) {
    WeatherModel weatherData =
        BlocProvider.of<Weathercubit>(context).weatherModel!;
    return Container(
       decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  WeatherUtils.getThemeColor(weatherData.weatherStateName),
                  WeatherUtils.getThemeColor(weatherData.weatherStateName)[300]!,
                  WeatherUtils.getThemeColor(weatherData.weatherStateName)[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
      child: Column(
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<Weathercubit>(context).cityName!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at : ${weatherData.date.hour.toString()}:${weatherData.date.minute.toString()}',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(WeatherUtils.getImage(weatherData.weatherStateName)),
              Text(
                weatherData!.temp.toInt().toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp :${weatherData.maxTemp.toInt()}'),
                  Text('minTemp : ${weatherData.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherData.weatherStateName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main page"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
          ],
        ),
        body:
            BlocBuilder<Weathercubit, Weatherstate>(builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child:  CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            return _BuildSuccessState(context);
          } else if (state is WeatherFaild) {
            return const Center(
              child: Text(
                "There is no data here",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Please Search on City",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            );
          }
        }));
  }
}
