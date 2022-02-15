import 'package:mausam/models/temperature_model.dart';

import 'historical_model.dart';

class HistoricalData {
  HistoricalData({
    required this.temp,
    required this.description,
    required this.main,
    required this.date,
    required this.icon,
  });

  factory HistoricalData.from(Historical weather) {
    return HistoricalData(
      temp: Temperature.celsius(weather.temp),
      description: weather.historicalInfo[0].description,
      main: weather.historicalInfo[0].main,
      date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
      icon: weather.historicalInfo[0].icon,
    );
  }

  final Temperature temp;
  final String description;
  final String main;
  final DateTime date;
  final String icon;

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
}
