// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ongoing_ba_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OngoingBAEntity _$OngoingBAEntityFromJson(Map<String, dynamic> json) {
  return _OngoingBAEntity.fromJson(json);
}

/// @nodoc
mixin _$OngoingBAEntity {
  String get activityId => throw _privateConstructorUsedError;
  int get beforeEmotion => throw _privateConstructorUsedError;
  int get afterEmotion => throw _privateConstructorUsedError;

  /// Serializes this OngoingBAEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OngoingBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OngoingBAEntityCopyWith<OngoingBAEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OngoingBAEntityCopyWith<$Res> {
  factory $OngoingBAEntityCopyWith(
          OngoingBAEntity value, $Res Function(OngoingBAEntity) then) =
      _$OngoingBAEntityCopyWithImpl<$Res, OngoingBAEntity>;
  @useResult
  $Res call({String activityId, int beforeEmotion, int afterEmotion});
}

/// @nodoc
class _$OngoingBAEntityCopyWithImpl<$Res, $Val extends OngoingBAEntity>
    implements $OngoingBAEntityCopyWith<$Res> {
  _$OngoingBAEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OngoingBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? beforeEmotion = null,
    Object? afterEmotion = null,
  }) {
    return _then(_value.copyWith(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      beforeEmotion: null == beforeEmotion
          ? _value.beforeEmotion
          : beforeEmotion // ignore: cast_nullable_to_non_nullable
              as int,
      afterEmotion: null == afterEmotion
          ? _value.afterEmotion
          : afterEmotion // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OngoingBAEntityImplCopyWith<$Res>
    implements $OngoingBAEntityCopyWith<$Res> {
  factory _$$OngoingBAEntityImplCopyWith(_$OngoingBAEntityImpl value,
          $Res Function(_$OngoingBAEntityImpl) then) =
      __$$OngoingBAEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String activityId, int beforeEmotion, int afterEmotion});
}

/// @nodoc
class __$$OngoingBAEntityImplCopyWithImpl<$Res>
    extends _$OngoingBAEntityCopyWithImpl<$Res, _$OngoingBAEntityImpl>
    implements _$$OngoingBAEntityImplCopyWith<$Res> {
  __$$OngoingBAEntityImplCopyWithImpl(
      _$OngoingBAEntityImpl _value, $Res Function(_$OngoingBAEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OngoingBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? beforeEmotion = null,
    Object? afterEmotion = null,
  }) {
    return _then(_$OngoingBAEntityImpl(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      beforeEmotion: null == beforeEmotion
          ? _value.beforeEmotion
          : beforeEmotion // ignore: cast_nullable_to_non_nullable
              as int,
      afterEmotion: null == afterEmotion
          ? _value.afterEmotion
          : afterEmotion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OngoingBAEntityImpl extends _OngoingBAEntity {
  const _$OngoingBAEntityImpl(
      {this.activityId = '', this.beforeEmotion = 0, this.afterEmotion = 0})
      : super._();

  factory _$OngoingBAEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OngoingBAEntityImplFromJson(json);

  @override
  @JsonKey()
  final String activityId;
  @override
  @JsonKey()
  final int beforeEmotion;
  @override
  @JsonKey()
  final int afterEmotion;

  @override
  String toString() {
    return 'OngoingBAEntity(activityId: $activityId, beforeEmotion: $beforeEmotion, afterEmotion: $afterEmotion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OngoingBAEntityImpl &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.beforeEmotion, beforeEmotion) ||
                other.beforeEmotion == beforeEmotion) &&
            (identical(other.afterEmotion, afterEmotion) ||
                other.afterEmotion == afterEmotion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, activityId, beforeEmotion, afterEmotion);

  /// Create a copy of OngoingBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OngoingBAEntityImplCopyWith<_$OngoingBAEntityImpl> get copyWith =>
      __$$OngoingBAEntityImplCopyWithImpl<_$OngoingBAEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OngoingBAEntityImplToJson(
      this,
    );
  }
}

abstract class _OngoingBAEntity extends OngoingBAEntity {
  const factory _OngoingBAEntity(
      {final String activityId,
      final int beforeEmotion,
      final int afterEmotion}) = _$OngoingBAEntityImpl;
  const _OngoingBAEntity._() : super._();

  factory _OngoingBAEntity.fromJson(Map<String, dynamic> json) =
      _$OngoingBAEntityImpl.fromJson;

  @override
  String get activityId;
  @override
  int get beforeEmotion;
  @override
  int get afterEmotion;

  /// Create a copy of OngoingBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OngoingBAEntityImplCopyWith<_$OngoingBAEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
