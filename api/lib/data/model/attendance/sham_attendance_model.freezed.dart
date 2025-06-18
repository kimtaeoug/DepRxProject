// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sham_attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShamAttendanceModel _$ShamAttendanceModelFromJson(Map<String, dynamic> json) {
  return _ShamAttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$ShamAttendanceModel {
  String get attendanceWeek => throw _privateConstructorUsedError;
  List<ShamAttendanceItemModel> get attendance =>
      throw _privateConstructorUsedError;

  /// Serializes this ShamAttendanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShamAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShamAttendanceModelCopyWith<ShamAttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShamAttendanceModelCopyWith<$Res> {
  factory $ShamAttendanceModelCopyWith(
          ShamAttendanceModel value, $Res Function(ShamAttendanceModel) then) =
      _$ShamAttendanceModelCopyWithImpl<$Res, ShamAttendanceModel>;
  @useResult
  $Res call({String attendanceWeek, List<ShamAttendanceItemModel> attendance});
}

/// @nodoc
class _$ShamAttendanceModelCopyWithImpl<$Res, $Val extends ShamAttendanceModel>
    implements $ShamAttendanceModelCopyWith<$Res> {
  _$ShamAttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShamAttendanceModel
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
              as List<ShamAttendanceItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShamAttendanceModelImplCopyWith<$Res>
    implements $ShamAttendanceModelCopyWith<$Res> {
  factory _$$ShamAttendanceModelImplCopyWith(_$ShamAttendanceModelImpl value,
          $Res Function(_$ShamAttendanceModelImpl) then) =
      __$$ShamAttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String attendanceWeek, List<ShamAttendanceItemModel> attendance});
}

/// @nodoc
class __$$ShamAttendanceModelImplCopyWithImpl<$Res>
    extends _$ShamAttendanceModelCopyWithImpl<$Res, _$ShamAttendanceModelImpl>
    implements _$$ShamAttendanceModelImplCopyWith<$Res> {
  __$$ShamAttendanceModelImplCopyWithImpl(_$ShamAttendanceModelImpl _value,
      $Res Function(_$ShamAttendanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShamAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceWeek = null,
    Object? attendance = null,
  }) {
    return _then(_$ShamAttendanceModelImpl(
      attendanceWeek: null == attendanceWeek
          ? _value.attendanceWeek
          : attendanceWeek // ignore: cast_nullable_to_non_nullable
              as String,
      attendance: null == attendance
          ? _value._attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as List<ShamAttendanceItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShamAttendanceModelImpl extends _ShamAttendanceModel {
  const _$ShamAttendanceModelImpl(
      {this.attendanceWeek = '',
      final List<ShamAttendanceItemModel> attendance = const []})
      : _attendance = attendance,
        super._();

  factory _$ShamAttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShamAttendanceModelImplFromJson(json);

  @override
  @JsonKey()
  final String attendanceWeek;
  final List<ShamAttendanceItemModel> _attendance;
  @override
  @JsonKey()
  List<ShamAttendanceItemModel> get attendance {
    if (_attendance is EqualUnmodifiableListView) return _attendance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendance);
  }

  @override
  String toString() {
    return 'ShamAttendanceModel(attendanceWeek: $attendanceWeek, attendance: $attendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShamAttendanceModelImpl &&
            (identical(other.attendanceWeek, attendanceWeek) ||
                other.attendanceWeek == attendanceWeek) &&
            const DeepCollectionEquality()
                .equals(other._attendance, _attendance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attendanceWeek,
      const DeepCollectionEquality().hash(_attendance));

  /// Create a copy of ShamAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShamAttendanceModelImplCopyWith<_$ShamAttendanceModelImpl> get copyWith =>
      __$$ShamAttendanceModelImplCopyWithImpl<_$ShamAttendanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShamAttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _ShamAttendanceModel extends ShamAttendanceModel {
  const factory _ShamAttendanceModel(
          {final String attendanceWeek,
          final List<ShamAttendanceItemModel> attendance}) =
      _$ShamAttendanceModelImpl;
  const _ShamAttendanceModel._() : super._();

  factory _ShamAttendanceModel.fromJson(Map<String, dynamic> json) =
      _$ShamAttendanceModelImpl.fromJson;

  @override
  String get attendanceWeek;
  @override
  List<ShamAttendanceItemModel> get attendance;

  /// Create a copy of ShamAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShamAttendanceModelImplCopyWith<_$ShamAttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
