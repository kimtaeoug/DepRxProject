// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deactivate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeactivateModel _$DeactivateModelFromJson(Map<String, dynamic> json) {
  return _DeactivateModel.fromJson(json);
}

/// @nodoc
mixin _$DeactivateModel {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this DeactivateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeactivateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeactivateModelCopyWith<DeactivateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeactivateModelCopyWith<$Res> {
  factory $DeactivateModelCopyWith(
          DeactivateModel value, $Res Function(DeactivateModel) then) =
      _$DeactivateModelCopyWithImpl<$Res, DeactivateModel>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$DeactivateModelCopyWithImpl<$Res, $Val extends DeactivateModel>
    implements $DeactivateModelCopyWith<$Res> {
  _$DeactivateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeactivateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeactivateModelImplCopyWith<$Res>
    implements $DeactivateModelCopyWith<$Res> {
  factory _$$DeactivateModelImplCopyWith(_$DeactivateModelImpl value,
          $Res Function(_$DeactivateModelImpl) then) =
      __$$DeactivateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeactivateModelImplCopyWithImpl<$Res>
    extends _$DeactivateModelCopyWithImpl<$Res, _$DeactivateModelImpl>
    implements _$$DeactivateModelImplCopyWith<$Res> {
  __$$DeactivateModelImplCopyWithImpl(
      _$DeactivateModelImpl _value, $Res Function(_$DeactivateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeactivateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeactivateModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeactivateModelImpl extends _DeactivateModel {
  const _$DeactivateModelImpl({this.id = ''}) : super._();

  factory _$DeactivateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeactivateModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'DeactivateModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeactivateModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of DeactivateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeactivateModelImplCopyWith<_$DeactivateModelImpl> get copyWith =>
      __$$DeactivateModelImplCopyWithImpl<_$DeactivateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeactivateModelImplToJson(
      this,
    );
  }
}

abstract class _DeactivateModel extends DeactivateModel {
  const factory _DeactivateModel({final String id}) = _$DeactivateModelImpl;
  const _DeactivateModel._() : super._();

  factory _DeactivateModel.fromJson(Map<String, dynamic> json) =
      _$DeactivateModelImpl.fromJson;

  @override
  String get id;

  /// Create a copy of DeactivateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeactivateModelImplCopyWith<_$DeactivateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
