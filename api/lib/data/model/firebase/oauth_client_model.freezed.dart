// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OauthClientModel _$OauthClientModelFromJson(Map<String, dynamic> json) {
  return _OauthClientModel.fromJson(json);
}

/// @nodoc
mixin _$OauthClientModel {
  String get client_id => throw _privateConstructorUsedError;
  int get client_type => throw _privateConstructorUsedError;
  dynamic get android_info => throw _privateConstructorUsedError;

  /// Serializes this OauthClientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OauthClientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OauthClientModelCopyWith<OauthClientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OauthClientModelCopyWith<$Res> {
  factory $OauthClientModelCopyWith(
          OauthClientModel value, $Res Function(OauthClientModel) then) =
      _$OauthClientModelCopyWithImpl<$Res, OauthClientModel>;
  @useResult
  $Res call({String client_id, int client_type, dynamic android_info});
}

/// @nodoc
class _$OauthClientModelCopyWithImpl<$Res, $Val extends OauthClientModel>
    implements $OauthClientModelCopyWith<$Res> {
  _$OauthClientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OauthClientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client_id = null,
    Object? client_type = null,
    Object? android_info = freezed,
  }) {
    return _then(_value.copyWith(
      client_id: null == client_id
          ? _value.client_id
          : client_id // ignore: cast_nullable_to_non_nullable
              as String,
      client_type: null == client_type
          ? _value.client_type
          : client_type // ignore: cast_nullable_to_non_nullable
              as int,
      android_info: freezed == android_info
          ? _value.android_info
          : android_info // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OauthClientModelImplCopyWith<$Res>
    implements $OauthClientModelCopyWith<$Res> {
  factory _$$OauthClientModelImplCopyWith(_$OauthClientModelImpl value,
          $Res Function(_$OauthClientModelImpl) then) =
      __$$OauthClientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String client_id, int client_type, dynamic android_info});
}

/// @nodoc
class __$$OauthClientModelImplCopyWithImpl<$Res>
    extends _$OauthClientModelCopyWithImpl<$Res, _$OauthClientModelImpl>
    implements _$$OauthClientModelImplCopyWith<$Res> {
  __$$OauthClientModelImplCopyWithImpl(_$OauthClientModelImpl _value,
      $Res Function(_$OauthClientModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OauthClientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client_id = null,
    Object? client_type = null,
    Object? android_info = freezed,
  }) {
    return _then(_$OauthClientModelImpl(
      client_id: null == client_id
          ? _value.client_id
          : client_id // ignore: cast_nullable_to_non_nullable
              as String,
      client_type: null == client_type
          ? _value.client_type
          : client_type // ignore: cast_nullable_to_non_nullable
              as int,
      android_info: freezed == android_info
          ? _value.android_info
          : android_info // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OauthClientModelImpl extends _OauthClientModel {
  const _$OauthClientModelImpl(
      {this.client_id = '', this.client_type = 0, this.android_info = null})
      : super._();

  factory _$OauthClientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OauthClientModelImplFromJson(json);

  @override
  @JsonKey()
  final String client_id;
  @override
  @JsonKey()
  final int client_type;
  @override
  @JsonKey()
  final dynamic android_info;

  @override
  String toString() {
    return 'OauthClientModel(client_id: $client_id, client_type: $client_type, android_info: $android_info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OauthClientModelImpl &&
            (identical(other.client_id, client_id) ||
                other.client_id == client_id) &&
            (identical(other.client_type, client_type) ||
                other.client_type == client_type) &&
            const DeepCollectionEquality()
                .equals(other.android_info, android_info));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, client_id, client_type,
      const DeepCollectionEquality().hash(android_info));

  /// Create a copy of OauthClientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OauthClientModelImplCopyWith<_$OauthClientModelImpl> get copyWith =>
      __$$OauthClientModelImplCopyWithImpl<_$OauthClientModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OauthClientModelImplToJson(
      this,
    );
  }
}

abstract class _OauthClientModel extends OauthClientModel {
  const factory _OauthClientModel(
      {final String client_id,
      final int client_type,
      final dynamic android_info}) = _$OauthClientModelImpl;
  const _OauthClientModel._() : super._();

  factory _OauthClientModel.fromJson(Map<String, dynamic> json) =
      _$OauthClientModelImpl.fromJson;

  @override
  String get client_id;
  @override
  int get client_type;
  @override
  dynamic get android_info;

  /// Create a copy of OauthClientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OauthClientModelImplCopyWith<_$OauthClientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
