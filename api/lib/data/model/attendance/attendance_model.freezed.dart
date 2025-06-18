// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) {
  return _AttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceModel {
  String get attendanceWeek => throw _privateConstructorUsedError;
  List<AttendanceItemModel> get attendance =>
      throw _privateConstructorUsedError;

  /// Serializes this AttendanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceModelCopyWith<AttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceModelCopyWith<$Res> {
  factory $AttendanceModelCopyWith(
          AttendanceModel value, $Res Function(AttendanceModel) then) =
      _$AttendanceModelCopyWithImpl<$Res, AttendanceModel>;
  @useResult
  $Res call({String attendanceWeek, List<AttendanceItemModel> attendance});
}

/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res, $Val extends AttendanceModel>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceWeek = null,
    Object? attendance = null,
  }) {
    return _then(_value.copyWith(
      attendanceWeek: null == attendanceWeek
          ? _value.attendanceWeek
          : attendanceWeek // ignore: cast_nullable_to_non_nullable
              as String,
      attendance: null == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as List<AttendanceItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceModelImplCopyWith<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  factory _$$AttendanceModelImplCopyWith(_$AttendanceModelImpl value,
          $Res Function(_$AttendanceModelImpl) then) =
      __$$AttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String attendanceWeek, List<AttendanceItemModel> attendance});
}

/// @nodoc
class __$$AttendanceModelImplCopyWithImpl<$Res>
    extends _$AttendanceModelCopyWithImpl<$Res, _$AttendanceModelImpl>
    implements _$$AttendanceModelImplCopyWith<$Res> {
  __$$AttendanceModelImplCopyWithImpl(
      _$AttendanceModelImpl _value, $Res Function(_$AttendanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceWeek = null,
    Object? attendance = null,
  }) {
    return _then(_$AttendanceModelImpl(
      attendanceWeek: null == attendanceWeek
          ? _value.attendanceWeek
          : attendanceWeek // ignore: cast_nullable_to_non_nullable
              as String,
      attendance: null == attendance
          ? _value._attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as List<AttendanceItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceModelImpl extends _AttendanceModel {
  const _$AttendanceModelImpl(
      {this.attendanceWeek = '',
      final List<AttendanceItemModel> attendance = const []})
      : _attendance = attendance,
        super._();

  factory _$AttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceModelImplFromJson(json);

  @override
  @JsonKey()
  final String attendanceWeek;
  final List<AttendanceItemModel> _attendance;
  @override
  @JsonKey()
  List<AttendanceItemModel> get attendance {
    if (_attendance is EqualUnmodifiableListView) return _attendance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendance);
  }

  @override
  String toString() {
    return 'AttendanceModel(attendanceWeek: $attendanceWeek, attendance: $attendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceModelImpl &&
            (identical(other.attendanceWeek, attendanceWeek) ||
                other.attendanceWeek == attendanceWeek) &&
            const DeepCollectionEquality()
                .equals(other._attendance, _attendance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attendanceWeek,
      const DeepCollectionEquality().hash(_attendance));

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      __$$AttendanceModelImplCopyWithImpl<_$AttendanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceModel extends AttendanceModel {
  const factory _AttendanceModel(
      {final String attendanceWeek,
      final List<AttendanceItemModel> attendance}) = _$AttendanceModelImpl;
  const _AttendanceModel._() : super._();

  factory _AttendanceModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceModelImpl.fromJson;

  @override
  String get attendanceWeek;
  @override
  List<AttendanceItemModel> get attendance;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
