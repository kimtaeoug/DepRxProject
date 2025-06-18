// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fb_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBServicesModel _$FBServicesModelFromJson(Map<String, dynamic> json) {
  return _FBServicesModel.fromJson(json);
}

/// @nodoc
mixin _$FBServicesModel {
  FBAppinviteServiceModel get services => throw _privateConstructorUsedError;

  /// Serializes this FBServicesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FBServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FBServicesModelCopyWith<FBServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBServicesModelCopyWith<$Res> {
  factory $FBServicesModelCopyWith(
          FBServicesModel value, $Res Function(FBServicesModel) then) =
      _$FBServicesModelCopyWithImpl<$Res, FBServicesModel>;
  @useResult
  $Res call({FBAppinviteServiceModel services});

  $FBAppinviteServiceModelCopyWith<$Res> get services;
}

/// @nodoc
class _$FBServicesModelCopyWithImpl<$Res, $Val extends FBServicesModel>
    implements $FBServicesModelCopyWith<$Res> {
  _$FBServicesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FBServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as FBAppinviteServiceModel,
    ) as $Val);
  }

  /// Create a copy of FBServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FBAppinviteServiceModelCopyWith<$Res> get services {
    return $FBAppinviteServiceModelCopyWith<$Res>(_value.services, (value) {
      return _then(_value.copyWith(services: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FBServicesModelImplCopyWith<$Res>
    implements $FBServicesModelCopyWith<$Res> {
  factory _$$FBServicesModelImplCopyWith(_$FBServicesModelImpl value,
          $Res Function(_$FBServicesModelImpl) then) =
      __$$FBServicesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FBAppinviteServiceModel services});

  @override
  $FBAppinviteServiceModelCopyWith<$Res> get services;
}

/// @nodoc
class __$$FBServicesModelImplCopyWithImpl<$Res>
    extends _$FBServicesModelCopyWithImpl<$Res, _$FBServicesModelImpl>
    implements _$$FBServicesModelImplCopyWith<$Res> {
  __$$FBServicesModelImplCopyWithImpl(
      _$FBServicesModelImpl _value, $Res Function(_$FBServicesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FBServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
  }) {
    return _then(_$FBServicesModelImpl(
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as FBAppinviteServiceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBServicesModelImpl extends _FBServicesModel {
  const _$FBServicesModelImpl({this.services = const FBAppinviteServiceModel()})
      : super._();

  factory _$FBServicesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBServicesModelImplFromJson(json);

  @override
  @JsonKey()
  final FBAppinviteServiceModel services;

  @override
  String toString() {
    return 'FBServicesModel(services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBServicesModelImpl &&
            (identical(other.services, services) ||
                other.services == services));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, services);

  /// Create a copy of FBServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FBServicesModelImplCopyWith<_$FBServicesModelImpl> get copyWith =>
      __$$FBServicesModelImplCopyWithImpl<_$FBServicesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBServicesModelImplToJson(
      this,
    );
  }
}

abstract class _FBServicesModel extends FBServicesModel {
  const factory _FBServicesModel({final FBAppinviteServiceModel services}) =
      _$FBServicesModelImpl;
  const _FBServicesModel._() : super._();

  factory _FBServicesModel.fromJson(Map<String, dynamic> json) =
      _$FBServicesModelImpl.fromJson;

  @override
  FBAppinviteServiceModel get services;

  /// Create a copy of FBServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FBServicesModelImplCopyWith<_$FBServicesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
