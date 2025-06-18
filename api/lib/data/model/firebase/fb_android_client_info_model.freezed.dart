// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fb_android_client_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBAndroidClientInfoModel _$FBAndroidClientInfoModelFromJson(
    Map<String, dynamic> json) {
  return _FBAndroidClientInfoModel.fromJson(json);
}

/// @nodoc
mixin _$FBAndroidClientInfoModel {
  String get package_name => throw _privateConstructorUsedError;

  /// Serializes this FBAndroidClientInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FBAndroidClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FBAndroidClientInfoModelCopyWith<FBAndroidClientInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBAndroidClientInfoModelCopyWith<$Res> {
  factory $FBAndroidClientInfoModelCopyWith(FBAndroidClientInfoModel value,
          $Res Function(FBAndroidClientInfoModel) then) =
      _$FBAndroidClientInfoModelCopyWithImpl<$Res, FBAndroidClientInfoModel>;
  @useResult
  $Res call({String package_name});
}

/// @nodoc
class _$FBAndroidClientInfoModelCopyWithImpl<$Res,
        $Val extends FBAndroidClientInfoModel>
    implements $FBAndroidClientInfoModelCopyWith<$Res> {
  _$FBAndroidClientInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FBAndroidClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package_name = null,
  }) {
    return _then(_value.copyWith(
      package_name: null == package_name
          ? _value.package_name
          : package_name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FBAndroidClientInfoModelImplCopyWith<$Res>
    implements $FBAndroidClientInfoModelCopyWith<$Res> {
  factory _$$FBAndroidClientInfoModelImplCopyWith(
          _$FBAndroidClientInfoModelImpl value,
          $Res Function(_$FBAndroidClientInfoModelImpl) then) =
      __$$FBAndroidClientInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String package_name});
}

/// @nodoc
class __$$FBAndroidClientInfoModelImplCopyWithImpl<$Res>
    extends _$FBAndroidClientInfoModelCopyWithImpl<$Res,
        _$FBAndroidClientInfoModelImpl>
    implements _$$FBAndroidClientInfoModelImplCopyWith<$Res> {
  __$$FBAndroidClientInfoModelImplCopyWithImpl(
      _$FBAndroidClientInfoModelImpl _value,
      $Res Function(_$FBAndroidClientInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FBAndroidClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package_name = null,
  }) {
    return _then(_$FBAndroidClientInfoModelImpl(
      package_name: null == package_name
          ? _value.package_name
          : package_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBAndroidClientInfoModelImpl extends _FBAndroidClientInfoModel {
  const _$FBAndroidClientInfoModelImpl({this.package_name = ''}) : super._();

  factory _$FBAndroidClientInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBAndroidClientInfoModelImplFromJson(json);

  @override
  @JsonKey()
  final String package_name;

  @override
  String toString() {
    return 'FBAndroidClientInfoModel(package_name: $package_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBAndroidClientInfoModelImpl &&
            (identical(other.package_name, package_name) ||
                other.package_name == package_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, package_name);

  /// Create a copy of FBAndroidClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FBAndroidClientInfoModelImplCopyWith<_$FBAndroidClientInfoModelImpl>
      get copyWith => __$$FBAndroidClientInfoModelImplCopyWithImpl<
          _$FBAndroidClientInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBAndroidClientInfoModelImplToJson(
      this,
    );
  }
}

abstract class _FBAndroidClientInfoModel extends FBAndroidClientInfoModel {
  const factory _FBAndroidClientInfoModel({final String package_name}) =
      _$FBAndroidClientInfoModelImpl;
  const _FBAndroidClientInfoModel._() : super._();

  factory _FBAndroidClientInfoModel.fromJson(Map<String, dynamic> json) =
      _$FBAndroidClientInfoModelImpl.fromJson;

  @override
  String get package_name;

  /// Create a copy of FBAndroidClientInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FBAndroidClientInfoModelImplCopyWith<_$FBAndroidClientInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
