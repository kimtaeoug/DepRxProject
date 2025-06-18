// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceItemModel _$AttendanceItemModelFromJson(Map<String, dynamic> json) {
  return _AttendanceItemModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceItemModel {
  int get day => throw _privateConstructorUsedError;
  List<BAModel> get baList => throw _privateConstructorUsedError;
  bool get attended => throw _privateConstructorUsedError;

  /// Serializes this AttendanceItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceItemModelCopyWith<AttendanceItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceItemModelCopyWith<$Res> {
  factory $AttendanceItemModelCopyWith(
          AttendanceItemModel value, $Res Function(AttendanceItemModel) then) =
      _$AttendanceItemModelCopyWithImpl<$Res, AttendanceItemModel>;
  @useResult
  $Res call({int day, List<BAModel> baList, bool attended});
}

/// @nodoc
class _$AttendanceItemModelCopyWithImpl<$Res, $Val extends AttendanceItemModel>
    implements $AttendanceItemModelCopyWith<$Res> {
  _$AttendanceItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? baList = null,
    Object? attended = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      baList: null == baList
          ? _value.baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<BAModel>,
      attended: null == attended
          ? _value.attended
          : attended // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceItemModelImplCopyWith<$Res>
    implements $AttendanceItemModelCopyWith<$Res> {
  factory _$$AttendanceItemModelImplCopyWith(_$AttendanceItemModelImpl value,
          $Res Function(_$AttendanceItemModelImpl) then) =
      __$$AttendanceItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, List<BAModel> baList, bool attended});
}

/// @nodoc
class __$$AttendanceItemModelImplCopyWithImpl<$Res>
    extends _$AttendanceItemModelCopyWithImpl<$Res, _$AttendanceItemModelImpl>
    implements _$$AttendanceItemModelImplCopyWith<$Res> {
  __$$AttendanceItemModelImplCopyWithImpl(_$AttendanceItemModelImpl _value,
      $Res Function(_$AttendanceItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? baList = null,
    Object? attended = null,
  }) {
    return _then(_$AttendanceItemModelImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      baList: null == baList
          ? _value._baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<BAModel>,
      attended: null == attended
          ? _value.attended
          : attended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceItemModelImpl extends _AttendanceItemModel {
  const _$AttendanceItemModelImpl(
      {this.day = 0,
      final List<BAModel> baList = const [],
      this.attended = false})
      : _baList = baList,
        super._();

  factory _$AttendanceItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceItemModelImplFromJson(json);

  @override
  @JsonKey()
  final int day;
  final List<BAModel> _baList;
  @override
  @JsonKey()
  List<BAModel> get baList {
    if (_baList is EqualUnmodifiableListView) return _baList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_baList);
  }

  @override
  @JsonKey()
  final bool attended;

  @override
  String toString() {
    return 'AttendanceItemModel(day: $day, baList: $baList, attended: $attended)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceItemModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other._baList, _baList) &&
            (identical(other.attended, attended) ||
                other.attended == attended));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, day, const DeepCollectionEquality().hash(_baList), attended);

  /// Create a copy of AttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceItemModelImplCopyWith<_$AttendanceItemModelImpl> get copyWith =>
      __$$AttendanceItemModelImplCopyWithImpl<_$AttendanceItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceItemModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceItemModel extends AttendanceItemModel {
  const factory _AttendanceItemModel(
      {final int day,
      final List<BAModel> baList,
      final bool attended}) = _$AttendanceItemModelImpl;
  const _AttendanceItemModel._() : super._();

  factory _AttendanceItemModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceItemModelImpl.fromJson;

  @override
  int get day;
  @override
  List<BAModel> get baList;
  @override
  bool get attended;

  /// Create a copy of AttendanceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceItemModelImplCopyWith<_$AttendanceItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
