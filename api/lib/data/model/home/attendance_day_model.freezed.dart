// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceDayModel _$AttendanceDayModelFromJson(Map<String, dynamic> json) {
  return _AttendanceDayModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDayModel {
  int get day => throw _privateConstructorUsedError;
  AttendDayType get type => throw _privateConstructorUsedError;

  /// Serializes this AttendanceDayModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceDayModelCopyWith<AttendanceDayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDayModelCopyWith<$Res> {
  factory $AttendanceDayModelCopyWith(
          AttendanceDayModel value, $Res Function(AttendanceDayModel) then) =
      _$AttendanceDayModelCopyWithImpl<$Res, AttendanceDayModel>;
  @useResult
  $Res call({int day, AttendDayType type});
}

/// @nodoc
class _$AttendanceDayModelCopyWithImpl<$Res, $Val extends AttendanceDayModel>
    implements $AttendanceDayModelCopyWith<$Res> {
  _$AttendanceDayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AttendDayType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDayModelImplCopyWith<$Res>
    implements $AttendanceDayModelCopyWith<$Res> {
  factory _$$AttendanceDayModelImplCopyWith(_$AttendanceDayModelImpl value,
          $Res Function(_$AttendanceDayModelImpl) then) =
      __$$AttendanceDayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, AttendDayType type});
}

/// @nodoc
class __$$AttendanceDayModelImplCopyWithImpl<$Res>
    extends _$AttendanceDayModelCopyWithImpl<$Res, _$AttendanceDayModelImpl>
    implements _$$AttendanceDayModelImplCopyWith<$Res> {
  __$$AttendanceDayModelImplCopyWithImpl(_$AttendanceDayModelImpl _value,
      $Res Function(_$AttendanceDayModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? type = null,
  }) {
    return _then(_$AttendanceDayModelImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AttendDayType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceDayModelImpl extends _AttendanceDayModel {
  const _$AttendanceDayModelImpl({this.day = 0, this.type = AttendDayType.none})
      : super._();

  factory _$AttendanceDayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDayModelImplFromJson(json);

  @override
  @JsonKey()
  final int day;
  @override
  @JsonKey()
  final AttendDayType type;

  @override
  String toString() {
    return 'AttendanceDayModel(day: $day, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDayModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, type);

  /// Create a copy of AttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDayModelImplCopyWith<_$AttendanceDayModelImpl> get copyWith =>
      __$$AttendanceDayModelImplCopyWithImpl<_$AttendanceDayModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceDayModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceDayModel extends AttendanceDayModel {
  const factory _AttendanceDayModel({final int day, final AttendDayType type}) =
      _$AttendanceDayModelImpl;
  const _AttendanceDayModel._() : super._();

  factory _AttendanceDayModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceDayModelImpl.fromJson;

  @override
  int get day;
  @override
  AttendDayType get type;

  /// Create a copy of AttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceDayModelImplCopyWith<_$AttendanceDayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
