// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirebaseOptionModel _$FirebaseOptionModelFromJson(Map<String, dynamic> json) {
  return _FirebaseOptionModel.fromJson(json);
}

/// @nodoc
mixin _$FirebaseOptionModel {
  FBProjectInfoModel get project_info => throw _privateConstructorUsedError;
  List<FBClientModel> get client => throw _privateConstructorUsedError;
  String get configuration_version => throw _privateConstructorUsedError;

  /// Serializes this FirebaseOptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FirebaseOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirebaseOptionModelCopyWith<FirebaseOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseOptionModelCopyWith<$Res> {
  factory $FirebaseOptionModelCopyWith(
          FirebaseOptionModel value, $Res Function(FirebaseOptionModel) then) =
      _$FirebaseOptionModelCopyWithImpl<$Res, FirebaseOptionModel>;
  @useResult
  $Res call(
      {FBProjectInfoModel project_info,
      List<FBClientModel> client,
      String configuration_version});

  $FBProjectInfoModelCopyWith<$Res> get project_info;
}

/// @nodoc
class _$FirebaseOptionModelCopyWithImpl<$Res, $Val extends FirebaseOptionModel>
    implements $FirebaseOptionModelCopyWith<$Res> {
  _$FirebaseOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirebaseOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project_info = null,
    Object? client = null,
    Object? configuration_version = null,
  }) {
    return _then(_value.copyWith(
      project_info: null == project_info
          ? _value.project_info
          : project_info // ignore: cast_nullable_to_non_nullable
              as FBProjectInfoModel,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as List<FBClientModel>,
      configuration_version: null == configuration_version
          ? _value.configuration_version
          : configuration_version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of FirebaseOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FBProjectInfoModelCopyWith<$Res> get project_info {
    return $FBProjectInfoModelCopyWith<$Res>(_value.project_info, (value) {
      return _then(_value.copyWith(project_info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FirebaseOptionModelImplCopyWith<$Res>
    implements $FirebaseOptionModelCopyWith<$Res> {
  factory _$$FirebaseOptionModelImplCopyWith(_$FirebaseOptionModelImpl value,
          $Res Function(_$FirebaseOptionModelImpl) then) =
      __$$FirebaseOptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FBProjectInfoModel project_info,
      List<FBClientModel> client,
      String configuration_version});

  @override
  $FBProjectInfoModelCopyWith<$Res> get project_info;
}

/// @nodoc
class __$$FirebaseOptionModelImplCopyWithImpl<$Res>
    extends _$FirebaseOptionModelCopyWithImpl<$Res, _$FirebaseOptionModelImpl>
    implements _$$FirebaseOptionModelImplCopyWith<$Res> {
  __$$FirebaseOptionModelImplCopyWithImpl(_$FirebaseOptionModelImpl _value,
      $Res Function(_$FirebaseOptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirebaseOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project_info = null,
    Object? client = null,
    Object? configuration_version = null,
  }) {
    return _then(_$FirebaseOptionModelImpl(
      project_info: null == project_info
          ? _value.project_info
          : project_info // ignore: cast_nullable_to_non_nullable
              as FBProjectInfoModel,
      client: null == client
          ? _value._client
          : client // ignore: cast_nullable_to_non_nullable
              as List<FBClientModel>,
      configuration_version: null == configuration_version
          ? _value.configuration_version
          : configuration_version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseOptionModelImpl extends _FirebaseOptionModel {
  const _$FirebaseOptionModelImpl(
      {this.project_info = const FBProjectInfoModel(),
      final List<FBClientModel> client = const [],
      this.configuration_version = ''})
      : _client = client,
        super._();

  factory _$FirebaseOptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseOptionModelImplFromJson(json);

  @override
  @JsonKey()
  final FBProjectInfoModel project_info;
  final List<FBClientModel> _client;
  @override
  @JsonKey()
  List<FBClientModel> get client {
    if (_client is EqualUnmodifiableListView) return _client;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_client);
  }

  @override
  @JsonKey()
  final String configuration_version;

  @override
  String toString() {
    return 'FirebaseOptionModel(project_info: $project_info, client: $client, configuration_version: $configuration_version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseOptionModelImpl &&
            (identical(other.project_info, project_info) ||
                other.project_info == project_info) &&
            const DeepCollectionEquality().equals(other._client, _client) &&
            (identical(other.configuration_version, configuration_version) ||
                other.configuration_version == configuration_version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, project_info,
      const DeepCollectionEquality().hash(_client), configuration_version);

  /// Create a copy of FirebaseOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseOptionModelImplCopyWith<_$FirebaseOptionModelImpl> get copyWith =>
      __$$FirebaseOptionModelImplCopyWithImpl<_$FirebaseOptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseOptionModelImplToJson(
      this,
    );
  }
}

abstract class _FirebaseOptionModel extends FirebaseOptionModel {
  const factory _FirebaseOptionModel(
      {final FBProjectInfoModel project_info,
      final List<FBClientModel> client,
      final String configuration_version}) = _$FirebaseOptionModelImpl;
  const _FirebaseOptionModel._() : super._();

  factory _FirebaseOptionModel.fromJson(Map<String, dynamic> json) =
      _$FirebaseOptionModelImpl.fromJson;

  @override
  FBProjectInfoModel get project_info;
  @override
  List<FBClientModel> get client;
  @override
  String get configuration_version;

  /// Create a copy of FirebaseOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseOptionModelImplCopyWith<_$FirebaseOptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
