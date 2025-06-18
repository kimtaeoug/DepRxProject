// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mypage_alarm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageAlarmModel _$MyPageAlarmModelFromJson(Map<String, dynamic> json) {
  return _MyPageAlarmModel.fromJson(json);
}

/// @nodoc
mixin _$MyPageAlarmModel {
  List<List<bool>> get availableTimes => throw _privateConstructorUsedError;

  /// Serializes this MyPageAlarmModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyPageAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyPageAlarmModelCopyWith<MyPageAlarmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageAlarmModelCopyWith<$Res> {
  factory $MyPageAlarmModelCopyWith(
          MyPageAlarmModel value, $Res Function(MyPageAlarmModel) then) =
      _$MyPageAlarmModelCopyWithImpl<$Res, MyPageAlarmModel>;
  @useResult
  $Res call({List<List<bool>> availableTimes});
}

/// @nodoc
class _$MyPageAlarmModelCopyWithImpl<$Res, $Val extends MyPageAlarmModel>
    implements $MyPageAlarmModelCopyWith<$Res> {
  _$MyPageAlarmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPageAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableTimes = null,
  }) {
    return _then(_value.copyWith(
      availableTimes: null == availableTimes
          ? _value.availableTimes
          : availableTimes // ignore: cast_nullable_to_non_nullable
              as List<List<bool>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageAlarmModelImplCopyWith<$Res>
    implements $MyPageAlarmModelCopyWith<$Res> {
  factory _$$MyPageAlarmModelImplCopyWith(_$MyPageAlarmModelImpl value,
          $Res Function(_$MyPageAlarmModelImpl) then) =
      __$$MyPageAlarmModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<bool>> availableTimes});
}

/// @nodoc
class __$$MyPageAlarmModelImplCopyWithImpl<$Res>
    extends _$MyPageAlarmModelCopyWithImpl<$Res, _$MyPageAlarmModelImpl>
    implements _$$MyPageAlarmModelImplCopyWith<$Res> {
  __$$MyPageAlarmModelImplCopyWithImpl(_$MyPageAlarmModelImpl _value,
      $Res Function(_$MyPageAlarmModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPageAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableTimes = null,
  }) {
    return _then(_$MyPageAlarmModelImpl(
      availableTimes: null == availableTimes
          ? _value._availableTimes
          : availableTimes // ignore: cast_nullable_to_non_nullable
              as List<List<bool>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageAlarmModelImpl extends _MyPageAlarmModel {
  const _$MyPageAlarmModelImpl(
      {final List<List<bool>> availableTimes = const []})
      : _availableTimes = availableTimes,
        super._();

  factory _$MyPageAlarmModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageAlarmModelImplFromJson(json);

  final List<List<bool>> _availableTimes;
  @override
  @JsonKey()
  List<List<bool>> get availableTimes {
    if (_availableTimes is EqualUnmodifiableListView) return _availableTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTimes);
  }

  @override
  String toString() {
    return 'MyPageAlarmModel(availableTimes: $availableTimes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageAlarmModelImpl &&
            const DeepCollectionEquality()
                .equals(other._availableTimes, _availableTimes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_availableTimes));

  /// Create a copy of MyPageAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageAlarmModelImplCopyWith<_$MyPageAlarmModelImpl> get copyWith =>
      __$$MyPageAlarmModelImplCopyWithImpl<_$MyPageAlarmModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageAlarmModelImplToJson(
      this,
    );
  }
}

abstract class _MyPageAlarmModel extends MyPageAlarmModel {
  const factory _MyPageAlarmModel({final List<List<bool>> availableTimes}) =
      _$MyPageAlarmModelImpl;
  const _MyPageAlarmModel._() : super._();

  factory _MyPageAlarmModel.fromJson(Map<String, dynamic> json) =
      _$MyPageAlarmModelImpl.fromJson;

  @override
  List<List<bool>> get availableTimes;

  /// Create a copy of MyPageAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPageAlarmModelImplCopyWith<_$MyPageAlarmModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
