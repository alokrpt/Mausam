// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of historical_list;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoricalList _$HistoricalListFromJson(Map<String, dynamic> json) {
  return _HistoricalList.fromJson(json);
}

/// @nodoc
class _$HistoricalListTearOff {
  const _$HistoricalListTearOff();

  _HistoricalList call({required List<Historical> hourly}) {
    return _HistoricalList(
      hourly: hourly,
    );
  }

  HistoricalList fromJson(Map<String, Object?> json) {
    return HistoricalList.fromJson(json);
  }
}

/// @nodoc
const $HistoricalList = _$HistoricalListTearOff();

/// @nodoc
mixin _$HistoricalList {
  List<Historical> get hourly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricalListCopyWith<HistoricalList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalListCopyWith<$Res> {
  factory $HistoricalListCopyWith(
          HistoricalList value, $Res Function(HistoricalList) then) =
      _$HistoricalListCopyWithImpl<$Res>;
  $Res call({List<Historical> hourly});
}

/// @nodoc
class _$HistoricalListCopyWithImpl<$Res>
    implements $HistoricalListCopyWith<$Res> {
  _$HistoricalListCopyWithImpl(this._value, this._then);

  final HistoricalList _value;
  // ignore: unused_field
  final $Res Function(HistoricalList) _then;

  @override
  $Res call({
    Object? hourly = freezed,
  }) {
    return _then(_value.copyWith(
      hourly: hourly == freezed
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<Historical>,
    ));
  }
}

/// @nodoc
abstract class _$HistoricalListCopyWith<$Res>
    implements $HistoricalListCopyWith<$Res> {
  factory _$HistoricalListCopyWith(
          _HistoricalList value, $Res Function(_HistoricalList) then) =
      __$HistoricalListCopyWithImpl<$Res>;
  @override
  $Res call({List<Historical> hourly});
}

/// @nodoc
class __$HistoricalListCopyWithImpl<$Res>
    extends _$HistoricalListCopyWithImpl<$Res>
    implements _$HistoricalListCopyWith<$Res> {
  __$HistoricalListCopyWithImpl(
      _HistoricalList _value, $Res Function(_HistoricalList) _then)
      : super(_value, (v) => _then(v as _HistoricalList));

  @override
  _HistoricalList get _value => super._value as _HistoricalList;

  @override
  $Res call({
    Object? hourly = freezed,
  }) {
    return _then(_HistoricalList(
      hourly: hourly == freezed
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<Historical>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoricalList implements _HistoricalList {
  _$_HistoricalList({required this.hourly});

  factory _$_HistoricalList.fromJson(Map<String, dynamic> json) =>
      _$$_HistoricalListFromJson(json);

  @override
  final List<Historical> hourly;

  @override
  String toString() {
    return 'HistoricalList(hourly: $hourly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoricalList &&
            const DeepCollectionEquality().equals(other.hourly, hourly));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(hourly));

  @JsonKey(ignore: true)
  @override
  _$HistoricalListCopyWith<_HistoricalList> get copyWith =>
      __$HistoricalListCopyWithImpl<_HistoricalList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoricalListToJson(this);
  }
}

abstract class _HistoricalList implements HistoricalList {
  factory _HistoricalList({required List<Historical> hourly}) =
      _$_HistoricalList;

  factory _HistoricalList.fromJson(Map<String, dynamic> json) =
      _$_HistoricalList.fromJson;

  @override
  List<Historical> get hourly;
  @override
  @JsonKey(ignore: true)
  _$HistoricalListCopyWith<_HistoricalList> get copyWith =>
      throw _privateConstructorUsedError;
}
