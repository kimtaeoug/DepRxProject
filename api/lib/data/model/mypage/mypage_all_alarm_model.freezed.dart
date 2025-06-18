// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mypage_all_alarm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageAllAlarmModel _$MyPageAllAlarmModelFromJson(Map<String, dynamic> json) {
  return _MyPageAllAlarmModel.fromJson(json);
}

/// @nodoc
mixin _$MyPageAllAlarmModel {
  bool get allAlarm => throw _privateConstructorUsedError;

  /// Serializes this MyPageAllAlarmModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyPageAllAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyPageAllAlarmModelCopyWith<MyPageAllAlarmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageAllAlarmModelCopyWith<$Res> {
  factory $MyPageAllAlarmModelCopyWith(
          MyPageAllAlarmModel value, $Res Function(MyPageAllAlarmModel) then) =
      _$MyPageAllAlarmModelCopyWithImpl<$Res, MyPageAllAlarmModel>;
  @useResult
  $Res call({bool allAlarm});
}

/// @nodoc
class _$MyPageAllAlarmModelCopyWithImpl<$Res, $Val extends MyPageAllAlarmModel>
    implements $MyPageAllAlarmModelCopyWith<$Res> {
  _$MyPageAllAlarmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPageAllAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAlarm = null,
  }) {
    return _then(_value.copyWith(
      allAlarm: null == allAlarm
          ? _value.allAlarm
          : allAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageAllAlarmModelImplCopyWith<$Res>
    implements $MyPageAllAlarmModelCopyWith<$Res> {
  factory _$$MyPageAllAlarmModelImplCopyWith(_$MyPageAllAlarmModelImpl value,
          $Res Function(_$MyPageAllAlarmModelImpl) then) =
      __$$MyPageAllAlarmModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool allAlarm});
}

/// @nodoc
class __$$MyPageAllAlarmModelImplCopyWithImpl<$Res>
    extends _$MyPageAllAlarmModelCopyWithImpl<$Res, _$MyPageAllAlarmModelImpl>
    implements _$$MyPageAllAlarmModelImplCopyWith<$Res> {
  __$$MyPageAllAlarmModelImplCopyWithImpl(_$MyPageAllAlarmModelImpl _value,
      $Res Function(_$MyPageAllAlarmModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPageAllAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAlarm = null,
  }) {
    return _then(_$MyPageAllAlarmModelImpl(
      allAlarm: null == allAlarm
          ? _value.allAlarm
          : allAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageAllAlarmModelImpl extends _MyPageAllAlarmModel {
  const _$MyPageAllAlarmModelImpl({this.allAlarm = true}) : super._();

  factory _$MyPageAllAlarmModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageAllAlarmModelImplFromJson(json);

  @override
  @JsonKey()
  final bool allAlarm;

  @override
  String toString() {
    return 'MyPageAllAlarmModel(allAlarm: $allAlarm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageAllAlarmModelImpl &&
            (identical(other.allAlarm, allAlarm) ||
                other.allAlarm == allAlarm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allAlarm);

  /// Create a copy of MyPageAllAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageAllAlarmModelImplCopyWith<_$MyPageAllAlarmModelImpl> get copyWith =>
      __$$MyPageAllAlarmModelImplCopyWithImpl<_$MyPageAllAlarmModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageAllAlarmModelImplToJson(
      this,
    );
  }
}

abstract class _MyPageAllAlarmModel extends MyPageAllAlarmModel {
  const factory _MyPageAllAlarmModel({final bool allAlarm}) =
      _$MyPageAllAlarmModelImpl;
  const _MyPageAllAlarmModel._() : super._();

  factory _MyPageAllAlarmModel.fromJson(Map<String, dynamic> json) =
      _$MyPageAllAlarmModelImpl.fromJson;

  @override
  bool get allAlarm;

  /// Create a copy of MyPageAllAlarmModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPageAllAlarmModelImplCopyWith<_$MyPageAllAlarmModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
