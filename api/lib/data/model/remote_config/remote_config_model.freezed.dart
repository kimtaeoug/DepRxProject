// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfigModel _$RemoteConfigModelFromJson(Map<String, dynamic> json) {
  return _RemoteConfigModel.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfigModel {
  String get serverInspectionTime => throw _privateConstructorUsedError;
  bool get updateForce => throw _privateConstructorUsedError;
  bool get isClinical => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  /// Serializes this RemoteConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteConfigModelCopyWith<RemoteConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigModelCopyWith<$Res> {
  factory $RemoteConfigModelCopyWith(
          RemoteConfigModel value, $Res Function(RemoteConfigModel) then) =
      _$RemoteConfigModelCopyWithImpl<$Res, RemoteConfigModel>;
  @useResult
  $Res call(
      {String serverInspectionTime,
      bool updateForce,
      bool isClinical,
      String version});
}

/// @nodoc
class _$RemoteConfigModelCopyWithImpl<$Res, $Val extends RemoteConfigModel>
    implements $RemoteConfigModelCopyWith<$Res> {
  _$RemoteConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverInspectionTime = null,
    Object? updateForce = null,
    Object? isClinical = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      serverInspectionTime: null == serverInspectionTime
          ? _value.serverInspectionTime
          : serverInspectionTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateForce: null == updateForce
          ? _value.updateForce
          : updateForce // ignore: cast_nullable_to_non_nullable
              as bool,
      isClinical: null == isClinical
          ? _value.isClinical
          : isClinical // ignore: cast_nullable_to_non_nullable
              as bool,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigModelImplCopyWith<$Res>
    implements $RemoteConfigModelCopyWith<$Res> {
  factory _$$RemoteConfigModelImplCopyWith(_$RemoteConfigModelImpl value,
          $Res Function(_$RemoteConfigModelImpl) then) =
      __$$RemoteConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serverInspectionTime,
      bool updateForce,
      bool isClinical,
      String version});
}

/// @nodoc
class __$$RemoteConfigModelImplCopyWithImpl<$Res>
    extends _$RemoteConfigModelCopyWithImpl<$Res, _$RemoteConfigModelImpl>
    implements _$$RemoteConfigModelImplCopyWith<$Res> {
  __$$RemoteConfigModelImplCopyWithImpl(_$RemoteConfigModelImpl _value,
      $Res Function(_$RemoteConfigModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverInspectionTime = null,
    Object? updateForce = null,
    Object? isClinical = null,
    Object? version = null,
  }) {
    return _then(_$RemoteConfigModelImpl(
      serverInspectionTime: null == serverInspectionTime
          ? _value.serverInspectionTime
          : serverInspectionTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateForce: null == updateForce
          ? _value.updateForce
          : updateForce // ignore: cast_nullable_to_non_nullable
              as bool,
      isClinical: null == isClinical
          ? _value.isClinical
          : isClinical // ignore: cast_nullable_to_non_nullable
              as bool,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteConfigModelImpl extends _RemoteConfigModel {
  const _$RemoteConfigModelImpl(
      {this.serverInspectionTime = '',
      this.updateForce = false,
      this.isClinical = false,
      this.version = ''})
      : super._();

  factory _$RemoteConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigModelImplFromJson(json);

  @override
  @JsonKey()
  final String serverInspectionTime;
  @override
  @JsonKey()
  final bool updateForce;
  @override
  @JsonKey()
  final bool isClinical;
  @override
  @JsonKey()
  final String version;

  @override
  String toString() {
    return 'RemoteConfigModel(serverInspectionTime: $serverInspectionTime, updateForce: $updateForce, isClinical: $isClinical, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigModelImpl &&
            (identical(other.serverInspectionTime, serverInspectionTime) ||
                other.serverInspectionTime == serverInspectionTime) &&
            (identical(other.updateForce, updateForce) ||
                other.updateForce == updateForce) &&
            (identical(other.isClinical, isClinical) ||
                other.isClinical == isClinical) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, serverInspectionTime, updateForce, isClinical, version);

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigModelImplCopyWith<_$RemoteConfigModelImpl> get copyWith =>
      __$$RemoteConfigModelImplCopyWithImpl<_$RemoteConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigModelImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfigModel extends RemoteConfigModel {
  const factory _RemoteConfigModel(
      {final String serverInspectionTime,
      final bool updateForce,
      final bool isClinical,
      final String version}) = _$RemoteConfigModelImpl;
  const _RemoteConfigModel._() : super._();

  factory _RemoteConfigModel.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigModelImpl.fromJson;

  @override
  String get serverInspectionTime;
  @override
  bool get updateForce;
  @override
  bool get isClinical;
  @override
  String get version;

  /// Create a copy of RemoteConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteConfigModelImplCopyWith<_$RemoteConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
