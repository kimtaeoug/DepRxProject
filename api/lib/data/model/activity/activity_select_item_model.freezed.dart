// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_select_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivitySelectItemModel _$ActivitySelectItemModelFromJson(
    Map<String, dynamic> json) {
  return _ActivitySelectItemModel.fromJson(json);
}

/// @nodoc
mixin _$ActivitySelectItemModel {
  String get weekOfDay => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<BAModel> get baList => throw _privateConstructorUsedError;

  /// Serializes this ActivitySelectItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivitySelectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivitySelectItemModelCopyWith<ActivitySelectItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivitySelectItemModelCopyWith<$Res> {
  factory $ActivitySelectItemModelCopyWith(ActivitySelectItemModel value,
          $Res Function(ActivitySelectItemModel) then) =
      _$ActivitySelectItemModelCopyWithImpl<$Res, ActivitySelectItemModel>;
  @useResult
  $Res call({String weekOfDay, String date, List<BAModel> baList});
}

/// @nodoc
class _$ActivitySelectItemModelCopyWithImpl<$Res,
        $Val extends ActivitySelectItemModel>
    implements $ActivitySelectItemModelCopyWith<$Res> {
  _$ActivitySelectItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivitySelectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekOfDay = null,
    Object? date = null,
    Object? baList = null,
  }) {
    return _then(_value.copyWith(
      weekOfDay: null == weekOfDay
          ? _value.weekOfDay
          : weekOfDay // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      baList: null == baList
          ? _value.baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<BAModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivitySelectItemModelImplCopyWith<$Res>
    implements $ActivitySelectItemModelCopyWith<$Res> {
  factory _$$ActivitySelectItemModelImplCopyWith(
          _$ActivitySelectItemModelImpl value,
          $Res Function(_$ActivitySelectItemModelImpl) then) =
      __$$ActivitySelectItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String weekOfDay, String date, List<BAModel> baList});
}

/// @nodoc
class __$$ActivitySelectItemModelImplCopyWithImpl<$Res>
    extends _$ActivitySelectItemModelCopyWithImpl<$Res,
        _$ActivitySelectItemModelImpl>
    implements _$$ActivitySelectItemModelImplCopyWith<$Res> {
  __$$ActivitySelectItemModelImplCopyWithImpl(
      _$ActivitySelectItemModelImpl _value,
      $Res Function(_$ActivitySelectItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivitySelectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekOfDay = null,
    Object? date = null,
    Object? baList = null,
  }) {
    return _then(_$ActivitySelectItemModelImpl(
      weekOfDay: null == weekOfDay
          ? _value.weekOfDay
          : weekOfDay // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      baList: null == baList
          ? _value._baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<BAModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivitySelectItemModelImpl extends _ActivitySelectItemModel {
  const _$ActivitySelectItemModelImpl(
      {this.weekOfDay = '',
      this.date = '',
      final List<BAModel> baList = const []})
      : _baList = baList,
        super._();

  factory _$ActivitySelectItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivitySelectItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String weekOfDay;
  @override
  @JsonKey()
  final String date;
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
    return 'ActivitySelectItemModel(weekOfDay: $weekOfDay, date: $date, baList: $baList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitySelectItemModelImpl &&
            (identical(other.weekOfDay, weekOfDay) ||
                other.weekOfDay == weekOfDay) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._baList, _baList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weekOfDay, date,
      const DeepCollectionEquality().hash(_baList));

  /// Create a copy of ActivitySelectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivitySelectItemModelImplCopyWith<_$ActivitySelectItemModelImpl>
      get copyWith => __$$ActivitySelectItemModelImplCopyWithImpl<
          _$ActivitySelectItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivitySelectItemModelImplToJson(
      this,
    );
  }
}

abstract class _ActivitySelectItemModel extends ActivitySelectItemModel {
  const factory _ActivitySelectItemModel(
      {final String weekOfDay,
      final String date,
      final List<BAModel> baList}) = _$ActivitySelectItemModelImpl;
  const _ActivitySelectItemModel._() : super._();

  factory _ActivitySelectItemModel.fromJson(Map<String, dynamic> json) =
      _$ActivitySelectItemModelImpl.fromJson;

  @override
  String get weekOfDay;
  @override
  String get date;
  @override
  List<BAModel> get baList;

  /// Create a copy of ActivitySelectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivitySelectItemModelImplCopyWith<_$ActivitySelectItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
