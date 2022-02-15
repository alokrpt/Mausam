// GENERATED CODE - DO NOT MODIFY BY HAND

part of historical_list;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoricalList _$$_HistoricalListFromJson(Map<String, dynamic> json) =>
    _$_HistoricalList(
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => Historical.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoricalListToJson(_$_HistoricalList instance) =>
    <String, dynamic>{
      'hourly': instance.hourly,
    };
