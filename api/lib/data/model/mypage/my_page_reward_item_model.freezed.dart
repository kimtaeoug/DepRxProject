// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_reward_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageRewardItemModel _$MyPageRewardItemModelFromJson(
    Map<String, dynamic> json) {
  return _MyPageRewardItemModel.fromJson(json);
}

/// @nodoc
mixin _$MyPageRewardItemModel {
  String get imgPath => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this MyPageRewardItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyPageRewardItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyPageRewardItemModelCopyWith<MyPageRewardItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageRewardItemModelCopyWith<$Res> {
  factory $MyPageRewardItemModelCopyWith(MyPageRewardItemModel value,
          $Res Function(MyPageRewardItemModel) then) =
      _$MyPageRewardItemModelCopyWithImpl<$Res, MyPageRewardItemModel>;
  @useResult
  $Res call({String imgPath, String label});
}

/// @nodoc
class _$MyPageRewardItemModelCopyWithImpl<$Res,
        $Val extends MyPageRewardItemModel>
    implements $MyPageRewardItemModelCopyWith<$Res> {
  _$MyPageRewardItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPageRewardItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgPath = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageRewardItemModelImplCopyWith<$Res>
    implements $MyPageRewardItemModelCopyWith<$Res> {
  factory _$$MyPageRewardItemModelImplCopyWith(
          _$MyPageRewardItemModelImpl value,
          $Res Function(_$MyPageRewardItemModelImpl) then) =
      __$$MyPageRewardItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imgPath, String label});
}

/// @nodoc
class __$$MyPageRewardItemModelImplCopyWithImpl<$Res>
    extends _$MyPageRewardItemModelCopyWithImpl<$Res,
        _$MyPageRewardItemModelImpl>
    implements _$$MyPageRewardItemModelImplCopyWith<$Res> {
  __$$MyPageRewardItemModelImplCopyWithImpl(_$MyPageRewardItemModelImpl _value,
      $Res Function(_$MyPageRewardItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPageRewardItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgPath = null,
    Object? label = null,
  }) {
    return _then(_$MyPageRewardItemModelImpl(
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageRewardItemModelImpl extends _MyPageRewardItemModel {
  const _$MyPageRewardItemModelImpl({this.imgPath = '', this.label = ''})
      : super._();

  factory _$MyPageRewardItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageRewardItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String imgPath;
  @override
  @JsonKey()
  final String label;

  @override
  String toString() {
    return 'MyPageRewardItemModel(imgPath: $imgPath, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageRewardItemModelImpl &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imgPath, label);

  /// Create a copy of MyPageRewardItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageRewardItemModelImplCopyWith<_$MyPageRewardItemModelImpl>
      get copyWith => __$$MyPageRewardItemModelImplCopyWithImpl<
          _$MyPageRewardItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageRewardItemModelImplToJson(
      this,
    );
  }
}

abstract class _MyPageRewardItemModel extends MyPageRewardItemModel {
  const factory _MyPageRewardItemModel(
      {final String imgPath, final String label}) = _$MyPageRewardItemModelImpl;
  const _MyPageRewardItemModel._() : super._();

  factory _MyPageRewardItemModel.fromJson(Map<String, dynamic> json) =
      _$MyPageRewardItemModelImpl.fromJson;

  @override
  String get imgPath;
  @override
  String get label;

  /// Create a copy of MyPageRewardItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPageRewardItemModelImplCopyWith<_$MyPageRewardItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
