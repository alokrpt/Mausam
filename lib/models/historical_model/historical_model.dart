import 'package:freezed_annotation/freezed_annotation.dart';

part 'historical_model.freezed.dart';
part 'historical_model.g.dart';



@freezed
class HistoricalInfo with _$HistoricalInfo {
  factory HistoricalInfo({
    required String main,
    required String description,
    required String icon,
  }) = _HistoricalInfo;

  factory HistoricalInfo.fromJson(Map<String, dynamic> json) =>
      _$HistoricalInfoFromJson(json);
}

/// Weather data parsed from the API response (not used directly in the UI)
@freezed
class Historical with _$Historical {
  factory Historical({
    @JsonKey(name: 'weather') required List<HistoricalInfo> historicalInfo,
    required int dt,
    required double temp,
  }) = _Historical;
  factory Historical.fromJson(Map<String, dynamic> json) =>
      _$HistoricalFromJson(json);
}