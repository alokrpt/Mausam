import 'package:flutter/material.dart';
import 'package:mausam/views/forecast/current_weather.dart';
import 'package:mausam/views/forecast/historical_weather.dart';
import 'package:mausam/views/forecast/hourly_weather.dart';
import 'package:mausam/views/map/maps_screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.map_outlined),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MapScreen(),
            ));
          }),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Spacer(),
            HourlyWeather(),
            Spacer(),
            CurrentWeather(),
            Spacer(),
            HistoricalWeather(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
