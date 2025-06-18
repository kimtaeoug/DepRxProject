// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) {
  return _RewardModel.fromJson(json);
}

/// @nodoc
mixin _$RewardModel {
  int get week => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get item => throw _privateConstructorUsedError;
  String get why => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get rewardId => throw _privateConstructorUsedError;

  /// Serializes this RewardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardModelCopyWith<RewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardModelCopyWith<$Res> {
  factory $RewardModelCopyWith(
          RewardModel value, $Res Function(RewardModel) then) =
      _$RewardModelCopyWithImpl<$Res, RewardModel>;
  @useResult
  $Res call(
      {int week,
      String imagePath,
      String label,
      String value,
      String item,
      String why,
      String type,
      String date,
      String rewardId});
}

/// @nodoc
class _$RewardModelCopyWithImpl<$Res, $Val extends RewardModel>
    implements $RewardModelCopyWith<$Res> {
  _$RewardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? imagePath = null,
    Object? label = null,
    Object? value = null,
    Object? item = null,
    Object? why = null,
    Object? type = null,
    Object? date = null,
    Object? rewardId = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      why: null == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardModelImplCopyWith<$Res>
    implements $RewardModelCopyWith<$Res> {
  factory _$$RewardModelImplCopyWith(
          _$RewardModelImpl value, $Res Function(_$RewardModelImpl) then) =
      __$$RewardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int week,
      String imagePath,
      String label,
      String value,
      String item,
      String why,
      String type,
      String date,
      String rewardId});
}

/// @nodoc
class __$$RewardModelImplCopyWithImpl<$Res>
    extends _$RewardModelCopyWithImpl<$Res, _$RewardModelImpl>
    implements _$$RewardModelImplCopyWith<$Res> {
  __$$RewardModelImplCopyWithImpl(
      _$RewardModelImpl _value, $Res Function(_$RewardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? imagePath = null,
    Object? label = null,
    Object? value = null,
    Object? item = null,
    Object? why = null,
    Object? type = null,
    Object? date = null,
    Object? rewardId = null,
  }) {
    return _then(_$RewardModelImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      why: null == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardModelImpl extends _RewardModel {
  const _$RewardModelImpl(
      {this.week = 0,
      this.imagePath = '',
      this.label = '',
      this.value = '',
      this.item = '',
      this.why = '',
      this.type = '',
      this.date = '',
      this.rewardId = ''})
      : super._();

  factory _$RewardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardModelImplFromJson(json);

  @override
  @JsonKey()
  final int week;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String item;
  @override
  @JsonKey()
  final String why;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String rewardId;

  @override
  String toString() {
    return 'RewardModel(week: $week, imagePath: $imagePath, label: $label, value: $value, item: $item, why: $why, type: $type, date: $date, rewardId: $rewardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardModelImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.why, why) || other.why == why) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rewardId, rewardId) ||
                other.rewardId == rewardId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, week, imagePath, label, value,
      item, why, type, date, rewardId);

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardModelImplCopyWith<_$RewardModelImpl> get copyWith =>
      __$$RewardModelImplCopyWithImpl<_$RewardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardModelImplToJson(
      this,
    );
  }
}

abstract class _RewardModel extends RewardModel {
  const factory _RewardModel(
      {final int week,
      final String imagePath,
      final String label,
      final String value,
      final String item,
      final String why,
      final String type,
      final String date,
      final String rewardId}) = _$RewardModelImpl;
  const _RewardModel._() : super._();

  factory _RewardModel.fromJson(Map<String, dynamic> json) =
      _$RewardModelImpl.fromJson;

  @override
  int get week;
  @override
  String get imagePath;
  @override
  String get label;
  @override
  String get value;
  @override
  String get item;
  @override
  String get why;
  @override
  String get type;
  @override
  String get date;
  @override
  String get rewardId;

  /// Create a copy of RewardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardModelImplCopyWith<_$RewardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
