// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_total_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardTotalModel _$RewardTotalModelFromJson(Map<String, dynamic> json) {
  return _RewardTotalModel.fromJson(json);
}

/// @nodoc
mixin _$RewardTotalModel {
  int get week => throw _privateConstructorUsedError;
  List<RewardModel> get stamp => throw _privateConstructorUsedError;
  List<RewardModel> get emotion => throw _privateConstructorUsedError;
  List<RewardModel> get activity => throw _privateConstructorUsedError;

  /// Serializes this RewardTotalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardTotalModelCopyWith<RewardTotalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardTotalModelCopyWith<$Res> {
  factory $RewardTotalModelCopyWith(
          RewardTotalModel value, $Res Function(RewardTotalModel) then) =
      _$RewardTotalModelCopyWithImpl<$Res, RewardTotalModel>;
  @useResult
  $Res call(
      {int week,
      List<RewardModel> stamp,
      List<RewardModel> emotion,
      List<RewardModel> activity});
}

/// @nodoc
class _$RewardTotalModelCopyWithImpl<$Res, $Val extends RewardTotalModel>
    implements $RewardTotalModelCopyWith<$Res> {
  _$RewardTotalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? stamp = null,
    Object? emotion = null,
    Object? activity = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      stamp: null == stamp
          ? _value.stamp
          : stamp // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardTotalModelImplCopyWith<$Res>
    implements $RewardTotalModelCopyWith<$Res> {
  factory _$$RewardTotalModelImplCopyWith(_$RewardTotalModelImpl value,
          $Res Function(_$RewardTotalModelImpl) then) =
      __$$RewardTotalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int week,
      List<RewardModel> stamp,
      List<RewardModel> emotion,
      List<RewardModel> activity});
}

/// @nodoc
class __$$RewardTotalModelImplCopyWithImpl<$Res>
    extends _$RewardTotalModelCopyWithImpl<$Res, _$RewardTotalModelImpl>
    implements _$$RewardTotalModelImplCopyWith<$Res> {
  __$$RewardTotalModelImplCopyWithImpl(_$RewardTotalModelImpl _value,
      $Res Function(_$RewardTotalModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? stamp = null,
    Object? emotion = null,
    Object? activity = null,
  }) {
    return _then(_$RewardTotalModelImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      stamp: null == stamp
          ? _value._stamp
          : stamp // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
      emotion: null == emotion
          ? _value._emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
      activity: null == activity
          ? _value._activity
          : activity // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardTotalModelImpl extends _RewardTotalModel {
  const _$RewardTotalModelImpl(
      {this.week = 0,
      final List<RewardModel> stamp = const [],
      final List<RewardModel> emotion = const [],
      final List<RewardModel> activity = const []})
      : _stamp = stamp,
        _emotion = emotion,
        _activity = activity,
        super._();

  factory _$RewardTotalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardTotalModelImplFromJson(json);

  @override
  @JsonKey()
  final int week;
  final List<RewardModel> _stamp;
  @override
  @JsonKey()
  List<RewardModel> get stamp {
    if (_stamp is EqualUnmodifiableListView) return _stamp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stamp);
  }

  final List<RewardModel> _emotion;
  @override
  @JsonKey()
  List<RewardModel> get emotion {
    if (_emotion is EqualUnmodifiableListView) return _emotion;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotion);
  }

  final List<RewardModel> _activity;
  @override
  @JsonKey()
  List<RewardModel> get activity {
    if (_activity is EqualUnmodifiableListView) return _activity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activity);
  }

  @override
  String toString() {
    return 'RewardTotalModel(week: $week, stamp: $stamp, emotion: $emotion, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardTotalModelImpl &&
            (identical(other.week, week) || other.week == week) &&
            const DeepCollectionEquality().equals(other._stamp, _stamp) &&
            const DeepCollectionEquality().equals(other._emotion, _emotion) &&
            const DeepCollectionEquality().equals(other._activity, _activity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      week,
      const DeepCollectionEquality().hash(_stamp),
      const DeepCollectionEquality().hash(_emotion),
      const DeepCollectionEquality().hash(_activity));

  /// Create a copy of RewardTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardTotalModelImplCopyWith<_$RewardTotalModelImpl> get copyWith =>
      __$$RewardTotalModelImplCopyWithImpl<_$RewardTotalModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardTotalModelImplToJson(
      this,
    );
  }
}

abstract class _RewardTotalModel extends RewardTotalModel {
  const factory _RewardTotalModel(
      {final int week,
      final List<RewardModel> stamp,
      final List<RewardModel> emotion,
      final List<RewardModel> activity}) = _$RewardTotalModelImpl;
  const _RewardTotalModel._() : super._();

  factory _RewardTotalModel.fromJson(Map<String, dynamic> json) =
      _$RewardTotalModelImpl.fromJson;

  @override
  int get week;
  @override
  List<RewardModel> get stamp;
  @override
  List<RewardModel> get emotion;
  @override
  List<RewardModel> get activity;

  /// Create a copy of RewardTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardTotalModelImplCopyWith<_$RewardTotalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
