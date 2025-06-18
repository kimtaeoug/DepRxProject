// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cert_phone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CertPhoneModel _$CertPhoneModelFromJson(Map<String, dynamic> json) {
  return _CertPhoneModel.fromJson(json);
}

/// @nodoc
mixin _$CertPhoneModel {
  String get number => throw _privateConstructorUsedError;
  String get expiredTime => throw _privateConstructorUsedError;

  /// Serializes this CertPhoneModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CertPhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertPhoneModelCopyWith<CertPhoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertPhoneModelCopyWith<$Res> {
  factory $CertPhoneModelCopyWith(
          CertPhoneModel value, $Res Function(CertPhoneModel) then) =
      _$CertPhoneModelCopyWithImpl<$Res, CertPhoneModel>;
  @useResult
  $Res call({String number, String expiredTime});
}

/// @nodoc
class _$CertPhoneModelCopyWithImpl<$Res, $Val extends CertPhoneModel>
    implements $CertPhoneModelCopyWith<$Res> {
  _$CertPhoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertPhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? expiredTime = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expiredTime: null == expiredTime
          ? _value.expiredTime
          : expiredTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertPhoneModelImplCopyWith<$Res>
    implements $CertPhoneModelCopyWith<$Res> {
  factory _$$CertPhoneModelImplCopyWith(_$CertPhoneModelImpl value,
          $Res Function(_$CertPhoneModelImpl) then) =
      __$$CertPhoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String number, String expiredTime});
}

/// @nodoc
class __$$CertPhoneModelImplCopyWithImpl<$Res>
    extends _$CertPhoneModelCopyWithImpl<$Res, _$CertPhoneModelImpl>
    implements _$$CertPhoneModelImplCopyWith<$Res> {
  __$$CertPhoneModelImplCopyWithImpl(
      _$CertPhoneModelImpl _value, $Res Function(_$CertPhoneModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertPhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? expiredTime = null,
  }) {
    return _then(_$CertPhoneModelImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expiredTime: null == expiredTime
          ? _value.expiredTime
          : expiredTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CertPhoneModelImpl extends _CertPhoneModel {
  const _$CertPhoneModelImpl({this.number = '', this.expiredTime = ''})
      : super._();

  factory _$CertPhoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CertPhoneModelImplFromJson(json);

  @override
  @JsonKey()
  final String number;
  @override
  @JsonKey()
  final String expiredTime;

  @override
  String toString() {
    return 'CertPhoneModel(number: $number, expiredTime: $expiredTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertPhoneModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.expiredTime, expiredTime) ||
                other.expiredTime == expiredTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, expiredTime);

  /// Create a copy of CertPhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertPhoneModelImplCopyWith<_$CertPhoneModelImpl> get copyWith =>
      __$$CertPhoneModelImplCopyWithImpl<_$CertPhoneModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertPhoneModelImplToJson(
      this,
    );
  }
}

abstract class _CertPhoneModel extends CertPhoneModel {
  const factory _CertPhoneModel(
      {final String number, final String expiredTime}) = _$CertPhoneModelImpl;
  const _CertPhoneModel._() : super._();

  factory _CertPhoneModel.fromJson(Map<String, dynamic> json) =
      _$CertPhoneModelImpl.fromJson;

  @override
  String get number;
  @override
  String get expiredTime;

  /// Create a copy of CertPhoneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertPhoneModelImplCopyWith<_$CertPhoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
