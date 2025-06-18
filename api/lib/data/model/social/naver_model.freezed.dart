// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'naver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NaverModel _$NaverModelFromJson(Map<String, dynamic> json) {
  return _NaverModel.fromJson(json);
}

/// @nodoc
mixin _$NaverModel {
  String get code => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get error_description => throw _privateConstructorUsedError;

  /// Serializes this NaverModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NaverModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NaverModelCopyWith<NaverModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverModelCopyWith<$Res> {
  factory $NaverModelCopyWith(
          NaverModel value, $Res Function(NaverModel) then) =
      _$NaverModelCopyWithImpl<$Res, NaverModel>;
  @useResult
  $Res call(
      {String code, String state, String error, String error_description});
}

/// @nodoc
class _$NaverModelCopyWithImpl<$Res, $Val extends NaverModel>
    implements $NaverModelCopyWith<$Res> {
  _$NaverModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NaverModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? state = null,
    Object? error = null,
    Object? error_description = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      error_description: null == error_description
          ? _value.error_description
          : error_description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NaverModelImplCopyWith<$Res>
    implements $NaverModelCopyWith<$Res> {
  factory _$$NaverModelImplCopyWith(
          _$NaverModelImpl value, $Res Function(_$NaverModelImpl) then) =
      __$$NaverModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String state, String error, String error_description});
}

/// @nodoc
class __$$NaverModelImplCopyWithImpl<$Res>
    extends _$NaverModelCopyWithImpl<$Res, _$NaverModelImpl>
    implements _$$NaverModelImplCopyWith<$Res> {
  __$$NaverModelImplCopyWithImpl(
      _$NaverModelImpl _value, $Res Function(_$NaverModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NaverModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? state = null,
    Object? error = null,
    Object? error_description = null,
  }) {
    return _then(_$NaverModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      error_description: null == error_description
          ? _value.error_description
          : error_description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NaverModelImpl extends _NaverModel {
  const _$NaverModelImpl(
      {this.code = '',
      this.state = '',
      this.error = '',
      this.error_description = ''})
      : super._();

  factory _$NaverModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NaverModelImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final String error_description;

  @override
  String toString() {
    return 'NaverModel(code: $code, state: $state, error: $error, error_description: $error_description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.error_description, error_description) ||
                other.error_description == error_description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, state, error, error_description);

  /// Create a copy of NaverModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverModelImplCopyWith<_$NaverModelImpl> get copyWith =>
      __$$NaverModelImplCopyWithImpl<_$NaverModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NaverModelImplToJson(
      this,
    );
  }
}

abstract class _NaverModel extends NaverModel {
  const factory _NaverModel(
      {final String code,
      final String state,
      final String error,
      final String error_description}) = _$NaverModelImpl;
  const _NaverModel._() : super._();

  factory _NaverModel.fromJson(Map<String, dynamic> json) =
      _$NaverModelImpl.fromJson;

  @override
  String get code;
  @override
  String get state;
  @override
  String get error;
  @override
  String get error_description;

  /// Create a copy of NaverModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NaverModelImplCopyWith<_$NaverModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
