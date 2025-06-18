// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LicenseModel _$LicenseModelFromJson(Map<String, dynamic> json) {
  return _LicenseModel.fromJson(json);
}

/// @nodoc
mixin _$LicenseModel {
  String get title => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  /// Serializes this LicenseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LicenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LicenseModelCopyWith<LicenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseModelCopyWith<$Res> {
  factory $LicenseModelCopyWith(
          LicenseModel value, $Res Function(LicenseModel) then) =
      _$LicenseModelCopyWithImpl<$Res, LicenseModel>;
  @useResult
  $Res call({String title, String data});
}

/// @nodoc
class _$LicenseModelCopyWithImpl<$Res, $Val extends LicenseModel>
    implements $LicenseModelCopyWith<$Res> {
  _$LicenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LicenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicenseModelImplCopyWith<$Res>
    implements $LicenseModelCopyWith<$Res> {
  factory _$$LicenseModelImplCopyWith(
          _$LicenseModelImpl value, $Res Function(_$LicenseModelImpl) then) =
      __$$LicenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String data});
}

/// @nodoc
class __$$LicenseModelImplCopyWithImpl<$Res>
    extends _$LicenseModelCopyWithImpl<$Res, _$LicenseModelImpl>
    implements _$$LicenseModelImplCopyWith<$Res> {
  __$$LicenseModelImplCopyWithImpl(
      _$LicenseModelImpl _value, $Res Function(_$LicenseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LicenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? data = null,
  }) {
    return _then(_$LicenseModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LicenseModelImpl extends _LicenseModel {
  const _$LicenseModelImpl({this.title = '', this.data = ''}) : super._();

  factory _$LicenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LicenseModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String data;

  @override
  String toString() {
    return 'LicenseModel(title: $title, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicenseModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, data);

  /// Create a copy of LicenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LicenseModelImplCopyWith<_$LicenseModelImpl> get copyWith =>
      __$$LicenseModelImplCopyWithImpl<_$LicenseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicenseModelImplToJson(
      this,
    );
  }
}

abstract class _LicenseModel extends LicenseModel {
  const factory _LicenseModel({final String title, final String data}) =
      _$LicenseModelImpl;
  const _LicenseModel._() : super._();

  factory _LicenseModel.fromJson(Map<String, dynamic> json) =
      _$LicenseModelImpl.fromJson;

  @override
  String get title;
  @override
  String get data;

  /// Create a copy of LicenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LicenseModelImplCopyWith<_$LicenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
