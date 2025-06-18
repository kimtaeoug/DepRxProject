// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_login_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialLoginEntity _$SocialLoginEntityFromJson(Map<String, dynamic> json) {
  return _SocialLoginEntity.fromJson(json);
}

/// @nodoc
mixin _$SocialLoginEntity {
  String get socialsUuid => throw _privateConstructorUsedError;
  String get socialsType => throw _privateConstructorUsedError;
  bool get force => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this SocialLoginEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialLoginEntityCopyWith<SocialLoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLoginEntityCopyWith<$Res> {
  factory $SocialLoginEntityCopyWith(
          SocialLoginEntity value, $Res Function(SocialLoginEntity) then) =
      _$SocialLoginEntityCopyWithImpl<$Res, SocialLoginEntity>;
  @useResult
  $Res call(
      {String socialsUuid, String socialsType, bool force, String fcmToken});
}

/// @nodoc
class _$SocialLoginEntityCopyWithImpl<$Res, $Val extends SocialLoginEntity>
    implements $SocialLoginEntityCopyWith<$Res> {
  _$SocialLoginEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialsUuid = null,
    Object? socialsType = null,
    Object? force = null,
    Object? fcmToken = null,
  }) {
    return _then(_value.copyWith(
      socialsUuid: null == socialsUuid
          ? _value.socialsUuid
          : socialsUuid // ignore: cast_nullable_to_non_nullable
              as String,
      socialsType: null == socialsType
          ? _value.socialsType
          : socialsType // ignore: cast_nullable_to_non_nullable
              as String,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialLoginEntityImplCopyWith<$Res>
    implements $SocialLoginEntityCopyWith<$Res> {
  factory _$$SocialLoginEntityImplCopyWith(_$SocialLoginEntityImpl value,
          $Res Function(_$SocialLoginEntityImpl) then) =
      __$$SocialLoginEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String socialsUuid, String socialsType, bool force, String fcmToken});
}

/// @nodoc
class __$$SocialLoginEntityImplCopyWithImpl<$Res>
    extends _$SocialLoginEntityCopyWithImpl<$Res, _$SocialLoginEntityImpl>
    implements _$$SocialLoginEntityImplCopyWith<$Res> {
  __$$SocialLoginEntityImplCopyWithImpl(_$SocialLoginEntityImpl _value,
      $Res Function(_$SocialLoginEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialsUuid = null,
    Object? socialsType = null,
    Object? force = null,
    Object? fcmToken = null,
  }) {
    return _then(_$SocialLoginEntityImpl(
      socialsUuid: null == socialsUuid
          ? _value.socialsUuid
          : socialsUuid // ignore: cast_nullable_to_non_nullable
              as String,
      socialsType: null == socialsType
          ? _value.socialsType
          : socialsType // ignore: cast_nullable_to_non_nullable
              as String,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialLoginEntityImpl extends _SocialLoginEntity {
  const _$SocialLoginEntityImpl(
      {this.socialsUuid = '',
      this.socialsType = '',
      this.force = false,
      this.fcmToken = ''})
      : super._();

  factory _$SocialLoginEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialLoginEntityImplFromJson(json);

  @override
  @JsonKey()
  final String socialsUuid;
  @override
  @JsonKey()
  final String socialsType;
  @override
  @JsonKey()
  final bool force;
  @override
  @JsonKey()
  final String fcmToken;

  @override
  String toString() {
    return 'SocialLoginEntity(socialsUuid: $socialsUuid, socialsType: $socialsType, force: $force, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLoginEntityImpl &&
            (identical(other.socialsUuid, socialsUuid) ||
                other.socialsUuid == socialsUuid) &&
            (identical(other.socialsType, socialsType) ||
                other.socialsType == socialsType) &&
            (identical(other.force, force) || other.force == force) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, socialsUuid, socialsType, force, fcmToken);

  /// Create a copy of SocialLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLoginEntityImplCopyWith<_$SocialLoginEntityImpl> get copyWith =>
      __$$SocialLoginEntityImplCopyWithImpl<_$SocialLoginEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialLoginEntityImplToJson(
      this,
    );
  }
}

abstract class _SocialLoginEntity extends SocialLoginEntity {
  const factory _SocialLoginEntity(
      {final String socialsUuid,
      final String socialsType,
      final bool force,
      final String fcmToken}) = _$SocialLoginEntityImpl;
  const _SocialLoginEntity._() : super._();

  factory _SocialLoginEntity.fromJson(Map<String, dynamic> json) =
      _$SocialLoginEntityImpl.fromJson;

  @override
  String get socialsUuid;
  @override
  String get socialsType;
  @override
  bool get force;
  @override
  String get fcmToken;

  /// Create a copy of SocialLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialLoginEntityImplCopyWith<_$SocialLoginEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
