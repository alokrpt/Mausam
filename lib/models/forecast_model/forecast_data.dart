import 'package:mausam/models/forecast_model/forecast_model.dart';
import 'package:mausam/models/weather_model/weather_data.dart';

class ForecastData {
  const ForecastData(this.list);
  factory ForecastData.from(Forecast forecast) {
    return ForecastData(
      forecast.list.map((item) => WeatherData.from(item)).toList(),
    );
  }
  final List<WeatherData> list;
}