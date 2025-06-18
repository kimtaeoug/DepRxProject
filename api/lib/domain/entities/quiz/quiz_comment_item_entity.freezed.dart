// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_comment_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizCommentItemEntity _$QuizCommentItemEntityFromJson(
    Map<String, dynamic> json) {
  return _QuizCommentItemEntity.fromJson(json);
}

/// @nodoc
mixin _$QuizCommentItemEntity {
  int get number => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  /// Serializes this QuizCommentItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizCommentItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizCommentItemEntityCopyWith<QuizCommentItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCommentItemEntityCopyWith<$Res> {
  factory $QuizCommentItemEntityCopyWith(QuizCommentItemEntity value,
          $Res Function(QuizCommentItemEntity) then) =
      _$QuizCommentItemEntityCopyWithImpl<$Res, QuizCommentItemEntity>;
  @useResult
  $Res call({int number, String comment});
}

/// @nodoc
class _$QuizCommentItemEntityCopyWithImpl<$Res,
        $Val extends QuizCommentItemEntity>
    implements $QuizCommentItemEntityCopyWith<$Res> {
  _$QuizCommentItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizCommentItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizCommentItemEntityImplCopyWith<$Res>
    implements $QuizCommentItemEntityCopyWith<$Res> {
  factory _$$QuizCommentItemEntityImplCopyWith(
          _$QuizCommentItemEntityImpl value,
          $Res Function(_$QuizCommentItemEntityImpl) then) =
      __$$QuizCommentItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, String comment});
}

/// @nodoc
class __$$QuizCommentItemEntityImplCopyWithImpl<$Res>
    extends _$QuizCommentItemEntityCopyWithImpl<$Res,
        _$QuizCommentItemEntityImpl>
    implements _$$QuizCommentItemEntityImplCopyWith<$Res> {
  __$$QuizCommentItemEntityImplCopyWithImpl(_$QuizCommentItemEntityImpl _value,
      $Res Function(_$QuizCommentItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizCommentItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? comment = null,
  }) {
    return _then(_$QuizCommentItemEntityImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizCommentItemEntityImpl extends _QuizCommentItemEntity {
  const _$QuizCommentItemEntityImpl({this.number = 0, this.comment = ''})
      : super._();

  factory _$QuizCommentItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizCommentItemEntityImplFromJson(json);

  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey()
  final String comment;

  @override
  String toString() {
    return 'QuizCommentItemEntity(number: $number, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizCommentItemEntityImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, comment);

  /// Create a copy of QuizCommentItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizCommentItemEntityImplCopyWith<_$QuizCommentItemEntityImpl>
      get copyWith => __$$QuizCommentItemEntityImplCopyWithImpl<
          _$QuizCommentItemEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizCommentItemEntityImplToJson(
      this,
    );
  }
}

abstract class _QuizCommentItemEntity extends QuizCommentItemEntity {
  const factory _QuizCommentItemEntity(
      {final int number, final String comment}) = _$QuizCommentItemEntityImpl;
  const _QuizCommentItemEntity._() : super._();

  factory _QuizCommentItemEntity.fromJson(Map<String, dynamic> json) =
      _$QuizCommentItemEntityImpl.fromJson;

  @override
  int get number;
  @override
  String get comment;

  /// Create a copy of QuizCommentItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizCommentItemEntityImplCopyWith<_$QuizCommentItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
