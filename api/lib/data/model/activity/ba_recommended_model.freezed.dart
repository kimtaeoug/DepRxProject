// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ba_recommended_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BARecommendedModel _$BARecommendedModelFromJson(Map<String, dynamic> json) {
  return _BARecommendedModel.fromJson(json);
}

/// @nodoc
mixin _$BARecommendedModel {
  List<ActivitySelectItemModel> get actionList =>
      throw _privateConstructorUsedError;

  /// Serializes this BARecommendedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BARecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BARecommendedModelCopyWith<BARecommendedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BARecommendedModelCopyWith<$Res> {
  factory $BARecommendedModelCopyWith(
          BARecommendedModel value, $Res Function(BARecommendedModel) then) =
      _$BARecommendedModelCopyWithImpl<$Res, BARecommendedModel>;
  @useResult
  $Res call({List<ActivitySelectItemModel> actionList});
}

/// @nodoc
class _$BARecommendedModelCopyWithImpl<$Res, $Val extends BARecommendedModel>
    implements $BARecommendedModelCopyWith<$Res> {
  _$BARecommendedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BARecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionList = null,
  }) {
    return _then(_value.copyWith(
      actionList: null == actionList
          ? _value.actionList
          : actionList // ignore: cast_nullable_to_non_nullable
              as List<ActivitySelectItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BARecommendedModelImplCopyWith<$Res>
    implements $BARecommendedModelCopyWith<$Res> {
  factory _$$BARecommendedModelImplCopyWith(_$BARecommendedModelImpl value,
          $Res Function(_$BARecommendedModelImpl) then) =
      __$$BARecommendedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ActivitySelectItemModel> actionList});
}

/// @nodoc
class __$$BARecommendedModelImplCopyWithImpl<$Res>
    extends _$BARecommendedModelCopyWithImpl<$Res, _$BARecommendedModelImpl>
    implements _$$BARecommendedModelImplCopyWith<$Res> {
  __$$BARecommendedModelImplCopyWithImpl(_$BARecommendedModelImpl _value,
      $Res Function(_$BARecommendedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BARecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionList = null,
  }) {
    return _then(_$BARecommendedModelImpl(
      actionList: null == actionList
          ? _value._actionList
          : actionList // ignore: cast_nullable_to_non_nullable
              as List<ActivitySelectItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BARecommendedModelImpl extends _BARecommendedModel {
  const _$BARecommendedModelImpl(
      {final List<ActivitySelectItemModel> actionList = const []})
      : _actionList = actionList,
        super._();

  factory _$BARecommendedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BARecommendedModelImplFromJson(json);

  final List<ActivitySelectItemModel> _actionList;
  @override
  @JsonKey()
  List<ActivitySelectItemModel> get actionList {
    if (_actionList is EqualUnmodifiableListView) return _actionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionList);
  }

  @override
  String toString() {
    return 'BARecommendedModel(actionList: $actionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BARecommendedModelImpl &&
            const DeepCollectionEquality()
                .equals(other._actionList, _actionList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_actionList));

  /// Create a copy of BARecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BARecommendedModelImplCopyWith<_$BARecommendedModelImpl> get copyWith =>
      __$$BARecommendedModelImplCopyWithImpl<_$BARecommendedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BARecommendedModelImplToJson(
      this,
    );
  }
}

abstract class _BARecommendedModel extends BARecommendedModel {
  const factory _BARecommendedModel(
          {final List<ActivitySelectItemModel> actionList}) =
      _$BARecommendedModelImpl;
  const _BARecommendedModel._() : super._();

  factory _BARecommendedModel.fromJson(Map<String, dynamic> json) =
      _$BARecommendedModelImpl.fromJson;

  @override
  List<ActivitySelectItemModel> get actionList;

  /// Create a copy of BARecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BARecommendedModelImplCopyWith<_$BARecommendedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
