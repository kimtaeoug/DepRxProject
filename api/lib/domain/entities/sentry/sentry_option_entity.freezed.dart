// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sentry_option_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SentryOptionEntity _$SentryOptionEntityFromJson(Map<String, dynamic> json) {
  return _SentryOptionEntity.fromJson(json);
}

/// @nodoc
mixin _$SentryOptionEntity {
  String get service => throw _privateConstructorUsedError;
  String get release => throw _privateConstructorUsedError;
  String get os => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  String get statusCode => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get apiVersion => throw _privateConstructorUsedError;

  /// Serializes this SentryOptionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SentryOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SentryOptionEntityCopyWith<SentryOptionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentryOptionEntityCopyWith<$Res> {
  factory $SentryOptionEntityCopyWith(
          SentryOptionEntity value, $Res Function(SentryOptionEntity) then) =
      _$SentryOptionEntityCopyWithImpl<$Res, SentryOptionEntity>;
  @useResult
  $Res call(
      {String service,
      String release,
      String os,
      String network,
      String endpoint,
      String statusCode,
      String method,
      String apiVersion});
}

/// @nodoc
class _$SentryOptionEntityCopyWithImpl<$Res, $Val extends SentryOptionEntity>
    implements $SentryOptionEntityCopyWith<$Res> {
  _$SentryOptionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SentryOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? release = null,
    Object? os = null,
    Object? network = null,
    Object? endpoint = null,
    Object? statusCode = null,
    Object? method = null,
    Object? apiVersion = null,
  }) {
    return _then(_value.copyWith(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      release: null == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      apiVersion: null == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SentryOptionEntityImplCopyWith<$Res>
    implements $SentryOptionEntityCopyWith<$Res> {
  factory _$$SentryOptionEntityImplCopyWith(_$SentryOptionEntityImpl value,
          $Res Function(_$SentryOptionEntityImpl) then) =
      __$$SentryOptionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String service,
      String release,
      String os,
      String network,
      String endpoint,
      String statusCode,
      String method,
      String apiVersion});
}

/// @nodoc
class __$$SentryOptionEntityImplCopyWithImpl<$Res>
    extends _$SentryOptionEntityCopyWithImpl<$Res, _$SentryOptionEntityImpl>
    implements _$$SentryOptionEntityImplCopyWith<$Res> {
  __$$SentryOptionEntityImplCopyWithImpl(_$SentryOptionEntityImpl _value,
      $Res Function(_$SentryOptionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SentryOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? release = null,
    Object? os = null,
    Object? network = null,
    Object? endpoint = null,
    Object? statusCode = null,
    Object? method = null,
    Object? apiVersion = null,
  }) {
    return _then(_$SentryOptionEntityImpl(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      release: null == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as String,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      apiVersion: null == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SentryOptionEntityImpl extends _SentryOptionEntity {
  const _$SentryOptionEntityImpl(
      {this.service = '',
      this.release = '',
      this.os = '',
      this.network = '',
      this.endpoint = '',
      this.statusCode = '',
      this.method = '',
      this.apiVersion = ''})
      : super._();

  factory _$SentryOptionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SentryOptionEntityImplFromJson(json);

  @override
  @JsonKey()
  final String service;
  @override
  @JsonKey()
  final String release;
  @override
  @JsonKey()
  final String os;
  @override
  @JsonKey()
  final String network;
  @override
  @JsonKey()
  final String endpoint;
  @override
  @JsonKey()
  final String statusCode;
  @override
  @JsonKey()
  final String method;
  @override
  @JsonKey()
  final String apiVersion;

  @override
  String toString() {
    return 'SentryOptionEntity(service: $service, release: $release, os: $os, network: $network, endpoint: $endpoint, statusCode: $statusCode, method: $method, apiVersion: $apiVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SentryOptionEntityImpl &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.release, release) || other.release == release) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.apiVersion, apiVersion) ||
                other.apiVersion == apiVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, service, release, os, network,
      endpoint, statusCode, method, apiVersion);

  /// Create a copy of SentryOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SentryOptionEntityImplCopyWith<_$SentryOptionEntityImpl> get copyWith =>
      __$$SentryOptionEntityImplCopyWithImpl<_$SentryOptionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SentryOptionEntityImplToJson(
      this,
    );
  }
}

abstract class _SentryOptionEntity extends SentryOptionEntity {
  const factory _SentryOptionEntity(
      {final String service,
      final String release,
      final String os,
      final String network,
      final String endpoint,
      final String statusCode,
      final String method,
      final String apiVersion}) = _$SentryOptionEntityImpl;
  const _SentryOptionEntity._() : super._();

  factory _SentryOptionEntity.fromJson(Map<String, dynamic> json) =
      _$SentryOptionEntityImpl.fromJson;

  @override
  String get service;
  @override
  String get release;
  @override
  String get os;
  @override
  String get network;
  @override
  String get endpoint;
  @override
  String get statusCode;
  @override
  String get method;
  @override
  String get apiVersion;

  /// Create a copy of SentryOptionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SentryOptionEntityImplCopyWith<_$SentryOptionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
