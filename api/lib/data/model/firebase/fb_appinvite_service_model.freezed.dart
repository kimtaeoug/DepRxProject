// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fb_appinvite_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBAppinviteServiceModel _$FBAppinviteServiceModelFromJson(
    Map<String, dynamic> json) {
  return _FBAppinviteServiceModel.fromJson(json);
}

/// @nodoc
mixin _$FBAppinviteServiceModel {
  List<String> get other_platform_oauth_client =>
      throw _privateConstructorUsedError;

  /// Serializes this FBAppinviteServiceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FBAppinviteServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FBAppinviteServiceModelCopyWith<FBAppinviteServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBAppinviteServiceModelCopyWith<$Res> {
  factory $FBAppinviteServiceModelCopyWith(FBAppinviteServiceModel value,
          $Res Function(FBAppinviteServiceModel) then) =
      _$FBAppinviteServiceModelCopyWithImpl<$Res, FBAppinviteServiceModel>;
  @useResult
  $Res call({List<String> other_platform_oauth_client});
}

/// @nodoc
class _$FBAppinviteServiceModelCopyWithImpl<$Res,
        $Val extends FBAppinviteServiceModel>
    implements $FBAppinviteServiceModelCopyWith<$Res> {
  _$FBAppinviteServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FBAppinviteServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other_platform_oauth_client = null,
  }) {
    return _then(_value.copyWith(
      other_platform_oauth_client: null == other_platform_oauth_client
          ? _value.other_platform_oauth_client
          : other_platform_oauth_client // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FBAppinviteServiceModelImplCopyWith<$Res>
    implements $FBAppinviteServiceModelCopyWith<$Res> {
  factory _$$FBAppinviteServiceModelImplCopyWith(
          _$FBAppinviteServiceModelImpl value,
          $Res Function(_$FBAppinviteServiceModelImpl) then) =
      __$$FBAppinviteServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> other_platform_oauth_client});
}

/// @nodoc
class __$$FBAppinviteServiceModelImplCopyWithImpl<$Res>
    extends _$FBAppinviteServiceModelCopyWithImpl<$Res,
        _$FBAppinviteServiceModelImpl>
    implements _$$FBAppinviteServiceModelImplCopyWith<$Res> {
  __$$FBAppinviteServiceModelImplCopyWithImpl(
      _$FBAppinviteServiceModelImpl _value,
      $Res Function(_$FBAppinviteServiceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FBAppinviteServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other_platform_oauth_client = null,
  }) {
    return _then(_$FBAppinviteServiceModelImpl(
      other_platform_oauth_client: null == other_platform_oauth_client
          ? _value._other_platform_oauth_client
          : other_platform_oauth_client // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBAppinviteServiceModelImpl extends _FBAppinviteServiceModel {
  const _$FBAppinviteServiceModelImpl(
      {final List<String> other_platform_oauth_client = const []})
      : _other_platform_oauth_client = other_platform_oauth_client,
        super._();

  factory _$FBAppinviteServiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBAppinviteServiceModelImplFromJson(json);

  final List<String> _other_platform_oauth_client;
  @override
  @JsonKey()
  List<String> get other_platform_oauth_client {
    if (_other_platform_oauth_client is EqualUnmodifiableListView)
      return _other_platform_oauth_client;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_other_platform_oauth_client);
  }

  @override
  String toString() {
    return 'FBAppinviteServiceModel(other_platform_oauth_client: $other_platform_oauth_client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBAppinviteServiceModelImpl &&
            const DeepCollectionEquality().equals(
                other._other_platform_oauth_client,
                _other_platform_oauth_client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_other_platform_oauth_client));

  /// Create a copy of FBAppinviteServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FBAppinviteServiceModelImplCopyWith<_$FBAppinviteServiceModelImpl>
      get copyWith => __$$FBAppinviteServiceModelImplCopyWithImpl<
          _$FBAppinviteServiceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBAppinviteServiceModelImplToJson(
      this,
    );
  }
}

abstract class _FBAppinviteServiceModel extends FBAppinviteServiceModel {
  const factory _FBAppinviteServiceModel(
          {final List<String> other_platform_oauth_client}) =
      _$FBAppinviteServiceModelImpl;
  const _FBAppinviteServiceModel._() : super._();

  factory _FBAppinviteServiceModel.fromJson(Map<String, dynamic> json) =
      _$FBAppinviteServiceModelImpl.fromJson;

  @override
  List<String> get other_platform_oauth_client;

  /// Create a copy of FBAppinviteServiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FBAppinviteServiceModelImplCopyWith<_$FBAppinviteServiceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
