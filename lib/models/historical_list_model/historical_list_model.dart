library historical_list;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mausam/models/historical_model/historical_model.dart';
part 'historical_list_model.g.dart';
part 'historical_list_model.freezed.dart';

/// Forecast data parsed from the API response (not used directly in the UI)
@freezed
class HistoricalList with _$HistoricalList {
  factory HistoricalList({
    required List<Historical> hourly,
  }) = _HistoricalList;

  factory HistoricalList.fromJson(Map<String, dynamic> json) =>
      _$HistoricalListFromJson(json);
}