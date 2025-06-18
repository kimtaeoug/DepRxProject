// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fb_api_key_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBAPIKeyItemModel _$FBAPIKeyItemModelFromJson(Map<String, dynamic> json) {
  return _FBAPIKeyItemModel.fromJson(json);
}

/// @nodoc
mixin _$FBAPIKeyItemModel {
  String get current_key => throw _privateConstructorUsedError;

  /// Serializes this FBAPIKeyItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FBAPIKeyItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FBAPIKeyItemModelCopyWith<FBAPIKeyItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBAPIKeyItemModelCopyWith<$Res> {
  factory $FBAPIKeyItemModelCopyWith(
          FBAPIKeyItemModel value, $Res Function(FBAPIKeyItemModel) then) =
      _$FBAPIKeyItemModelCopyWithImpl<$Res, FBAPIKeyItemModel>;
  @useResult
  $Res call({String current_key});
}

/// @nodoc
class _$FBAPIKeyItemModelCopyWithImpl<$Res, $Val extends FBAPIKeyItemModel>
    implements $FBAPIKeyItemModelCopyWith<$Res> {
  _$FBAPIKeyItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FBAPIKeyItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_key = null,
  }) {
    return _then(_value.copyWith(
      current_key: null == current_key
          ? _value.current_key
          : current_key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FBAPIKeyItemModelImplCopyWith<$Res>
    implements $FBAPIKeyItemModelCopyWith<$Res> {
  factory _$$FBAPIKeyItemModelImplCopyWith(_$FBAPIKeyItemModelImpl value,
          $Res Function(_$FBAPIKeyItemModelImpl) then) =
      __$$FBAPIKeyItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String current_key});
}

/// @nodoc
class __$$FBAPIKeyItemModelImplCopyWithImpl<$Res>
    extends _$FBAPIKeyItemModelCopyWithImpl<$Res, _$FBAPIKeyItemModelImpl>
    implements _$$FBAPIKeyItemModelImplCopyWith<$Res> {
  __$$FBAPIKeyItemModelImplCopyWithImpl(_$FBAPIKeyItemModelImpl _value,
      $Res Function(_$FBAPIKeyItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FBAPIKeyItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_key = null,
  }) {
    return _then(_$FBAPIKeyItemModelImpl(
      current_key: null == current_key
          ? _value.current_key
          : current_key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBAPIKeyItemModelImpl extends _FBAPIKeyItemModel {
  const _$FBAPIKeyItemModelImpl({this.current_key = ''}) : super._();

  factory _$FBAPIKeyItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBAPIKeyItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String current_key;

  @override
  String toString() {
    return 'FBAPIKeyItemModel(current_key: $current_key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBAPIKeyItemModelImpl &&
            (identical(other.current_key, current_key) ||
                other.current_key == current_key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, current_key);

  /// Create a copy of FBAPIKeyItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FBAPIKeyItemModelImplCopyWith<_$FBAPIKeyItemModelImpl> get copyWith =>
      __$$FBAPIKeyItemModelImplCopyWithImpl<_$FBAPIKeyItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBAPIKeyItemModelImplToJson(
      this,
    );
  }
}

abstract class _FBAPIKeyItemModel extends FBAPIKeyItemModel {
  const factory _FBAPIKeyItemModel({final String current_key}) =
      _$FBAPIKeyItemModelImpl;
  const _FBAPIKeyItemModel._() : super._();

  factory _FBAPIKeyItemModel.fromJson(Map<String, dynamic> json) =
      _$FBAPIKeyItemModelImpl.fromJson;

  @override
  String get current_key;

  /// Create a copy of FBAPIKeyItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FBAPIKeyItemModelImplCopyWith<_$FBAPIKeyItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
