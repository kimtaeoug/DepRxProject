// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ba_do_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BADoModel _$BADoModelFromJson(Map<String, dynamic> json) {
  return _BADoModel.fromJson(json);
}

/// @nodoc
mixin _$BADoModel {
  String get activityId => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;

  /// Serializes this BADoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BADoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BADoModelCopyWith<BADoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BADoModelCopyWith<$Res> {
  factory $BADoModelCopyWith(BADoModel value, $Res Function(BADoModel) then) =
      _$BADoModelCopyWithImpl<$Res, BADoModel>;
  @useResult
  $Res call(
      {String activityId,
      String imagePath,
      String category,
      String title,
      String description,
      String subtitle});
}

/// @nodoc
class _$BADoModelCopyWithImpl<$Res, $Val extends BADoModel>
    implements $BADoModelCopyWith<$Res> {
  _$BADoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BADoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? imagePath = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? subtitle = null,
  }) {
    return _then(_value.copyWith(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BADoModelImplCopyWith<$Res>
    implements $BADoModelCopyWith<$Res> {
  factory _$$BADoModelImplCopyWith(
          _$BADoModelImpl value, $Res Function(_$BADoModelImpl) then) =
      __$$BADoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activityId,
      String imagePath,
      String category,
      String title,
      String description,
      String subtitle});
}

/// @nodoc
class __$$BADoModelImplCopyWithImpl<$Res>
    extends _$BADoModelCopyWithImpl<$Res, _$BADoModelImpl>
    implements _$$BADoModelImplCopyWith<$Res> {
  __$$BADoModelImplCopyWithImpl(
      _$BADoModelImpl _value, $Res Function(_$BADoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BADoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? imagePath = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? subtitle = null,
  }) {
    return _then(_$BADoModelImpl(
      activityId: null == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BADoModelImpl extends _BADoModel {
  const _$BADoModelImpl(
      {this.activityId = '',
      this.imagePath = '',
      this.category = '',
      this.title = '',
      this.description = '',
      this.subtitle = ''})
      : super._();

  factory _$BADoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BADoModelImplFromJson(json);

  @override
  @JsonKey()
  final String activityId;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String subtitle;

  @override
  String toString() {
    return 'BADoModel(activityId: $activityId, imagePath: $imagePath, category: $category, title: $title, description: $description, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BADoModelImpl &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, activityId, imagePath, category,
      title, description, subtitle);

  /// Create a copy of BADoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BADoModelImplCopyWith<_$BADoModelImpl> get copyWith =>
      __$$BADoModelImplCopyWithImpl<_$BADoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BADoModelImplToJson(
      this,
    );
  }
}

abstract class _BADoModel extends BADoModel {
  const factory _BADoModel(
      {final String activityId,
      final String imagePath,
      final String category,
      final String title,
      final String description,
      final String subtitle}) = _$BADoModelImpl;
  const _BADoModel._() : super._();

  factory _BADoModel.fromJson(Map<String, dynamic> json) =
      _$BADoModelImpl.fromJson;

  @override
  String get activityId;
  @override
  String get imagePath;
  @override
  String get category;
  @override
  String get title;
  @override
  String get description;
  @override
  String get subtitle;

  /// Create a copy of BADoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BADoModelImplCopyWith<_$BADoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
