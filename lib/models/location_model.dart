
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
@Freezed()
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required double lat,
    required double lon,
})=_LocationModel;
}
