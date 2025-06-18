// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'naver_login_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NaverLoginResponseEntity _$NaverLoginResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _NaverLoginResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$NaverLoginResponseEntity {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;

  /// Serializes this NaverLoginResponseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NaverLoginResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NaverLoginResponseEntityCopyWith<NaverLoginResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverLoginResponseEntityCopyWith<$Res> {
  factory $NaverLoginResponseEntityCopyWith(NaverLoginResponseEntity value,
          $Res Function(NaverLoginResponseEntity) then) =
      _$NaverLoginResponseEntityCopyWithImpl<$Res, NaverLoginResponseEntity>;
  @useResult
  $Res call({String code, String message, String response});
}

/// @nodoc
class _$NaverLoginResponseEntityCopyWithImpl<$Res,
        $Val extends NaverLoginResponseEntity>
    implements $NaverLoginResponseEntityCopyWith<$Res> {
  _$NaverLoginResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NaverLoginResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NaverLoginResponseEntityImplCopyWith<$Res>
    implements $NaverLoginResponseEntityCopyWith<$Res> {
  factory _$$NaverLoginResponseEntityImplCopyWith(
          _$NaverLoginResponseEntityImpl value,
          $Res Function(_$NaverLoginResponseEntityImpl) then) =
      __$$NaverLoginResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String response});
}

/// @nodoc
class __$$NaverLoginResponseEntityImplCopyWithImpl<$Res>
    extends _$NaverLoginResponseEntityCopyWithImpl<$Res,
        _$NaverLoginResponseEntityImpl>
    implements _$$NaverLoginResponseEntityImplCopyWith<$Res> {
  __$$NaverLoginResponseEntityImplCopyWithImpl(
      _$NaverLoginResponseEntityImpl _value,
      $Res Function(_$NaverLoginResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of NaverLoginResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? response = null,
  }) {
    return _then(_$NaverLoginResponseEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NaverLoginResponseEntityImpl extends _NaverLoginResponseEntity {
  const _$NaverLoginResponseEntityImpl(
      {this.code = '', this.message = '', this.response = ''})
      : super._();

  factory _$NaverLoginResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$NaverLoginResponseEntityImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String response;

  @override
  String toString() {
    return 'NaverLoginResponseEntity(code: $code, message: $message, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverLoginResponseEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, response);

  /// Create a copy of NaverLoginResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverLoginResponseEntityImplCopyWith<_$NaverLoginResponseEntityImpl>
      get copyWith => __$$NaverLoginResponseEntityImplCopyWithImpl<
          _$NaverLoginResponseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NaverLoginResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _NaverLoginResponseEntity extends NaverLoginResponseEntity {
  const factory _NaverLoginResponseEntity(
      {final String code,
      final String message,
      final String response}) = _$NaverLoginResponseEntityImpl;
  const _NaverLoginResponseEntity._() : super._();

  factory _NaverLoginResponseEntity.fromJson(Map<String, dynamic> json) =
      _$NaverLoginResponseEntityImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  String get response;

  /// Create a copy of NaverLoginResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NaverLoginResponseEntityImplCopyWith<_$NaverLoginResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
