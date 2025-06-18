// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mypage_marketing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageMarketingModel _$MyPageMarketingModelFromJson(Map<String, dynamic> json) {
  return _MyPageMarketingModel.fromJson(json);
}

/// @nodoc
mixin _$MyPageMarketingModel {
  bool get marketing => throw _privateConstructorUsedError;

  /// Serializes this MyPageMarketingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyPageMarketingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyPageMarketingModelCopyWith<MyPageMarketingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageMarketingModelCopyWith<$Res> {
  factory $MyPageMarketingModelCopyWith(MyPageMarketingModel value,
          $Res Function(MyPageMarketingModel) then) =
      _$MyPageMarketingModelCopyWithImpl<$Res, MyPageMarketingModel>;
  @useResult
  $Res call({bool marketing});
}

/// @nodoc
class _$MyPageMarketingModelCopyWithImpl<$Res,
        $Val extends MyPageMarketingModel>
    implements $MyPageMarketingModelCopyWith<$Res> {
  _$MyPageMarketingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyPageMarketingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketing = null,
  }) {
    return _then(_value.copyWith(
      marketing: null == marketing
          ? _value.marketing
          : marketing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageMarketingModelImplCopyWith<$Res>
    implements $MyPageMarketingModelCopyWith<$Res> {
  factory _$$MyPageMarketingModelImplCopyWith(_$MyPageMarketingModelImpl value,
          $Res Function(_$MyPageMarketingModelImpl) then) =
      __$$MyPageMarketingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool marketing});
}

/// @nodoc
class __$$MyPageMarketingModelImplCopyWithImpl<$Res>
    extends _$MyPageMarketingModelCopyWithImpl<$Res, _$MyPageMarketingModelImpl>
    implements _$$MyPageMarketingModelImplCopyWith<$Res> {
  __$$MyPageMarketingModelImplCopyWithImpl(_$MyPageMarketingModelImpl _value,
      $Res Function(_$MyPageMarketingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyPageMarketingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketing = null,
  }) {
    return _then(_$MyPageMarketingModelImpl(
      marketing: null == marketing
          ? _value.marketing
          : marketing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageMarketingModelImpl extends _MyPageMarketingModel {
  const _$MyPageMarketingModelImpl({this.marketing = false}) : super._();

  factory _$MyPageMarketingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageMarketingModelImplFromJson(json);

  @override
  @JsonKey()
  final bool marketing;

  @override
  String toString() {
    return 'MyPageMarketingModel(marketing: $marketing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageMarketingModelImpl &&
            (identical(other.marketing, marketing) ||
                other.marketing == marketing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, marketing);

  /// Create a copy of MyPageMarketingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageMarketingModelImplCopyWith<_$MyPageMarketingModelImpl>
      get copyWith =>
          __$$MyPageMarketingModelImplCopyWithImpl<_$MyPageMarketingModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageMarketingModelImplToJson(
      this,
    );
  }
}

abstract class _MyPageMarketingModel extends MyPageMarketingModel {
  const factory _MyPageMarketingModel({final bool marketing}) =
      _$MyPageMarketingModelImpl;
  const _MyPageMarketingModel._() : super._();

  factory _MyPageMarketingModel.fromJson(Map<String, dynamic> json) =
      _$MyPageMarketingModelImpl.fromJson;

  @override
  bool get marketing;

  /// Create a copy of MyPageMarketingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyPageMarketingModelImplCopyWith<_$MyPageMarketingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
