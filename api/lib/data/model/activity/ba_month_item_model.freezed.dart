// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ba_month_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BAMonthItemModel _$BAMonthItemModelFromJson(Map<String, dynamic> json) {
  return _BAMonthItemModel.fromJson(json);
}

/// @nodoc
mixin _$BAMonthItemModel {
  int get day => throw _privateConstructorUsedError;
  List<BAModel> get baList => throw _privateConstructorUsedError;

  /// Serializes this BAMonthItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BAMonthItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BAMonthItemModelCopyWith<BAMonthItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BAMonthItemModelCopyWith<$Res> {
  factory $BAMonthItemModelCopyWith(
          BAMonthItemModel value, $Res Function(BAMonthItemModel) then) =
      _$BAMonthItemModelCopyWithImpl<$Res, BAMonthItemModel>;
  @useResult
  $Res call({int day, List<BAModel> baList});
}

/// @nodoc
class _$BAMonthItemModelCopyWithImpl<$Res, $Val extends BAMonthItemModel>
    implements $BAMonthItemModelCopyWith<$Res> {
  _$BAMonthItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BAMonthItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? baList = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BAMonthItemModelImplCopyWith<$Res>
    implements $BAMonthItemModelCopyWith<$Res> {
  factory _$$BAMonthItemModelImplCopyWith(_$BAMonthItemModelImpl value,
          $Res Function(_$BAMonthItemModelImpl) then) =
      __$$BAMonthItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, List<BAModel> baList});
}

/// @nodoc
class __$$BAMonthItemModelImplCopyWithImpl<$Res>
    extends _$BAMonthItemModelCopyWithImpl<$Res, _$BAMonthItemModelImpl>
    implements _$$BAMonthItemModelImplCopyWith<$Res> {
  __$$BAMonthItemModelImplCopyWithImpl(_$BAMonthItemModelImpl _value,
      $Res Function(_$BAMonthItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BAMonthItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? baList = null,
  }) {
    return _then(_$BAMonthItemModelImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      baList: null == baList
          ? _value._baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<BAModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BAMonthItemModelImpl extends _BAMonthItemModel {
  const _$BAMonthItemModelImpl(
      {this.day = 0, final List<BAModel> baList = const []})
      : _baList = baList,
        super._();

  factory _$BAMonthItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BAMonthItemModelImplFromJson(json);

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
  String toString() {
    return 'BAMonthItemModel(day: $day, baList: $baList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BAMonthItemModelImpl &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other._baList, _baList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, day, const DeepCollectionEquality().hash(_baList));

  /// Create a copy of BAMonthItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BAMonthItemModelImplCopyWith<_$BAMonthItemModelImpl> get copyWith =>
      __$$BAMonthItemModelImplCopyWithImpl<_$BAMonthItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BAMonthItemModelImplToJson(
      this,
    );
  }
}

abstract class _BAMonthItemModel extends BAMonthItemModel {
  const factory _BAMonthItemModel({final int day, final List<BAModel> baList}) =
      _$BAMonthItemModelImpl;
  const _BAMonthItemModel._() : super._();

  factory _BAMonthItemModel.fromJson(Map<String, dynamic> json) =
      _$BAMonthItemModelImpl.fromJson;

  @override
  int get day;
  @override
  List<BAModel> get baList;

  /// Create a copy of BAMonthItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BAMonthItemModelImplCopyWith<_$BAMonthItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
