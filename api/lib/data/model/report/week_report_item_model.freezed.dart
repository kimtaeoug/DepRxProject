// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_report_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeekReportItemModel _$WeekReportItemModelFromJson(Map<String, dynamic> json) {
  return _WeekReportItemModel.fromJson(json);
}

/// @nodoc
mixin _$WeekReportItemModel {
  int get week => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;

  /// Serializes this WeekReportItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeekReportItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekReportItemModelCopyWith<WeekReportItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekReportItemModelCopyWith<$Res> {
  factory $WeekReportItemModelCopyWith(
          WeekReportItemModel value, $Res Function(WeekReportItemModel) then) =
      _$WeekReportItemModelCopyWithImpl<$Res, WeekReportItemModel>;
  @useResult
  $Res call({int week, int rate});
}

/// @nodoc
class _$WeekReportItemModelCopyWithImpl<$Res, $Val extends WeekReportItemModel>
    implements $WeekReportItemModelCopyWith<$Res> {
  _$WeekReportItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekReportItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekReportItemModelImplCopyWith<$Res>
    implements $WeekReportItemModelCopyWith<$Res> {
  factory _$$WeekReportItemModelImplCopyWith(_$WeekReportItemModelImpl value,
          $Res Function(_$WeekReportItemModelImpl) then) =
      __$$WeekReportItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int week, int rate});
}

/// @nodoc
class __$$WeekReportItemModelImplCopyWithImpl<$Res>
    extends _$WeekReportItemModelCopyWithImpl<$Res, _$WeekReportItemModelImpl>
    implements _$$WeekReportItemModelImplCopyWith<$Res> {
  __$$WeekReportItemModelImplCopyWithImpl(_$WeekReportItemModelImpl _value,
      $Res Function(_$WeekReportItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekReportItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? rate = null,
  }) {
    return _then(_$WeekReportItemModelImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekReportItemModelImpl extends _WeekReportItemModel {
  const _$WeekReportItemModelImpl({this.week = 0, this.rate = 0}) : super._();

  factory _$WeekReportItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekReportItemModelImplFromJson(json);

  @override
  @JsonKey()
  final int week;
  @override
  @JsonKey()
  final int rate;

  @override
  String toString() {
    return 'WeekReportItemModel(week: $week, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekReportItemModelImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, week, rate);

  /// Create a copy of WeekReportItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekReportItemModelImplCopyWith<_$WeekReportItemModelImpl> get copyWith =>
      __$$WeekReportItemModelImplCopyWithImpl<_$WeekReportItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekReportItemModelImplToJson(
      this,
    );
  }
}

abstract class _WeekReportItemModel extends WeekReportItemModel {
  const factory _WeekReportItemModel({final int week, final int rate}) =
      _$WeekReportItemModelImpl;
  const _WeekReportItemModel._() : super._();

  factory _WeekReportItemModel.fromJson(Map<String, dynamic> json) =
      _$WeekReportItemModelImpl.fromJson;

  @override
  int get week;
  @override
  int get rate;

  /// Create a copy of WeekReportItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekReportItemModelImplCopyWith<_$WeekReportItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
