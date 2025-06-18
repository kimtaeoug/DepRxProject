// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recognize_me_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecognizeMeItemEntity _$RecognizeMeItemEntityFromJson(
    Map<String, dynamic> json) {
  return _RecognizeMeItemEntity.fromJson(json);
}

/// @nodoc
mixin _$RecognizeMeItemEntity {
  int get idx => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;

  /// Serializes this RecognizeMeItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecognizeMeItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecognizeMeItemEntityCopyWith<RecognizeMeItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecognizeMeItemEntityCopyWith<$Res> {
  factory $RecognizeMeItemEntityCopyWith(RecognizeMeItemEntity value,
          $Res Function(RecognizeMeItemEntity) then) =
      _$RecognizeMeItemEntityCopyWithImpl<$Res, RecognizeMeItemEntity>;
  @useResult
  $Res call({int idx, String title, String hint});
}

/// @nodoc
class _$RecognizeMeItemEntityCopyWithImpl<$Res,
        $Val extends RecognizeMeItemEntity>
    implements $RecognizeMeItemEntityCopyWith<$Res> {
  _$RecognizeMeItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecognizeMeItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? title = null,
    Object? hint = null,
  }) {
    return _then(_value.copyWith(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecognizeMeItemEntityImplCopyWith<$Res>
    implements $RecognizeMeItemEntityCopyWith<$Res> {
  factory _$$RecognizeMeItemEntityImplCopyWith(
          _$RecognizeMeItemEntityImpl value,
          $Res Function(_$RecognizeMeItemEntityImpl) then) =
      __$$RecognizeMeItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int idx, String title, String hint});
}

/// @nodoc
class __$$RecognizeMeItemEntityImplCopyWithImpl<$Res>
    extends _$RecognizeMeItemEntityCopyWithImpl<$Res,
        _$RecognizeMeItemEntityImpl>
    implements _$$RecognizeMeItemEntityImplCopyWith<$Res> {
  __$$RecognizeMeItemEntityImplCopyWithImpl(_$RecognizeMeItemEntityImpl _value,
      $Res Function(_$RecognizeMeItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecognizeMeItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? title = null,
    Object? hint = null,
  }) {
    return _then(_$RecognizeMeItemEntityImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecognizeMeItemEntityImpl extends _RecognizeMeItemEntity {
  const _$RecognizeMeItemEntityImpl(
      {this.idx = 0, this.title = '', this.hint = ''})
      : super._();

  factory _$RecognizeMeItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecognizeMeItemEntityImplFromJson(json);

  @override
  @JsonKey()
  final int idx;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String hint;

  @override
  String toString() {
    return 'RecognizeMeItemEntity(idx: $idx, title: $title, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecognizeMeItemEntityImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idx, title, hint);

  /// Create a copy of RecognizeMeItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecognizeMeItemEntityImplCopyWith<_$RecognizeMeItemEntityImpl>
      get copyWith => __$$RecognizeMeItemEntityImplCopyWithImpl<
          _$RecognizeMeItemEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecognizeMeItemEntityImplToJson(
      this,
    );
  }
}

abstract class _RecognizeMeItemEntity extends RecognizeMeItemEntity {
  const factory _RecognizeMeItemEntity(
      {final int idx,
      final String title,
      final String hint}) = _$RecognizeMeItemEntityImpl;
  const _RecognizeMeItemEntity._() : super._();

  factory _RecognizeMeItemEntity.fromJson(Map<String, dynamic> json) =
      _$RecognizeMeItemEntityImpl.fromJson;

  @override
  int get idx;
  @override
  String get title;
  @override
  String get hint;

  /// Create a copy of RecognizeMeItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecognizeMeItemEntityImplCopyWith<_$RecognizeMeItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
