// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StepItemModel _$StepItemModelFromJson(Map<String, dynamic> json) {
  return _StepItemModel.fromJson(json);
}

/// @nodoc
mixin _$StepItemModel {
  String get imagePath => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get week => throw _privateConstructorUsedError;
  List<RewardModel> get rewardList => throw _privateConstructorUsedError;

  /// Serializes this StepItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StepItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepItemModelCopyWith<StepItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepItemModelCopyWith<$Res> {
  factory $StepItemModelCopyWith(
          StepItemModel value, $Res Function(StepItemModel) then) =
      _$StepItemModelCopyWithImpl<$Res, StepItemModel>;
  @useResult
  $Res call(
      {String imagePath,
      String value,
      String date,
      int week,
      List<RewardModel> rewardList});
}

/// @nodoc
class _$StepItemModelCopyWithImpl<$Res, $Val extends StepItemModel>
    implements $StepItemModelCopyWith<$Res> {
  _$StepItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? value = null,
    Object? date = null,
    Object? week = null,
    Object? rewardList = null,
  }) {
    return _then(_value.copyWith(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      rewardList: null == rewardList
          ? _value.rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepItemModelImplCopyWith<$Res>
    implements $StepItemModelCopyWith<$Res> {
  factory _$$StepItemModelImplCopyWith(
          _$StepItemModelImpl value, $Res Function(_$StepItemModelImpl) then) =
      __$$StepItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imagePath,
      String value,
      String date,
      int week,
      List<RewardModel> rewardList});
}

/// @nodoc
class __$$StepItemModelImplCopyWithImpl<$Res>
    extends _$StepItemModelCopyWithImpl<$Res, _$StepItemModelImpl>
    implements _$$StepItemModelImplCopyWith<$Res> {
  __$$StepItemModelImplCopyWithImpl(
      _$StepItemModelImpl _value, $Res Function(_$StepItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StepItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? value = null,
    Object? date = null,
    Object? week = null,
    Object? rewardList = null,
  }) {
    return _then(_$StepItemModelImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      rewardList: null == rewardList
          ? _value._rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepItemModelImpl extends _StepItemModel {
  const _$StepItemModelImpl(
      {this.imagePath = '',
      this.value = '',
      this.date = '',
      this.week = 0,
      final List<RewardModel> rewardList = const []})
      : _rewardList = rewardList,
        super._();

  factory _$StepItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final int week;
  final List<RewardModel> _rewardList;
  @override
  @JsonKey()
  List<RewardModel> get rewardList {
    if (_rewardList is EqualUnmodifiableListView) return _rewardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewardList);
  }

  @override
  String toString() {
    return 'StepItemModel(imagePath: $imagePath, value: $value, date: $date, week: $week, rewardList: $rewardList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepItemModelImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.week, week) || other.week == week) &&
            const DeepCollectionEquality()
                .equals(other._rewardList, _rewardList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imagePath, value, date, week,
      const DeepCollectionEquality().hash(_rewardList));

  /// Create a copy of StepItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepItemModelImplCopyWith<_$StepItemModelImpl> get copyWith =>
      __$$StepItemModelImplCopyWithImpl<_$StepItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepItemModelImplToJson(
      this,
    );
  }
}

abstract class _StepItemModel extends StepItemModel {
  const factory _StepItemModel(
      {final String imagePath,
      final String value,
      final String date,
      final int week,
      final List<RewardModel> rewardList}) = _$StepItemModelImpl;
  const _StepItemModel._() : super._();

  factory _StepItemModel.fromJson(Map<String, dynamic> json) =
      _$StepItemModelImpl.fromJson;

  @override
  String get imagePath;
  @override
  String get value;
  @override
  String get date;
  @override
  int get week;
  @override
  List<RewardModel> get rewardList;

  /// Create a copy of StepItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepItemModelImplCopyWith<_$StepItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
