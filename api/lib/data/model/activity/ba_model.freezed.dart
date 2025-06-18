// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ba_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BAModel _$BAModelFromJson(Map<String, dynamic> json) {
  return _BAModel.fromJson(json);
}

/// @nodoc
mixin _$BAModel {
  String get date => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get activityId => throw _privateConstructorUsedError;

  /// Serializes this BAModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BAModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BAModelCopyWith<BAModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BAModelCopyWith<$Res> {
  factory $BAModelCopyWith(BAModel value, $Res Function(BAModel) then) =
      _$BAModelCopyWithImpl<$Res, BAModel>;
  @useResult
  $Res call(
      {String date,
      String imagePath,
      String contents,
      bool done,
      String category,
      String activityId});
}

/// @nodoc
class _$BAModelCopyWithImpl<$Res, $Val extends BAModel>
    implements $BAModelCopyWith<$Res> {
  _$BAModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BAModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? imagePath = null,
    Object? contents = null,
    Object? done = null,
    Object? category = null,
    Object? activityId = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BAModelImplCopyWith<$Res> implements $BAModelCopyWith<$Res> {
  factory _$$BAModelImplCopyWith(
          _$BAModelImpl value, $Res Function(_$BAModelImpl) then) =
      __$$BAModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      String imagePath,
      String contents,
      bool done,
      String category,
      String activityId});
}

/// @nodoc
class __$$BAModelImplCopyWithImpl<$Res>
    extends _$BAModelCopyWithImpl<$Res, _$BAModelImpl>
    implements _$$BAModelImplCopyWith<$Res> {
  __$$BAModelImplCopyWithImpl(
      _$BAModelImpl _value, $Res Function(_$BAModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BAModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? imagePath = null,
    Object? contents = null,
    Object? done = null,
    Object? category = null,
    Object? activityId = null,
  }) {
    return _then(_$BAModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BAModelImpl extends _BAModel {
  const _$BAModelImpl(
      {this.date = '',
      this.imagePath = '',
      this.contents = '',
      this.done = false,
      this.category = '',
      this.activityId = ''})
      : super._();

  factory _$BAModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BAModelImplFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String contents;
  @override
  @JsonKey()
  final bool done;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String activityId;

  @override
  String toString() {
    return 'BAModel(date: $date, imagePath: $imagePath, contents: $contents, done: $done, category: $category, activityId: $activityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BAModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, imagePath, contents, done, category, activityId);

  /// Create a copy of BAModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BAModelImplCopyWith<_$BAModelImpl> get copyWith =>
      __$$BAModelImplCopyWithImpl<_$BAModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BAModelImplToJson(
      this,
    );
  }
}

abstract class _BAModel extends BAModel {
  const factory _BAModel(
      {final String date,
      final String imagePath,
      final String contents,
      final bool done,
      final String category,
      final String activityId}) = _$BAModelImpl;
  const _BAModel._() : super._();

  factory _BAModel.fromJson(Map<String, dynamic> json) = _$BAModelImpl.fromJson;

  @override
  String get date;
  @override
  String get imagePath;
  @override
  String get contents;
  @override
  bool get done;
  @override
  String get category;
  @override
  String get activityId;

  /// Create a copy of BAModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BAModelImplCopyWith<_$BAModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
