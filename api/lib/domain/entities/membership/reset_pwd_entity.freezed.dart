// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pwd_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPwdEntity _$ResetPwdEntityFromJson(Map<String, dynamic> json) {
  return _ResetPwdEntity.fromJson(json);
}

/// @nodoc
mixin _$ResetPwdEntity {
  String get newPassword => throw _privateConstructorUsedError;
  String get newPasswordConfirm => throw _privateConstructorUsedError;

  /// Serializes this ResetPwdEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPwdEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPwdEntityCopyWith<ResetPwdEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPwdEntityCopyWith<$Res> {
  factory $ResetPwdEntityCopyWith(
          ResetPwdEntity value, $Res Function(ResetPwdEntity) then) =
      _$ResetPwdEntityCopyWithImpl<$Res, ResetPwdEntity>;
  @useResult
  $Res call({String newPassword, String newPasswordConfirm});
}

/// @nodoc
class _$ResetPwdEntityCopyWithImpl<$Res, $Val extends ResetPwdEntity>
    implements $ResetPwdEntityCopyWith<$Res> {
  _$ResetPwdEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPwdEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? newPasswordConfirm = null,
  }) {
    return _then(_value.copyWith(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirm: null == newPasswordConfirm
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPwdEntityImplCopyWith<$Res>
    implements $ResetPwdEntityCopyWith<$Res> {
  factory _$$ResetPwdEntityImplCopyWith(_$ResetPwdEntityImpl value,
          $Res Function(_$ResetPwdEntityImpl) then) =
      __$$ResetPwdEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newPassword, String newPasswordConfirm});
}

/// @nodoc
class __$$ResetPwdEntityImplCopyWithImpl<$Res>
    extends _$ResetPwdEntityCopyWithImpl<$Res, _$ResetPwdEntityImpl>
    implements _$$ResetPwdEntityImplCopyWith<$Res> {
  __$$ResetPwdEntityImplCopyWithImpl(
      _$ResetPwdEntityImpl _value, $Res Function(_$ResetPwdEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPwdEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? newPasswordConfirm = null,
  }) {
    return _then(_$ResetPwdEntityImpl(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirm: null == newPasswordConfirm
          ? _value.newPasswordConfirm
          : newPasswordConfirm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPwdEntityImpl extends _ResetPwdEntity {
  const _$ResetPwdEntityImpl(
      {this.newPassword = '', this.newPasswordConfirm = ''})
      : super._();

  factory _$ResetPwdEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPwdEntityImplFromJson(json);

  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final String newPasswordConfirm;

  @override
  String toString() {
    return 'ResetPwdEntity(newPassword: $newPassword, newPasswordConfirm: $newPasswordConfirm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPwdEntityImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.newPasswordConfirm, newPasswordConfirm) ||
                other.newPasswordConfirm == newPasswordConfirm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newPassword, newPasswordConfirm);

  /// Create a copy of ResetPwdEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPwdEntityImplCopyWith<_$ResetPwdEntityImpl> get copyWith =>
      __$$ResetPwdEntityImplCopyWithImpl<_$ResetPwdEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPwdEntityImplToJson(
      this,
    );
  }
}

abstract class _ResetPwdEntity extends ResetPwdEntity {
  const factory _ResetPwdEntity(
      {final String newPassword,
      final String newPasswordConfirm}) = _$ResetPwdEntityImpl;
  const _ResetPwdEntity._() : super._();

  factory _ResetPwdEntity.fromJson(Map<String, dynamic> json) =
      _$ResetPwdEntityImpl.fromJson;

  @override
  String get newPassword;
  @override
  String get newPasswordConfirm;

  /// Create a copy of ResetPwdEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPwdEntityImplCopyWith<_$ResetPwdEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
