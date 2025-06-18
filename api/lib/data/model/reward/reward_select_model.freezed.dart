// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_select_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RewardSelectModel _$RewardSelectModelFromJson(Map<String, dynamic> json) {
  return _RewardSelectModel.fromJson(json);
}

/// @nodoc
mixin _$RewardSelectModel {
  int get week => throw _privateConstructorUsedError;
  String get emotionImage => throw _privateConstructorUsedError;
  String get activityImage => throw _privateConstructorUsedError;
  List<RewardModel> get emotion => throw _privateConstructorUsedError;
  List<RewardModel> get activity => throw _privateConstructorUsedError;

  /// Serializes this RewardSelectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardSelectModelCopyWith<RewardSelectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardSelectModelCopyWith<$Res> {
  factory $RewardSelectModelCopyWith(
          RewardSelectModel value, $Res Function(RewardSelectModel) then) =
      _$RewardSelectModelCopyWithImpl<$Res, RewardSelectModel>;
  @useResult
  $Res call(
      {int week,
      String emotionImage,
      String activityImage,
      List<RewardModel> emotion,
      List<RewardModel> activity});
}

/// @nodoc
class _$RewardSelectModelCopyWithImpl<$Res, $Val extends RewardSelectModel>
    implements $RewardSelectModelCopyWith<$Res> {
  _$RewardSelectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? emotionImage = null,
    Object? activityImage = null,
    Object? emotion = null,
    Object? activity = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      emotionImage: null == emotionImage
          ? _value.emotionImage
          : emotionImage // ignore: cast_nullable_to_non_nullable
              as String,
      activityImage: null == activityImage
          ? _value.activityImage
          : activityImage // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$RewardSelectModelImplCopyWith<$Res>
    implements $RewardSelectModelCopyWith<$Res> {
  factory _$$RewardSelectModelImplCopyWith(_$RewardSelectModelImpl value,
          $Res Function(_$RewardSelectModelImpl) then) =
      __$$RewardSelectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int week,
      String emotionImage,
      String activityImage,
      List<RewardModel> emotion,
      List<RewardModel> activity});
}

/// @nodoc
class __$$RewardSelectModelImplCopyWithImpl<$Res>
    extends _$RewardSelectModelCopyWithImpl<$Res, _$RewardSelectModelImpl>
    implements _$$RewardSelectModelImplCopyWith<$Res> {
  __$$RewardSelectModelImplCopyWithImpl(_$RewardSelectModelImpl _value,
      $Res Function(_$RewardSelectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? emotionImage = null,
    Object? activityImage = null,
    Object? emotion = null,
    Object? activity = null,
  }) {
    return _then(_$RewardSelectModelImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      emotionImage: null == emotionImage
          ? _value.emotionImage
          : emotionImage // ignore: cast_nullable_to_non_nullable
              as String,
      activityImage: null == activityImage
          ? _value.activityImage
          : activityImage // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$RewardSelectModelImpl extends _RewardSelectModel {
  const _$RewardSelectModelImpl(
      {this.week = 0,
      this.emotionImage = '',
      this.activityImage = '',
      final List<RewardModel> emotion = const [],
      final List<RewardModel> activity = const []})
      : _emotion = emotion,
        _activity = activity,
        super._();

  factory _$RewardSelectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardSelectModelImplFromJson(json);

  @override
  @JsonKey()
  final int week;
  @override
  @JsonKey()
  final String emotionImage;
  @override
  @JsonKey()
  final String activityImage;
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
    return 'RewardSelectModel(week: $week, emotionImage: $emotionImage, activityImage: $activityImage, emotion: $emotion, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardSelectModelImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.emotionImage, emotionImage) ||
                other.emotionImage == emotionImage) &&
            (identical(other.activityImage, activityImage) ||
                other.activityImage == activityImage) &&
            const DeepCollectionEquality().equals(other._emotion, _emotion) &&
            const DeepCollectionEquality().equals(other._activity, _activity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      week,
      emotionImage,
      activityImage,
      const DeepCollectionEquality().hash(_emotion),
      const DeepCollectionEquality().hash(_activity));

  /// Create a copy of RewardSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardSelectModelImplCopyWith<_$RewardSelectModelImpl> get copyWith =>
      __$$RewardSelectModelImplCopyWithImpl<_$RewardSelectModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardSelectModelImplToJson(
      this,
    );
  }
}

abstract class _RewardSelectModel extends RewardSelectModel {
  const factory _RewardSelectModel(
      {final int week,
      final String emotionImage,
      final String activityImage,
      final List<RewardModel> emotion,
      final List<RewardModel> activity}) = _$RewardSelectModelImpl;
  const _RewardSelectModel._() : super._();

  factory _RewardSelectModel.fromJson(Map<String, dynamic> json) =
      _$RewardSelectModelImpl.fromJson;

  @override
  int get week;
  @override
  String get emotionImage;
  @override
  String get activityImage;
  @override
  List<RewardModel> get emotion;
  @override
  List<RewardModel> get activity;

  /// Create a copy of RewardSelectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardSelectModelImplCopyWith<_$RewardSelectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
