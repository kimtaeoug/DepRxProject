// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fb_project_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBProjectInfoModel _$FBProjectInfoModelFromJson(Map<String, dynamic> json) {
  return _FBProjectInfoModel.fromJson(json);
}

/// @nodoc
mixin _$FBProjectInfoModel {
  String get project_number => throw _privateConstructorUsedError;
  String get project_id => throw _privateConstructorUsedError;
  String get storage_bucket => throw _privateConstructorUsedError;

  /// Serializes this FBProjectInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FBProjectInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FBProjectInfoModelCopyWith<FBProjectInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBProjectInfoModelCopyWith<$Res> {
  factory $FBProjectInfoModelCopyWith(
          FBProjectInfoModel value, $Res Function(FBProjectInfoModel) then) =
      _$FBProjectInfoModelCopyWithImpl<$Res, FBProjectInfoModel>;
  @useResult
  $Res call({String project_number, String project_id, String storage_bucket});
}

/// @nodoc
class _$FBProjectInfoModelCopyWithImpl<$Res, $Val extends FBProjectInfoModel>
    implements $FBProjectInfoModelCopyWith<$Res> {
  _$FBProjectInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FBProjectInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project_number = null,
    Object? project_id = null,
    Object? storage_bucket = null,
  }) {
    return _then(_value.copyWith(
      project_number: null == project_number
          ? _value.project_number
          : project_number // ignore: cast_nullable_to_non_nullable
              as String,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as String,
      storage_bucket: null == storage_bucket
          ? _value.storage_bucket
          : storage_bucket // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FBProjectInfoModelImplCopyWith<$Res>
    implements $FBProjectInfoModelCopyWith<$Res> {
  factory _$$FBProjectInfoModelImplCopyWith(_$FBProjectInfoModelImpl value,
          $Res Function(_$FBProjectInfoModelImpl) then) =
      __$$FBProjectInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String project_number, String project_id, String storage_bucket});
}

/// @nodoc
class __$$FBProjectInfoModelImplCopyWithImpl<$Res>
    extends _$FBProjectInfoModelCopyWithImpl<$Res, _$FBProjectInfoModelImpl>
    implements _$$FBProjectInfoModelImplCopyWith<$Res> {
  __$$FBProjectInfoModelImplCopyWithImpl(_$FBProjectInfoModelImpl _value,
      $Res Function(_$FBProjectInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FBProjectInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project_number = null,
    Object? project_id = null,
    Object? storage_bucket = null,
  }) {
    return _then(_$FBProjectInfoModelImpl(
      project_number: null == project_number
          ? _value.project_number
          : project_number // ignore: cast_nullable_to_non_nullable
              as String,
      project_id: null == project_id
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as String,
      storage_bucket: null == storage_bucket
          ? _value.storage_bucket
          : storage_bucket // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBProjectInfoModelImpl extends _FBProjectInfoModel {
  const _$FBProjectInfoModelImpl(
      {this.project_number = '',
      this.project_id = '',
      this.storage_bucket = ''})
      : super._();

  factory _$FBProjectInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBProjectInfoModelImplFromJson(json);

  @override
  @JsonKey()
  final String project_number;
  @override
  @JsonKey()
  final String project_id;
  @override
  @JsonKey()
  final String storage_bucket;

  @override
  String toString() {
    return 'FBProjectInfoModel(project_number: $project_number, project_id: $project_id, storage_bucket: $storage_bucket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBProjectInfoModelImpl &&
            (identical(other.project_number, project_number) ||
                other.project_number == project_number) &&
            (identical(other.project_id, project_id) ||
                other.project_id == project_id) &&
            (identical(other.storage_bucket, storage_bucket) ||
                other.storage_bucket == storage_bucket));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, project_number, project_id, storage_bucket);

  /// Create a copy of FBProjectInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FBProjectInfoModelImplCopyWith<_$FBProjectInfoModelImpl> get copyWith =>
      __$$FBProjectInfoModelImplCopyWithImpl<_$FBProjectInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBProjectInfoModelImplToJson(
      this,
    );
  }
}

abstract class _FBProjectInfoModel extends FBProjectInfoModel {
  const factory _FBProjectInfoModel(
      {final String project_number,
      final String project_id,
      final String storage_bucket}) = _$FBProjectInfoModelImpl;
  const _FBProjectInfoModel._() : super._();

  factory _FBProjectInfoModel.fromJson(Map<String, dynamic> json) =
      _$FBProjectInfoModelImpl.fromJson;

  @override
  String get project_number;
  @override
  String get project_id;
  @override
  String get storage_bucket;

  /// Create a copy of FBProjectInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FBProjectInfoModelImplCopyWith<_$FBProjectInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
