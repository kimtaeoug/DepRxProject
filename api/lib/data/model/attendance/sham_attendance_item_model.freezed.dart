// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sham_attendance_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShamAttendanceItemModel _$ShamAttendanceItemModelFromJson(
    Map<String, dynamic> json) {
  return _ShamAttendanceItemModel.fromJson(json);
}

/// @nodoc
mixin _$ShamAttendanceItemModel {
  int get day => throw _privateConstructorUsedError;
  List<TodayTaskItemModel> get todayTaskList =>
      throw _privateConstructorUsedError;
  bool get attended => throw _privateConstructorUsedError;

  /// Serializes this ShamAttendanceItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShamAttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShamAttendanceItemModelCopyWith<ShamAttendanceItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShamAttendanceItemModelCopyWith<$Res> {
  factory $ShamAttendanceItemModelCopyWith(ShamAttendanceItemModel value,
          $Res Function(ShamAttendanceItemModel) then) =
      _$ShamAttendanceItemModelCopyWithImpl<$Res, ShamAttendanceItemModel>;
  @useResult
  $Res call({int day, List<TodayTaskItemModel> todayTaskList, bool attended});
}

/// @nodoc
class _$ShamAttendanceItemModelCopyWithImpl<$Res,
        $Val extends ShamAttendanceItemModel>
    implements $ShamAttendanceItemModelCopyWith<$Res> {
  _$ShamAttendanceItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShamAttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? todayTaskList = null,
    Object? attended = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      todayTaskList: null == todayTaskList
          ? _value.todayTaskList
          : todayTaskList // ignore: cast_nullable_to_non_nullable
              as List<TodayTaskItemModel>,
      attended: null == attended
          ? _value.attended
          : attended // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShamAttendanceItemModelImplCopyWith<$Res>
    implements $ShamAttendanceItemModelCopyWith<$Res> {
  factory _$$ShamAttendanceItemModelImplCopyWith(
          _$ShamAttendanceItemModelImpl value,
          $Res Function(_$ShamAttendanceItemModelImpl) then) =
      __$$ShamAttendanceItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, List<TodayTaskItemModel> todayTaskList, bool attended});
}

/// @nodoc
class __$$ShamAttendanceItemModelImplCopyWithImpl<$Res>
    extends _$ShamAttendanceItemModelCopyWithImpl<$Res,
        _$ShamAttendanceItemModelImpl>
    implements _$$ShamAttendanceItemModelImplCopyWith<$Res> {
  __$$ShamAttendanceItemModelImplCopyWithImpl(
      _$ShamAttendanceItemModelImpl _value,
      $Res Function(_$ShamAttendanceItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShamAttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? todayTaskList = null,
    Object? attended = null,
  }) {
    return _then(_$ShamAttendanceItemModelImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      todayTaskList: null == todayTaskList
          ? _value._todayTaskList
          : todayTaskList // ignore: cast_nullable_to_non_nullable
              as List<TodayTaskItemModel>,
      attended: null == attended
          ? _value.attended
          : attended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShamAttendanceItemModelImpl extends _ShamAttendanceItemModel {
  const _$ShamAttendanceItemModelImpl(
      {this.day = 0,
      final List<TodayTaskItemModel> todayTaskList = const [],
      this.attended = false})
      : _todayTaskList = todayTaskList,
        super._();

  factory _$ShamAttendanceItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShamAttendanceItemModelImplFromJson(json);

  @override
  @JsonKey()
  final int day;
  final List<TodayTaskItemModel> _todayTaskList;
  @override
  @JsonKey()
  List<TodayTaskItemModel> get todayTaskList {
    if (_todayTaskList is EqualUnmodifiableListView) return _todayTaskList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayTaskList);
  }

  @override
  @JsonKey()
  final bool attended;

  @override
  String toString() {
    return 'ShamAttendanceItemModel(day: $day, todayTaskList: $todayTaskList, attended: $attended)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShamAttendanceItemModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality()
                .equals(other._todayTaskList, _todayTaskList) &&
            (identical(other.attended, attended) ||
                other.attended == attended));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day,
      const DeepCollectionEquality().hash(_todayTaskList), attended);

  /// Create a copy of ShamAttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShamAttendanceItemModelImplCopyWith<_$ShamAttendanceItemModelImpl>
      get copyWith => __$$ShamAttendanceItemModelImplCopyWithImpl<
          _$ShamAttendanceItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShamAttendanceItemModelImplToJson(
      this,
    );
  }
}

abstract class _ShamAttendanceItemModel extends ShamAttendanceItemModel {
  const factory _ShamAttendanceItemModel(
      {final int day,
      final List<TodayTaskItemModel> todayTaskList,
      final bool attended}) = _$ShamAttendanceItemModelImpl;
  const _ShamAttendanceItemModel._() : super._();

  factory _ShamAttendanceItemModel.fromJson(Map<String, dynamic> json) =
      _$ShamAttendanceItemModelImpl.fromJson;

  @override
  int get day;
  @override
  List<TodayTaskItemModel> get todayTaskList;
  @override
  bool get attended;

  /// Create a copy of ShamAttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShamAttendanceItemModelImplCopyWith<_$ShamAttendanceItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
