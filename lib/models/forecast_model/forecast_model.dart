library forecast;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mausam/models/weather_model/weather_model.dart';
part 'forecast_model.g.dart';
part 'forecast_model.freezed.dart';

/// Forecast data parsed from the API response (not used directly in the UI)
@freezed
class Forecast with _$Forecast {
  factory Forecast({
    required List<Weather> list,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}