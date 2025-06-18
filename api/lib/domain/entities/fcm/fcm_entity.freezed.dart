// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FCMEntity _$FCMEntityFromJson(Map<String, dynamic> json) {
  return _FCMEntity.fromJson(json);
}

/// @nodoc
mixin _$FCMEntity {
  dynamic get data => throw _privateConstructorUsedError;
  String get functionName => throw _privateConstructorUsedError;

  /// Serializes this FCMEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FCMEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FCMEntityCopyWith<FCMEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FCMEntityCopyWith<$Res> {
  factory $FCMEntityCopyWith(FCMEntity value, $Res Function(FCMEntity) then) =
      _$FCMEntityCopyWithImpl<$Res, FCMEntity>;
  @useResult
  $Res call({dynamic data, String functionName});
}

/// @nodoc
class _$FCMEntityCopyWithImpl<$Res, $Val extends FCMEntity>
    implements $FCMEntityCopyWith<$Res> {
  _$FCMEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FCMEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? functionName = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      functionName: null == functionName
          ? _value.functionName
          : functionName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FCMEntityImplCopyWith<$Res>
    implements $FCMEntityCopyWith<$Res> {
  factory _$$FCMEntityImplCopyWith(
          _$FCMEntityImpl value, $Res Function(_$FCMEntityImpl) then) =
      __$$FCMEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic data, String functionName});
}

/// @nodoc
class __$$FCMEntityImplCopyWithImpl<$Res>
    extends _$FCMEntityCopyWithImpl<$Res, _$FCMEntityImpl>
    implements _$$FCMEntityImplCopyWith<$Res> {
  __$$FCMEntityImplCopyWithImpl(
      _$FCMEntityImpl _value, $Res Function(_$FCMEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of FCMEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? functionName = null,
  }) {
    return _then(_$FCMEntityImpl(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == functionName
          ? _value.functionName
          : functionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FCMEntityImpl extends _FCMEntity {
  const _$FCMEntityImpl(this.data, this.functionName) : super._();

  factory _$FCMEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FCMEntityImplFromJson(json);

  @override
  final dynamic data;
  @override
  final String functionName;

  @override
  String toString() {
    return 'FCMEntity(data: $data, functionName: $functionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FCMEntityImpl &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.functionName, functionName) ||
                other.functionName == functionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), functionName);

  /// Create a copy of FCMEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FCMEntityImplCopyWith<_$FCMEntityImpl> get copyWith =>
      __$$FCMEntityImplCopyWithImpl<_$FCMEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FCMEntityImplToJson(
      this,
    );
  }
}

abstract class _FCMEntity extends FCMEntity {
  const factory _FCMEntity(final dynamic data, final String functionName) =
      _$FCMEntityImpl;
  const _FCMEntity._() : super._();

  factory _FCMEntity.fromJson(Map<String, dynamic> json) =
      _$FCMEntityImpl.fromJson;

  @override
  dynamic get data;
  @override
  String get functionName;

  /// Create a copy of FCMEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FCMEntityImplCopyWith<_$FCMEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
