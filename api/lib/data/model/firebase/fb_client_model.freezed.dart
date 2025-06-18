// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fb_client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBClientModel _$FBClientModelFromJson(Map<String, dynamic> json) {
  return _FBClientModel.fromJson(json);
}

/// @nodoc
mixin _$FBClientModel {
  FBClientInfoModel get client_info => throw _privateConstructorUsedError;
  List<OauthClientModel> get oauth_client => throw _privateConstructorUsedError;
  List<FBAPIKeyItemModel> get api_key => throw _privateConstructorUsedError;
  FBServicesModel get services => throw _privateConstructorUsedError;

  /// Serializes this FBClientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FBClientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FBClientModelCopyWith<FBClientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBClientModelCopyWith<$Res> {
  factory $FBClientModelCopyWith(
          FBClientModel value, $Res Function(FBClientModel) then) =
      _$FBClientModelCopyWithImpl<$Res, FBClientModel>;
  @useResult
  $Res call(
      {FBClientInfoModel client_info,
      List<OauthClientModel> oauth_client,
      List<FBAPIKeyItemModel> api_key,
      FBServicesModel services});

  $FBClientInfoModelCopyWith<$Res> get client_info;
  $FBServicesModelCopyWith<$Res> get services;
}

/// @nodoc
class _$FBClientModelCopyWithImpl<$Res, $Val extends FBClientModel>
    implements $FBClientModelCopyWith<$Res> {
  _$FBClientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FBClientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client_info = null,
    Object? oauth_client = null,
    Object? api_key = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      client_info: null == client_info
          ? _value.client_info
          : client_info // ignore: cast_nullable_to_non_nullable
              as FBClientInfoModel,
      oauth_client: null == oauth_client
          ? _value.oauth_client
          : oauth_client // ignore: cast_nullable_to_non_nullable
              as List<OauthClientModel>,
      api_key: null == api_key
          ? _value.api_key
          : api_key // ignore: cast_nullable_to_non_nullable
              as List<FBAPIKeyItemModel>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as FBServicesModel,
    ) as $Val);
  }

  /// Create a copy of FBClientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FBClientInfoModelCopyWith<$Res> get client_info {
    return $FBClientInfoModelCopyWith<$Res>(_value.client_info, (value) {
      return _then(_value.copyWith(client_info: value) as $Val);
    });
  }

  /// Create a copy of FBClientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FBServicesModelCopyWith<$Res> get services {
    return $FBServicesModelCopyWith<$Res>(_value.services, (value) {
      return _then(_value.copyWith(services: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FBClientModelImplCopyWith<$Res>
    implements $FBClientModelCopyWith<$Res> {
  factory _$$FBClientModelImplCopyWith(
          _$FBClientModelImpl value, $Res Function(_$FBClientModelImpl) then) =
      __$$FBClientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FBClientInfoModel client_info,
      List<OauthClientModel> oauth_client,
      List<FBAPIKeyItemModel> api_key,
      FBServicesModel services});

  @override
  $FBClientInfoModelCopyWith<$Res> get client_info;
  @override
  $FBServicesModelCopyWith<$Res> get services;
}

/// @nodoc
class __$$FBClientModelImplCopyWithImpl<$Res>
    extends _$FBClientModelCopyWithImpl<$Res, _$FBClientModelImpl>
    implements _$$FBClientModelImplCopyWith<$Res> {
  __$$FBClientModelImplCopyWithImpl(
      _$FBClientModelImpl _value, $Res Function(_$FBClientModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FBClientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client_info = null,
    Object? oauth_client = null,
    Object? api_key = null,
    Object? services = null,
  }) {
    return _then(_$FBClientModelImpl(
      client_info: null == client_info
          ? _value.client_info
          : client_info // ignore: cast_nullable_to_non_nullable
              as FBClientInfoModel,
      oauth_client: null == oauth_client
          ? _value._oauth_client
          : oauth_client // ignore: cast_nullable_to_non_nullable
              as List<OauthClientModel>,
      api_key: null == api_key
          ? _value._api_key
          : api_key // ignore: cast_nullable_to_non_nullable
              as List<FBAPIKeyItemModel>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as FBServicesModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBClientModelImpl extends _FBClientModel {
  const _$FBClientModelImpl(
      {this.client_info = const FBClientInfoModel(),
      final List<OauthClientModel> oauth_client = const [],
      final List<FBAPIKeyItemModel> api_key = const [],
      this.services = const FBServicesModel()})
      : _oauth_client = oauth_client,
        _api_key = api_key,
        super._();

  factory _$FBClientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBClientModelImplFromJson(json);

  @override
  @JsonKey()
  final FBClientInfoModel client_info;
  final List<OauthClientModel> _oauth_client;
  @override
  @JsonKey()
  List<OauthClientModel> get oauth_client {
    if (_oauth_client is EqualUnmodifiableListView) return _oauth_client;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_oauth_client);
  }

  final List<FBAPIKeyItemModel> _api_key;
  @override
  @JsonKey()
  List<FBAPIKeyItemModel> get api_key {
    if (_api_key is EqualUnmodifiableListView) return _api_key;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_api_key);
  }

  @override
  @JsonKey()
  final FBServicesModel services;

  @override
  String toString() {
    return 'FBClientModel(client_info: $client_info, oauth_client: $oauth_client, api_key: $api_key, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBClientModelImpl &&
            (identical(other.client_info, client_info) ||
                other.client_info == client_info) &&
            const DeepCollectionEquality()
                .equals(other._oauth_client, _oauth_client) &&
            const DeepCollectionEquality().equals(other._api_key, _api_key) &&
            (identical(other.services, services) ||
                other.services == services));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      client_info,
      const DeepCollectionEquality().hash(_oauth_client),
      const DeepCollectionEquality().hash(_api_key),
      services);

  /// Create a copy of FBClientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FBClientModelImplCopyWith<_$FBClientModelImpl> get copyWith =>
      __$$FBClientModelImplCopyWithImpl<_$FBClientModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBClientModelImplToJson(
      this,
    );
  }
}

abstract class _FBClientModel extends FBClientModel {
  const factory _FBClientModel(
      {final FBClientInfoModel client_info,
      final List<OauthClientModel> oauth_client,
      final List<FBAPIKeyItemModel> api_key,
      final FBServicesModel services}) = _$FBClientModelImpl;
  const _FBClientModel._() : super._();

  factory _FBClientModel.fromJson(Map<String, dynamic> json) =
      _$FBClientModelImpl.fromJson;

  @override
  FBClientInfoModel get client_info;
  @override
  List<OauthClientModel> get oauth_client;
  @override
  List<FBAPIKeyItemModel> get api_key;
  @override
  FBServicesModel get services;

  /// Create a copy of FBClientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FBClientModelImplCopyWith<_$FBClientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
