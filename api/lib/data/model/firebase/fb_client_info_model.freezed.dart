// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fb_client_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBClientInfoModel _$FBClientInfoModelFromJson(Map<String, dynamic> json) {
  return _FBClientInfoModel.fromJson(json);
}

/// @nodoc
mixin _$FBClientInfoModel {
  String get mobilesdk_app_id => throw _privateConstructorUsedError;
  FBAndroidClientInfoModel get android_client_info =>
      throw _privateConstructorUsedError;

  /// Serializes this FBClientInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FBClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FBClientInfoModelCopyWith<FBClientInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBClientInfoModelCopyWith<$Res> {
  factory $FBClientInfoModelCopyWith(
          FBClientInfoModel value, $Res Function(FBClientInfoModel) then) =
      _$FBClientInfoModelCopyWithImpl<$Res, FBClientInfoModel>;
  @useResult
  $Res call(
      {String mobilesdk_app_id, FBAndroidClientInfoModel android_client_info});

  $FBAndroidClientInfoModelCopyWith<$Res> get android_client_info;
}

/// @nodoc
class _$FBClientInfoModelCopyWithImpl<$Res, $Val extends FBClientInfoModel>
    implements $FBClientInfoModelCopyWith<$Res> {
  _$FBClientInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FBClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobilesdk_app_id = null,
    Object? android_client_info = null,
  }) {
    return _then(_value.copyWith(
      mobilesdk_app_id: null == mobilesdk_app_id
          ? _value.mobilesdk_app_id
          : mobilesdk_app_id // ignore: cast_nullable_to_non_nullable
              as String,
      android_client_info: null == android_client_info
          ? _value.android_client_info
          : android_client_info // ignore: cast_nullable_to_non_nullable
              as FBAndroidClientInfoModel,
    ) as $Val);
  }

  /// Create a copy of FBClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FBAndroidClientInfoModelCopyWith<$Res> get android_client_info {
    return $FBAndroidClientInfoModelCopyWith<$Res>(_value.android_client_info,
        (value) {
      return _then(_value.copyWith(android_client_info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FBClientInfoModelImplCopyWith<$Res>
    implements $FBClientInfoModelCopyWith<$Res> {
  factory _$$FBClientInfoModelImplCopyWith(_$FBClientInfoModelImpl value,
          $Res Function(_$FBClientInfoModelImpl) then) =
      __$$FBClientInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mobilesdk_app_id, FBAndroidClientInfoModel android_client_info});

  @override
  $FBAndroidClientInfoModelCopyWith<$Res> get android_client_info;
}

/// @nodoc
class __$$FBClientInfoModelImplCopyWithImpl<$Res>
    extends _$FBClientInfoModelCopyWithImpl<$Res, _$FBClientInfoModelImpl>
    implements _$$FBClientInfoModelImplCopyWith<$Res> {
  __$$FBClientInfoModelImplCopyWithImpl(_$FBClientInfoModelImpl _value,
      $Res Function(_$FBClientInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FBClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobilesdk_app_id = null,
    Object? android_client_info = null,
  }) {
    return _then(_$FBClientInfoModelImpl(
      mobilesdk_app_id: null == mobilesdk_app_id
          ? _value.mobilesdk_app_id
          : mobilesdk_app_id // ignore: cast_nullable_to_non_nullable
              as String,
      android_client_info: null == android_client_info
          ? _value.android_client_info
          : android_client_info // ignore: cast_nullable_to_non_nullable
              as FBAndroidClientInfoModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBClientInfoModelImpl extends _FBClientInfoModel {
  const _$FBClientInfoModelImpl(
      {this.mobilesdk_app_id = '',
      this.android_client_info = const FBAndroidClientInfoModel()})
      : super._();

  factory _$FBClientInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBClientInfoModelImplFromJson(json);

  @override
  @JsonKey()
  final String mobilesdk_app_id;
  @override
  @JsonKey()
  final FBAndroidClientInfoModel android_client_info;

  @override
  String toString() {
    return 'FBClientInfoModel(mobilesdk_app_id: $mobilesdk_app_id, android_client_info: $android_client_info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBClientInfoModelImpl &&
            (identical(other.mobilesdk_app_id, mobilesdk_app_id) ||
                other.mobilesdk_app_id == mobilesdk_app_id) &&
            (identical(other.android_client_info, android_client_info) ||
                other.android_client_info == android_client_info));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mobilesdk_app_id, android_client_info);

  /// Create a copy of FBClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FBClientInfoModelImplCopyWith<_$FBClientInfoModelImpl> get copyWith =>
      __$$FBClientInfoModelImplCopyWithImpl<_$FBClientInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBClientInfoModelImplToJson(
      this,
    );
  }
}

abstract class _FBClientInfoModel extends FBClientInfoModel {
  const factory _FBClientInfoModel(
          {final String mobilesdk_app_id,
          final FBAndroidClientInfoModel android_client_info}) =
      _$FBClientInfoModelImpl;
  const _FBClientInfoModel._() : super._();

  factory _FBClientInfoModel.fromJson(Map<String, dynamic> json) =
      _$FBClientInfoModelImpl.fromJson;

  @override
  String get mobilesdk_app_id;
  @override
  FBAndroidClientInfoModel get android_client_info;

  /// Create a copy of FBClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FBClientInfoModelImplCopyWith<_$FBClientInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
