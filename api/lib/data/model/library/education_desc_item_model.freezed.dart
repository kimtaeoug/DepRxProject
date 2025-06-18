// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_desc_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EducationDescItemModel _$EducationDescItemModelFromJson(
    Map<String, dynamic> json) {
  return _EducationDescItemModel.fromJson(json);
}

/// @nodoc
mixin _$EducationDescItemModel {
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get contents => throw _privateConstructorUsedError;
  List<String> get strong => throw _privateConstructorUsedError;
  String get week => throw _privateConstructorUsedError;
  int get img => throw _privateConstructorUsedError;

  /// Serializes this EducationDescItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EducationDescItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EducationDescItemModelCopyWith<EducationDescItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationDescItemModelCopyWith<$Res> {
  factory $EducationDescItemModelCopyWith(EducationDescItemModel value,
          $Res Function(EducationDescItemModel) then) =
      _$EducationDescItemModelCopyWithImpl<$Res, EducationDescItemModel>;
  @useResult
  $Res call(
      {String type,
      String title,
      List<String> contents,
      List<String> strong,
      String week,
      int img});
}

/// @nodoc
class _$EducationDescItemModelCopyWithImpl<$Res,
        $Val extends EducationDescItemModel>
    implements $EducationDescItemModelCopyWith<$Res> {
  _$EducationDescItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EducationDescItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? contents = null,
    Object? strong = null,
    Object? week = null,
    Object? img = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      strong: null == strong
          ? _value.strong
          : strong // ignore: cast_nullable_to_non_nullable
              as List<String>,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationDescItemModelImplCopyWith<$Res>
    implements $EducationDescItemModelCopyWith<$Res> {
  factory _$$EducationDescItemModelImplCopyWith(
          _$EducationDescItemModelImpl value,
          $Res Function(_$EducationDescItemModelImpl) then) =
      __$$EducationDescItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String title,
      List<String> contents,
      List<String> strong,
      String week,
      int img});
}

/// @nodoc
class __$$EducationDescItemModelImplCopyWithImpl<$Res>
    extends _$EducationDescItemModelCopyWithImpl<$Res,
        _$EducationDescItemModelImpl>
    implements _$$EducationDescItemModelImplCopyWith<$Res> {
  __$$EducationDescItemModelImplCopyWithImpl(
      _$EducationDescItemModelImpl _value,
      $Res Function(_$EducationDescItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EducationDescItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? contents = null,
    Object? strong = null,
    Object? week = null,
    Object? img = null,
  }) {
    return _then(_$EducationDescItemModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      strong: null == strong
          ? _value._strong
          : strong // ignore: cast_nullable_to_non_nullable
              as List<String>,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationDescItemModelImpl extends _EducationDescItemModel {
  const _$EducationDescItemModelImpl(
      {this.type = '',
      this.title = '',
      final List<String> contents = const [],
      final List<String> strong = const [],
      this.week = '',
      this.img = 1})
      : _contents = contents,
        _strong = strong,
        super._();

  factory _$EducationDescItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationDescItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String title;
  final List<String> _contents;
  @override
  @JsonKey()
  List<String> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  final List<String> _strong;
  @override
  @JsonKey()
  List<String> get strong {
    if (_strong is EqualUnmodifiableListView) return _strong;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strong);
  }

  @override
  @JsonKey()
  final String week;
  @override
  @JsonKey()
  final int img;

  @override
  String toString() {
    return 'EducationDescItemModel(type: $type, title: $title, contents: $contents, strong: $strong, week: $week, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationDescItemModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            const DeepCollectionEquality().equals(other._strong, _strong) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.img, img) || other.img == img));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      title,
      const DeepCollectionEquality().hash(_contents),
      const DeepCollectionEquality().hash(_strong),
      week,
      img);

  /// Create a copy of EducationDescItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationDescItemModelImplCopyWith<_$EducationDescItemModelImpl>
      get copyWith => __$$EducationDescItemModelImplCopyWithImpl<
          _$EducationDescItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationDescItemModelImplToJson(
      this,
    );
  }
}

abstract class _EducationDescItemModel extends EducationDescItemModel {
  const factory _EducationDescItemModel(
      {final String type,
      final String title,
      final List<String> contents,
      final List<String> strong,
      final String week,
      final int img}) = _$EducationDescItemModelImpl;
  const _EducationDescItemModel._() : super._();

  factory _EducationDescItemModel.fromJson(Map<String, dynamic> json) =
      _$EducationDescItemModelImpl.fromJson;

  @override
  String get type;
  @override
  String get title;
  @override
  List<String> get contents;
  @override
  List<String> get strong;
  @override
  String get week;
  @override
  int get img;

  /// Create a copy of EducationDescItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EducationDescItemModelImplCopyWith<_$EducationDescItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
