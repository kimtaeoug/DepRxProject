// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindIdModel _$FindIdModelFromJson(Map<String, dynamic> json) {
  return _FindIdModel.fromJson(json);
}

/// @nodoc
mixin _$FindIdModel {
  String get id => throw _privateConstructorUsedError;
  String get socialsType => throw _privateConstructorUsedError;

  /// Serializes this FindIdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindIdModelCopyWith<FindIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindIdModelCopyWith<$Res> {
  factory $FindIdModelCopyWith(
          FindIdModel value, $Res Function(FindIdModel) then) =
      _$FindIdModelCopyWithImpl<$Res, FindIdModel>;
  @useResult
  $Res call({String id, String socialsType});
}

/// @nodoc
class _$FindIdModelCopyWithImpl<$Res, $Val extends FindIdModel>
    implements $FindIdModelCopyWith<$Res> {
  _$FindIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? socialsType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      socialsType: null == socialsType
          ? _value.socialsType
          : socialsType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindIdModelImplCopyWith<$Res>
    implements $FindIdModelCopyWith<$Res> {
  factory _$$FindIdModelImplCopyWith(
          _$FindIdModelImpl value, $Res Function(_$FindIdModelImpl) then) =
      __$$FindIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String socialsType});
}

/// @nodoc
class __$$FindIdModelImplCopyWithImpl<$Res>
    extends _$FindIdModelCopyWithImpl<$Res, _$FindIdModelImpl>
    implements _$$FindIdModelImplCopyWith<$Res> {
  __$$FindIdModelImplCopyWithImpl(
      _$FindIdModelImpl _value, $Res Function(_$FindIdModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? socialsType = null,
  }) {
    return _then(_$FindIdModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      socialsType: null == socialsType
          ? _value.socialsType
          : socialsType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindIdModelImpl extends _FindIdModel {
  const _$FindIdModelImpl({this.id = '', this.socialsType = ''}) : super._();

  factory _$FindIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindIdModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String socialsType;

  @override
  String toString() {
    return 'FindIdModel(id: $id, socialsType: $socialsType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindIdModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.socialsType, socialsType) ||
                other.socialsType == socialsType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, socialsType);

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindIdModelImplCopyWith<_$FindIdModelImpl> get copyWith =>
      __$$FindIdModelImplCopyWithImpl<_$FindIdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindIdModelImplToJson(
      this,
    );
  }
}

abstract class _FindIdModel extends FindIdModel {
  const factory _FindIdModel({final String id, final String socialsType}) =
      _$FindIdModelImpl;
  const _FindIdModel._() : super._();

  factory _FindIdModel.fromJson(Map<String, dynamic> json) =
      _$FindIdModelImpl.fromJson;

  @override
  String get id;
  @override
  String get socialsType;

  /// Create a copy of FindIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindIdModelImplCopyWith<_$FindIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
