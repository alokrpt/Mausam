// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoricalInfo _$$_HistoricalInfoFromJson(Map<String, dynamic> json) =>
    _$_HistoricalInfo(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$_HistoricalInfoToJson(_$_HistoricalInfo instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$_Historical _$$_HistoricalFromJson(Map<String, dynamic> json) =>
    _$_Historical(
      historicalInfo: (json['weather'] as List<dynamic>)
          .map((e) => HistoricalInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      dt: json['dt'] as int,
      temp: (json['temp'] as num).toDouble(),
    );

Map<String, dynamic> _$$_HistoricalToJson(_$_Historical instance) =>
    <String, dynamic>{
      'weather': instance.historicalInfo,
      'dt': instance.dt,
      'temp': instance.temp,
    };
