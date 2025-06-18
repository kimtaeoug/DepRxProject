// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bdi_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BDIResultModel _$BDIResultModelFromJson(Map<String, dynamic> json) {
  return _BDIResultModel.fromJson(json);
}

/// @nodoc
mixin _$BDIResultModel {
  int get bdiResult => throw _privateConstructorUsedError;

  /// Serializes this BDIResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BDIResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BDIResultModelCopyWith<BDIResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BDIResultModelCopyWith<$Res> {
  factory $BDIResultModelCopyWith(
          BDIResultModel value, $Res Function(BDIResultModel) then) =
      _$BDIResultModelCopyWithImpl<$Res, BDIResultModel>;
  @useResult
  $Res call({int bdiResult});
}

/// @nodoc
class _$BDIResultModelCopyWithImpl<$Res, $Val extends BDIResultModel>
    implements $BDIResultModelCopyWith<$Res> {
  _$BDIResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BDIResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bdiResult = null,
  }) {
    return _then(_value.copyWith(
      bdiResult: null == bdiResult
          ? _value.bdiResult
          : bdiResult // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BDIResultModelImplCopyWith<$Res>
    implements $BDIResultModelCopyWith<$Res> {
  factory _$$BDIResultModelImplCopyWith(_$BDIResultModelImpl value,
          $Res Function(_$BDIResultModelImpl) then) =
      __$$BDIResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int bdiResult});
}

/// @nodoc
class __$$BDIResultModelImplCopyWithImpl<$Res>
    extends _$BDIResultModelCopyWithImpl<$Res, _$BDIResultModelImpl>
    implements _$$BDIResultModelImplCopyWith<$Res> {
  __$$BDIResultModelImplCopyWithImpl(
      _$BDIResultModelImpl _value, $Res Function(_$BDIResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BDIResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bdiResult = null,
  }) {
    return _then(_$BDIResultModelImpl(
      bdiResult: null == bdiResult
          ? _value.bdiResult
          : bdiResult // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BDIResultModelImpl extends _BDIResultModel {
  const _$BDIResultModelImpl({this.bdiResult = 0}) : super._();

  factory _$BDIResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BDIResultModelImplFromJson(json);

  @override
  @JsonKey()
  final int bdiResult;

  @override
  String toString() {
    return 'BDIResultModel(bdiResult: $bdiResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BDIResultModelImpl &&
            (identical(other.bdiResult, bdiResult) ||
                other.bdiResult == bdiResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bdiResult);

  /// Create a copy of BDIResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BDIResultModelImplCopyWith<_$BDIResultModelImpl> get copyWith =>
      __$$BDIResultModelImplCopyWithImpl<_$BDIResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BDIResultModelImplToJson(
      this,
    );
  }
}

abstract class _BDIResultModel extends BDIResultModel {
  const factory _BDIResultModel({final int bdiResult}) = _$BDIResultModelImpl;
  const _BDIResultModel._() : super._();

  factory _BDIResultModel.fromJson(Map<String, dynamic> json) =
      _$BDIResultModelImpl.fromJson;

  @override
  int get bdiResult;

  /// Create a copy of BDIResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BDIResultModelImplCopyWith<_$BDIResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
