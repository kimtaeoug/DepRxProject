// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizDataEntity _$QuizDataEntityFromJson(Map<String, dynamic> json) {
  return _QuizDataEntity.fromJson(json);
}

/// @nodoc
mixin _$QuizDataEntity {
  int get idx => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get select => throw _privateConstructorUsedError;
  int get answer => throw _privateConstructorUsedError;
  List<QuizCommentItemEntity> get commentary =>
      throw _privateConstructorUsedError;

  /// Serializes this QuizDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizDataEntityCopyWith<QuizDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDataEntityCopyWith<$Res> {
  factory $QuizDataEntityCopyWith(
          QuizDataEntity value, $Res Function(QuizDataEntity) then) =
      _$QuizDataEntityCopyWithImpl<$Res, QuizDataEntity>;
  @useResult
  $Res call(
      {int idx,
      String title,
      List<String> select,
      int answer,
      List<QuizCommentItemEntity> commentary});
}

/// @nodoc
class _$QuizDataEntityCopyWithImpl<$Res, $Val extends QuizDataEntity>
    implements $QuizDataEntityCopyWith<$Res> {
  _$QuizDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? title = null,
    Object? select = null,
    Object? answer = null,
    Object? commentary = null,
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
      select: null == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      commentary: null == commentary
          ? _value.commentary
          : commentary // ignore: cast_nullable_to_non_nullable
              as List<QuizCommentItemEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizDataEntityImplCopyWith<$Res>
    implements $QuizDataEntityCopyWith<$Res> {
  factory _$$QuizDataEntityImplCopyWith(_$QuizDataEntityImpl value,
          $Res Function(_$QuizDataEntityImpl) then) =
      __$$QuizDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int idx,
      String title,
      List<String> select,
      int answer,
      List<QuizCommentItemEntity> commentary});
}

/// @nodoc
class __$$QuizDataEntityImplCopyWithImpl<$Res>
    extends _$QuizDataEntityCopyWithImpl<$Res, _$QuizDataEntityImpl>
    implements _$$QuizDataEntityImplCopyWith<$Res> {
  __$$QuizDataEntityImplCopyWithImpl(
      _$QuizDataEntityImpl _value, $Res Function(_$QuizDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? title = null,
    Object? select = null,
    Object? answer = null,
    Object? commentary = null,
  }) {
    return _then(_$QuizDataEntityImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      select: null == select
          ? _value._select
          : select // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      commentary: null == commentary
          ? _value._commentary
          : commentary // ignore: cast_nullable_to_non_nullable
              as List<QuizCommentItemEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizDataEntityImpl extends _QuizDataEntity {
  const _$QuizDataEntityImpl(
      {this.idx = 0,
      this.title = '',
      final List<String> select = const [],
      this.answer = 0,
      final List<QuizCommentItemEntity> commentary = const []})
      : _select = select,
        _commentary = commentary,
        super._();

  factory _$QuizDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizDataEntityImplFromJson(json);

  @override
  @JsonKey()
  final int idx;
  @override
  @JsonKey()
  final String title;
  final List<String> _select;
  @override
  @JsonKey()
  List<String> get select {
    if (_select is EqualUnmodifiableListView) return _select;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_select);
  }

  @override
  @JsonKey()
  final int answer;
  final List<QuizCommentItemEntity> _commentary;
  @override
  @JsonKey()
  List<QuizCommentItemEntity> get commentary {
    if (_commentary is EqualUnmodifiableListView) return _commentary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentary);
  }

  @override
  String toString() {
    return 'QuizDataEntity(idx: $idx, title: $title, select: $select, answer: $answer, commentary: $commentary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizDataEntityImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._select, _select) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._commentary, _commentary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idx,
      title,
      const DeepCollectionEquality().hash(_select),
      answer,
      const DeepCollectionEquality().hash(_commentary));

  /// Create a copy of QuizDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizDataEntityImplCopyWith<_$QuizDataEntityImpl> get copyWith =>
      __$$QuizDataEntityImplCopyWithImpl<_$QuizDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizDataEntityImplToJson(
      this,
    );
  }
}

abstract class _QuizDataEntity extends QuizDataEntity {
  const factory _QuizDataEntity(
      {final int idx,
      final String title,
      final List<String> select,
      final int answer,
      final List<QuizCommentItemEntity> commentary}) = _$QuizDataEntityImpl;
  const _QuizDataEntity._() : super._();

  factory _QuizDataEntity.fromJson(Map<String, dynamic> json) =
      _$QuizDataEntityImpl.fromJson;

  @override
  int get idx;
  @override
  String get title;
  @override
  List<String> get select;
  @override
  int get answer;
  @override
  List<QuizCommentItemEntity> get commentary;

  /// Create a copy of QuizDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizDataEntityImplCopyWith<_$QuizDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
