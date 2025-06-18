// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alpha_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlphaDataEntity _$AlphaDataEntityFromJson(Map<String, dynamic> json) {
  return _AlphaDataEntity.fromJson(json);
}

/// @nodoc
mixin _$AlphaDataEntity {
  String get locationType => throw _privateConstructorUsedError;
  String get residenceType => throw _privateConstructorUsedError;
  String get petType => throw _privateConstructorUsedError;
  List<List<bool>> get availableTimes => throw _privateConstructorUsedError;
  String get exerciseFrequency => throw _privateConstructorUsedError;
  String get exerciseIntensity => throw _privateConstructorUsedError;
  String get exerciseTimes => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get smokingStatus => throw _privateConstructorUsedError;
  String get drinkFrequency => throw _privateConstructorUsedError;
  String get drinkAmount => throw _privateConstructorUsedError;
  String get breakfastFrequency => throw _privateConstructorUsedError;
  List<String> get disease => throw _privateConstructorUsedError;

  /// Serializes this AlphaDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlphaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlphaDataEntityCopyWith<AlphaDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlphaDataEntityCopyWith<$Res> {
  factory $AlphaDataEntityCopyWith(
          AlphaDataEntity value, $Res Function(AlphaDataEntity) then) =
      _$AlphaDataEntityCopyWithImpl<$Res, AlphaDataEntity>;
  @useResult
  $Res call(
      {String locationType,
      String residenceType,
      String petType,
      List<List<bool>> availableTimes,
      String exerciseFrequency,
      String exerciseIntensity,
      String exerciseTimes,
      int height,
      int weight,
      String smokingStatus,
      String drinkFrequency,
      String drinkAmount,
      String breakfastFrequency,
      List<String> disease});
}

/// @nodoc
class _$AlphaDataEntityCopyWithImpl<$Res, $Val extends AlphaDataEntity>
    implements $AlphaDataEntityCopyWith<$Res> {
  _$AlphaDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlphaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationType = null,
    Object? residenceType = null,
    Object? petType = null,
    Object? availableTimes = null,
    Object? exerciseFrequency = null,
    Object? exerciseIntensity = null,
    Object? exerciseTimes = null,
    Object? height = null,
    Object? weight = null,
    Object? smokingStatus = null,
    Object? drinkFrequency = null,
    Object? drinkAmount = null,
    Object? breakfastFrequency = null,
    Object? disease = null,
  }) {
    return _then(_value.copyWith(
      locationType: null == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String,
      residenceType: null == residenceType
          ? _value.residenceType
          : residenceType // ignore: cast_nullable_to_non_nullable
              as String,
      petType: null == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as String,
      availableTimes: null == availableTimes
          ? _value.availableTimes
          : availableTimes // ignore: cast_nullable_to_non_nullable
              as List<List<bool>>,
      exerciseFrequency: null == exerciseFrequency
          ? _value.exerciseFrequency
          : exerciseFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseIntensity: null == exerciseIntensity
          ? _value.exerciseIntensity
          : exerciseIntensity // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseTimes: null == exerciseTimes
          ? _value.exerciseTimes
          : exerciseTimes // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      smokingStatus: null == smokingStatus
          ? _value.smokingStatus
          : smokingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      drinkFrequency: null == drinkFrequency
          ? _value.drinkFrequency
          : drinkFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      drinkAmount: null == drinkAmount
          ? _value.drinkAmount
          : drinkAmount // ignore: cast_nullable_to_non_nullable
              as String,
      breakfastFrequency: null == breakfastFrequency
          ? _value.breakfastFrequency
          : breakfastFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      disease: null == disease
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlphaDataEntityImplCopyWith<$Res>
    implements $AlphaDataEntityCopyWith<$Res> {
  factory _$$AlphaDataEntityImplCopyWith(_$AlphaDataEntityImpl value,
          $Res Function(_$AlphaDataEntityImpl) then) =
      __$$AlphaDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String locationType,
      String residenceType,
      String petType,
      List<List<bool>> availableTimes,
      String exerciseFrequency,
      String exerciseIntensity,
      String exerciseTimes,
      int height,
      int weight,
      String smokingStatus,
      String drinkFrequency,
      String drinkAmount,
      String breakfastFrequency,
      List<String> disease});
}

/// @nodoc
class __$$AlphaDataEntityImplCopyWithImpl<$Res>
    extends _$AlphaDataEntityCopyWithImpl<$Res, _$AlphaDataEntityImpl>
    implements _$$AlphaDataEntityImplCopyWith<$Res> {
  __$$AlphaDataEntityImplCopyWithImpl(
      _$AlphaDataEntityImpl _value, $Res Function(_$AlphaDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlphaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationType = null,
    Object? residenceType = null,
    Object? petType = null,
    Object? availableTimes = null,
    Object? exerciseFrequency = null,
    Object? exerciseIntensity = null,
    Object? exerciseTimes = null,
    Object? height = null,
    Object? weight = null,
    Object? smokingStatus = null,
    Object? drinkFrequency = null,
    Object? drinkAmount = null,
    Object? breakfastFrequency = null,
    Object? disease = null,
  }) {
    return _then(_$AlphaDataEntityImpl(
      locationType: null == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String,
      residenceType: null == residenceType
          ? _value.residenceType
          : residenceType // ignore: cast_nullable_to_non_nullable
              as String,
      petType: null == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as String,
      availableTimes: null == availableTimes
          ? _value._availableTimes
          : availableTimes // ignore: cast_nullable_to_non_nullable
              as List<List<bool>>,
      exerciseFrequency: null == exerciseFrequency
          ? _value.exerciseFrequency
          : exerciseFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseIntensity: null == exerciseIntensity
          ? _value.exerciseIntensity
          : exerciseIntensity // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseTimes: null == exerciseTimes
          ? _value.exerciseTimes
          : exerciseTimes // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      smokingStatus: null == smokingStatus
          ? _value.smokingStatus
          : smokingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      drinkFrequency: null == drinkFrequency
          ? _value.drinkFrequency
          : drinkFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      drinkAmount: null == drinkAmount
          ? _value.drinkAmount
          : drinkAmount // ignore: cast_nullable_to_non_nullable
              as String,
      breakfastFrequency: null == breakfastFrequency
          ? _value.breakfastFrequency
          : breakfastFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      disease: null == disease
          ? _value._disease
          : disease // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlphaDataEntityImpl extends _AlphaDataEntity {
  const _$AlphaDataEntityImpl(
      {this.locationType = '',
      this.residenceType = '',
      this.petType = '',
      final List<List<bool>> availableTimes = const [],
      this.exerciseFrequency = '',
      this.exerciseIntensity = '',
      this.exerciseTimes = '',
      this.height = 0,
      this.weight = 0,
      this.smokingStatus = '',
      this.drinkFrequency = '',
      this.drinkAmount = '',
      this.breakfastFrequency = '',
      final List<String> disease = const []})
      : _availableTimes = availableTimes,
        _disease = disease,
        super._();

  factory _$AlphaDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlphaDataEntityImplFromJson(json);

  @override
  @JsonKey()
  final String locationType;
  @override
  @JsonKey()
  final String residenceType;
  @override
  @JsonKey()
  final String petType;
  final List<List<bool>> _availableTimes;
  @override
  @JsonKey()
  List<List<bool>> get availableTimes {
    if (_availableTimes is EqualUnmodifiableListView) return _availableTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTimes);
  }

  @override
  @JsonKey()
  final String exerciseFrequency;
  @override
  @JsonKey()
  final String exerciseIntensity;
  @override
  @JsonKey()
  final String exerciseTimes;
  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey()
  final int weight;
  @override
  @JsonKey()
  final String smokingStatus;
  @override
  @JsonKey()
  final String drinkFrequency;
  @override
  @JsonKey()
  final String drinkAmount;
  @override
  @JsonKey()
  final String breakfastFrequency;
  final List<String> _disease;
  @override
  @JsonKey()
  List<String> get disease {
    if (_disease is EqualUnmodifiableListView) return _disease;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disease);
  }

  @override
  String toString() {
    return 'AlphaDataEntity(locationType: $locationType, residenceType: $residenceType, petType: $petType, availableTimes: $availableTimes, exerciseFrequency: $exerciseFrequency, exerciseIntensity: $exerciseIntensity, exerciseTimes: $exerciseTimes, height: $height, weight: $weight, smokingStatus: $smokingStatus, drinkFrequency: $drinkFrequency, drinkAmount: $drinkAmount, breakfastFrequency: $breakfastFrequency, disease: $disease)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlphaDataEntityImpl &&
            (identical(other.locationType, locationType) ||
                other.locationType == locationType) &&
            (identical(other.residenceType, residenceType) ||
                other.residenceType == residenceType) &&
            (identical(other.petType, petType) || other.petType == petType) &&
            const DeepCollectionEquality()
                .equals(other._availableTimes, _availableTimes) &&
            (identical(other.exerciseFrequency, exerciseFrequency) ||
                other.exerciseFrequency == exerciseFrequency) &&
            (identical(other.exerciseIntensity, exerciseIntensity) ||
                other.exerciseIntensity == exerciseIntensity) &&
            (identical(other.exerciseTimes, exerciseTimes) ||
                other.exerciseTimes == exerciseTimes) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.smokingStatus, smokingStatus) ||
                other.smokingStatus == smokingStatus) &&
            (identical(other.drinkFrequency, drinkFrequency) ||
                other.drinkFrequency == drinkFrequency) &&
            (identical(other.drinkAmount, drinkAmount) ||
                other.drinkAmount == drinkAmount) &&
            (identical(other.breakfastFrequency, breakfastFrequency) ||
                other.breakfastFrequency == breakfastFrequency) &&
            const DeepCollectionEquality().equals(other._disease, _disease));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      locationType,
      residenceType,
      petType,
      const DeepCollectionEquality().hash(_availableTimes),
      exerciseFrequency,
      exerciseIntensity,
      exerciseTimes,
      height,
      weight,
      smokingStatus,
      drinkFrequency,
      drinkAmount,
      breakfastFrequency,
      const DeepCollectionEquality().hash(_disease));

  /// Create a copy of AlphaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlphaDataEntityImplCopyWith<_$AlphaDataEntityImpl> get copyWith =>
      __$$AlphaDataEntityImplCopyWithImpl<_$AlphaDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlphaDataEntityImplToJson(
      this,
    );
  }
}

abstract class _AlphaDataEntity extends AlphaDataEntity {
  const factory _AlphaDataEntity(
      {final String locationType,
      final String residenceType,
      final String petType,
      final List<List<bool>> availableTimes,
      final String exerciseFrequency,
      final String exerciseIntensity,
      final String exerciseTimes,
      final int height,
      final int weight,
      final String smokingStatus,
      final String drinkFrequency,
      final String drinkAmount,
      final String breakfastFrequency,
      final List<String> disease}) = _$AlphaDataEntityImpl;
  const _AlphaDataEntity._() : super._();

  factory _AlphaDataEntity.fromJson(Map<String, dynamic> json) =
      _$AlphaDataEntityImpl.fromJson;

  @override
  String get locationType;
  @override
  String get residenceType;
  @override
  String get petType;
  @override
  List<List<bool>> get availableTimes;
  @override
  String get exerciseFrequency;
  @override
  String get exerciseIntensity;
  @override
  String get exerciseTimes;
  @override
  int get height;
  @override
  int get weight;
  @override
  String get smokingStatus;
  @override
  String get drinkFrequency;
  @override
  String get drinkAmount;
  @override
  String get breakfastFrequency;
  @override
  List<String> get disease;

  /// Create a copy of AlphaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlphaDataEntityImplCopyWith<_$AlphaDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
