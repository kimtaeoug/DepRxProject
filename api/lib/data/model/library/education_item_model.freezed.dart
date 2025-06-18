// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EducationItemModel _$EducationItemModelFromJson(Map<String, dynamic> json) {
  return _EducationItemModel.fromJson(json);
}

/// @nodoc
mixin _$EducationItemModel {
  int get week => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get videoPath => throw _privateConstructorUsedError;
  List<EducationDescItemModel> get description =>
      throw _privateConstructorUsedError;
  String get thumbNailPath => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  /// Serializes this EducationItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EducationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EducationItemModelCopyWith<EducationItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationItemModelCopyWith<$Res> {
  factory $EducationItemModelCopyWith(
          EducationItemModel value, $Res Function(EducationItemModel) then) =
      _$EducationItemModelCopyWithImpl<$Res, EducationItemModel>;
  @useResult
  $Res call(
      {int week,
      String title,
      String videoPath,
      List<EducationDescItemModel> description,
      String thumbNailPath,
      String time});
}

/// @nodoc
class _$EducationItemModelCopyWithImpl<$Res, $Val extends EducationItemModel>
    implements $EducationItemModelCopyWith<$Res> {
  _$EducationItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EducationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? title = null,
    Object? videoPath = null,
    Object? description = null,
    Object? thumbNailPath = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      videoPath: null == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as List<EducationDescItemModel>,
      thumbNailPath: null == thumbNailPath
          ? _value.thumbNailPath
          : thumbNailPath // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationItemModelImplCopyWith<$Res>
    implements $EducationItemModelCopyWith<$Res> {
  factory _$$EducationItemModelImplCopyWith(_$EducationItemModelImpl value,
          $Res Function(_$EducationItemModelImpl) then) =
      __$$EducationItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int week,
      String title,
      String videoPath,
      List<EducationDescItemModel> description,
      String thumbNailPath,
      String time});
}

/// @nodoc
class __$$EducationItemModelImplCopyWithImpl<$Res>
    extends _$EducationItemModelCopyWithImpl<$Res, _$EducationItemModelImpl>
    implements _$$EducationItemModelImplCopyWith<$Res> {
  __$$EducationItemModelImplCopyWithImpl(_$EducationItemModelImpl _value,
      $Res Function(_$EducationItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EducationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? title = null,
    Object? videoPath = null,
    Object? description = null,
    Object? thumbNailPath = null,
    Object? time = null,
  }) {
    return _then(_$EducationItemModelImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      videoPath: null == videoPath
          ? _value.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as List<EducationDescItemModel>,
      thumbNailPath: null == thumbNailPath
          ? _value.thumbNailPath
          : thumbNailPath // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationItemModelImpl extends _EducationItemModel {
  const _$EducationItemModelImpl(
      {this.week = 0,
      this.title = '',
      this.videoPath = '',
      final List<EducationDescItemModel> description = const [],
      this.thumbNailPath = '',
      this.time = ''})
      : _description = description,
        super._();

  factory _$EducationItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationItemModelImplFromJson(json);

  @override
  @JsonKey()
  final int week;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String videoPath;
  final List<EducationDescItemModel> _description;
  @override
  @JsonKey()
  List<EducationDescItemModel> get description {
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_description);
  }

  @override
  @JsonKey()
  final String thumbNailPath;
  @override
  @JsonKey()
  final String time;

  @override
  String toString() {
    return 'EducationItemModel(week: $week, title: $title, videoPath: $videoPath, description: $description, thumbNailPath: $thumbNailPath, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationItemModelImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.videoPath, videoPath) ||
                other.videoPath == videoPath) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            (identical(other.thumbNailPath, thumbNailPath) ||
                other.thumbNailPath == thumbNailPath) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, week, title, videoPath,
      const DeepCollectionEquality().hash(_description), thumbNailPath, time);

  /// Create a copy of EducationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationItemModelImplCopyWith<_$EducationItemModelImpl> get copyWith =>
      __$$EducationItemModelImplCopyWithImpl<_$EducationItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationItemModelImplToJson(
      this,
    );
  }
}

abstract class _EducationItemModel extends EducationItemModel {
  const factory _EducationItemModel(
      {final int week,
      final String title,
      final String videoPath,
      final List<EducationDescItemModel> description,
      final String thumbNailPath,
      final String time}) = _$EducationItemModelImpl;
  const _EducationItemModel._() : super._();

  factory _EducationItemModel.fromJson(Map<String, dynamic> json) =
      _$EducationItemModelImpl.fromJson;

  @override
  int get week;
  @override
  String get title;
  @override
  String get videoPath;
  @override
  List<EducationDescItemModel> get description;
  @override
  String get thumbNailPath;
  @override
  String get time;

  /// Create a copy of EducationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EducationItemModelImplCopyWith<_$EducationItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
