// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'historical_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoricalInfo _$HistoricalInfoFromJson(Map<String, dynamic> json) {
  return _HistoricalInfo.fromJson(json);
}

/// @nodoc
class _$HistoricalInfoTearOff {
  const _$HistoricalInfoTearOff();

  _HistoricalInfo call(
      {required String main,
      required String description,
      required String icon}) {
    return _HistoricalInfo(
      main: main,
      description: description,
      icon: icon,
    );
  }

  HistoricalInfo fromJson(Map<String, Object?> json) {
    return HistoricalInfo.fromJson(json);
  }
}

/// @nodoc
const $HistoricalInfo = _$HistoricalInfoTearOff();

/// @nodoc
mixin _$HistoricalInfo {
  String get main => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricalInfoCopyWith<HistoricalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalInfoCopyWith<$Res> {
  factory $HistoricalInfoCopyWith(
          HistoricalInfo value, $Res Function(HistoricalInfo) then) =
      _$HistoricalInfoCopyWithImpl<$Res>;
  $Res call({String main, String description, String icon});
}

/// @nodoc
class _$HistoricalInfoCopyWithImpl<$Res>
    implements $HistoricalInfoCopyWith<$Res> {
  _$HistoricalInfoCopyWithImpl(this._value, this._then);

  final HistoricalInfo _value;
  // ignore: unused_field
  final $Res Function(HistoricalInfo) _then;

  @override
  $Res call({
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      main: main == freezed
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$HistoricalInfoCopyWith<$Res>
    implements $HistoricalInfoCopyWith<$Res> {
  factory _$HistoricalInfoCopyWith(
          _HistoricalInfo value, $Res Function(_HistoricalInfo) then) =
      __$HistoricalInfoCopyWithImpl<$Res>;
  @override
  $Res call({String main, String description, String icon});
}

/// @nodoc
class __$HistoricalInfoCopyWithImpl<$Res>
    extends _$HistoricalInfoCopyWithImpl<$Res>
    implements _$HistoricalInfoCopyWith<$Res> {
  __$HistoricalInfoCopyWithImpl(
      _HistoricalInfo _value, $Res Function(_HistoricalInfo) _then)
      : super(_value, (v) => _then(v as _HistoricalInfo));

  @override
  _HistoricalInfo get _value => super._value as _HistoricalInfo;

  @override
  $Res call({
    Object? main = freezed,
    Object? description = freezed,
    Object? icon = freezed,
  }) {
    return _then(_HistoricalInfo(
      main: main == freezed
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoricalInfo implements _HistoricalInfo {
  _$_HistoricalInfo(
      {required this.main, required this.description, required this.icon});

  factory _$_HistoricalInfo.fromJson(Map<String, dynamic> json) =>
      _$$_HistoricalInfoFromJson(json);

  @override
  final String main;
  @override
  final String description;
  @override
  final String icon;

  @override
  String toString() {
    return 'HistoricalInfo(main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoricalInfo &&
            const DeepCollectionEquality().equals(other.main, main) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(main),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  _$HistoricalInfoCopyWith<_HistoricalInfo> get copyWith =>
      __$HistoricalInfoCopyWithImpl<_HistoricalInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoricalInfoToJson(this);
  }
}

abstract class _HistoricalInfo implements HistoricalInfo {
  factory _HistoricalInfo(
      {required String main,
      required String description,
      required String icon}) = _$_HistoricalInfo;

  factory _HistoricalInfo.fromJson(Map<String, dynamic> json) =
      _$_HistoricalInfo.fromJson;

  @override
  String get main;
  @override
  String get description;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$HistoricalInfoCopyWith<_HistoricalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Historical _$HistoricalFromJson(Map<String, dynamic> json) {
  return _Historical.fromJson(json);
}

/// @nodoc
class _$HistoricalTearOff {
  const _$HistoricalTearOff();

  _Historical call(
      {@JsonKey(name: 'weather') required List<HistoricalInfo> historicalInfo,
      required int dt,
      required double temp}) {
    return _Historical(
      historicalInfo: historicalInfo,
      dt: dt,
      temp: temp,
    );
  }

  Historical fromJson(Map<String, Object?> json) {
    return Historical.fromJson(json);
  }
}

/// @nodoc
const $Historical = _$HistoricalTearOff();

/// @nodoc
mixin _$Historical {
  @JsonKey(name: 'weather')
  List<HistoricalInfo> get historicalInfo => throw _privateConstructorUsedError;
  int get dt => throw _privateConstructorUsedError;
  double get temp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricalCopyWith<Historical> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalCopyWith<$Res> {
  factory $HistoricalCopyWith(
          Historical value, $Res Function(Historical) then) =
      _$HistoricalCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'weather') List<HistoricalInfo> historicalInfo,
      int dt,
      double temp});
}

/// @nodoc
class _$HistoricalCopyWithImpl<$Res> implements $HistoricalCopyWith<$Res> {
  _$HistoricalCopyWithImpl(this._value, this._then);

  final Historical _value;
  // ignore: unused_field
  final $Res Function(Historical) _then;

  @override
  $Res call({
    Object? historicalInfo = freezed,
    Object? dt = freezed,
    Object? temp = freezed,
  }) {
    return _then(_value.copyWith(
      historicalInfo: historicalInfo == freezed
          ? _value.historicalInfo
          : historicalInfo // ignore: cast_nullable_to_non_nullable
              as List<HistoricalInfo>,
      dt: dt == freezed
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$HistoricalCopyWith<$Res> implements $HistoricalCopyWith<$Res> {
  factory _$HistoricalCopyWith(
          _Historical value, $Res Function(_Historical) then) =
      __$HistoricalCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'weather') List<HistoricalInfo> historicalInfo,
      int dt,
      double temp});
}

/// @nodoc
class __$HistoricalCopyWithImpl<$Res> extends _$HistoricalCopyWithImpl<$Res>
    implements _$HistoricalCopyWith<$Res> {
  __$HistoricalCopyWithImpl(
      _Historical _value, $Res Function(_Historical) _then)
      : super(_value, (v) => _then(v as _Historical));

  @override
  _Historical get _value => super._value as _Historical;

  @override
  $Res call({
    Object? historicalInfo = freezed,
    Object? dt = freezed,
    Object? temp = freezed,
  }) {
    return _then(_Historical(
      historicalInfo: historicalInfo == freezed
          ? _value.historicalInfo
          : historicalInfo // ignore: cast_nullable_to_non_nullable
              as List<HistoricalInfo>,
      dt: dt == freezed
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      temp: temp == freezed
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Historical implements _Historical {
  _$_Historical(
      {@JsonKey(name: 'weather') required this.historicalInfo,
      required this.dt,
      required this.temp});

  factory _$_Historical.fromJson(Map<String, dynamic> json) =>
      _$$_HistoricalFromJson(json);

  @override
  @JsonKey(name: 'weather')
  final List<HistoricalInfo> historicalInfo;
  @override
  final int dt;
  @override
  final double temp;

  @override
  String toString() {
    return 'Historical(historicalInfo: $historicalInfo, dt: $dt, temp: $temp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Historical &&
            const DeepCollectionEquality()
                .equals(other.historicalInfo, historicalInfo) &&
            const DeepCollectionEquality().equals(other.dt, dt) &&
            const DeepCollectionEquality().equals(other.temp, temp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(historicalInfo),
      const DeepCollectionEquality().hash(dt),
      const DeepCollectionEquality().hash(temp));

  @JsonKey(ignore: true)
  @override
  _$HistoricalCopyWith<_Historical> get copyWith =>
      __$HistoricalCopyWithImpl<_Historical>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoricalToJson(this);
  }
}

abstract class _Historical implements Historical {
  factory _Historical(
      {@JsonKey(name: 'weather') required List<HistoricalInfo> historicalInfo,
      required int dt,
      required double temp}) = _$_Historical;

  factory _Historical.fromJson(Map<String, dynamic> json) =
      _$_Historical.fromJson;

  @override
  @JsonKey(name: 'weather')
  List<HistoricalInfo> get historicalInfo;
  @override
  int get dt;
  @override
  double get temp;
  @override
  @JsonKey(ignore: true)
  _$HistoricalCopyWith<_Historical> get copyWith =>
      throw _privateConstructorUsedError;
}
