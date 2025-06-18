// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RankingItemModel _$RankingItemModelFromJson(Map<String, dynamic> json) {
  return _RankingItemModel.fromJson(json);
}

/// @nodoc
mixin _$RankingItemModel {
  String get contents => throw _privateConstructorUsedError;
  int get beforeValue => throw _privateConstructorUsedError;
  int get afterValue => throw _privateConstructorUsedError;

  /// Serializes this RankingItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RankingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingItemModelCopyWith<RankingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingItemModelCopyWith<$Res> {
  factory $RankingItemModelCopyWith(
          RankingItemModel value, $Res Function(RankingItemModel) then) =
      _$RankingItemModelCopyWithImpl<$Res, RankingItemModel>;
  @useResult
  $Res call({String contents, int beforeValue, int afterValue});
}

/// @nodoc
class _$RankingItemModelCopyWithImpl<$Res, $Val extends RankingItemModel>
    implements $RankingItemModelCopyWith<$Res> {
  _$RankingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? beforeValue = null,
    Object? afterValue = null,
  }) {
    return _then(_value.copyWith(
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      beforeValue: null == beforeValue
          ? _value.beforeValue
          : beforeValue // ignore: cast_nullable_to_non_nullable
              as int,
      afterValue: null == afterValue
          ? _value.afterValue
          : afterValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingItemModelImplCopyWith<$Res>
    implements $RankingItemModelCopyWith<$Res> {
  factory _$$RankingItemModelImplCopyWith(_$RankingItemModelImpl value,
          $Res Function(_$RankingItemModelImpl) then) =
      __$$RankingItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contents, int beforeValue, int afterValue});
}

/// @nodoc
class __$$RankingItemModelImplCopyWithImpl<$Res>
    extends _$RankingItemModelCopyWithImpl<$Res, _$RankingItemModelImpl>
    implements _$$RankingItemModelImplCopyWith<$Res> {
  __$$RankingItemModelImplCopyWithImpl(_$RankingItemModelImpl _value,
      $Res Function(_$RankingItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RankingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? beforeValue = null,
    Object? afterValue = null,
  }) {
    return _then(_$RankingItemModelImpl(
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      beforeValue: null == beforeValue
          ? _value.beforeValue
          : beforeValue // ignore: cast_nullable_to_non_nullable
              as int,
      afterValue: null == afterValue
          ? _value.afterValue
          : afterValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingItemModelImpl extends _RankingItemModel {
  const _$RankingItemModelImpl(
      {this.contents = '', this.beforeValue = 0, this.afterValue = 0})
      : super._();

  factory _$RankingItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String contents;
  @override
  @JsonKey()
  final int beforeValue;
  @override
  @JsonKey()
  final int afterValue;

  @override
  String toString() {
    return 'RankingItemModel(contents: $contents, beforeValue: $beforeValue, afterValue: $afterValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingItemModelImpl &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.beforeValue, beforeValue) ||
                other.beforeValue == beforeValue) &&
            (identical(other.afterValue, afterValue) ||
                other.afterValue == afterValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contents, beforeValue, afterValue);

  /// Create a copy of RankingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingItemModelImplCopyWith<_$RankingItemModelImpl> get copyWith =>
      __$$RankingItemModelImplCopyWithImpl<_$RankingItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingItemModelImplToJson(
      this,
    );
  }
}

abstract class _RankingItemModel extends RankingItemModel {
  const factory _RankingItemModel(
      {final String contents,
      final int beforeValue,
      final int afterValue}) = _$RankingItemModelImpl;
  const _RankingItemModel._() : super._();

  factory _RankingItemModel.fromJson(Map<String, dynamic> json) =
      _$RankingItemModelImpl.fromJson;

  @override
  String get contents;
  @override
  int get beforeValue;
  @override
  int get afterValue;

  /// Create a copy of RankingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingItemModelImplCopyWith<_$RankingItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
