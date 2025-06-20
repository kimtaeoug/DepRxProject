// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnBoardingItemModel _$OnBoardingItemModelFromJson(Map<String, dynamic> json) {
  return _OnBoardingItemModel.fromJson(json);
}

/// @nodoc
mixin _$OnBoardingItemModel {
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get imgPath => throw _privateConstructorUsedError;

  /// Serializes this OnBoardingItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnBoardingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnBoardingItemModelCopyWith<OnBoardingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingItemModelCopyWith<$Res> {
  factory $OnBoardingItemModelCopyWith(
          OnBoardingItemModel value, $Res Function(OnBoardingItemModel) then) =
      _$OnBoardingItemModelCopyWithImpl<$Res, OnBoardingItemModel>;
  @useResult
  $Res call({String title, String contents, String imgPath});
}

/// @nodoc
class _$OnBoardingItemModelCopyWithImpl<$Res, $Val extends OnBoardingItemModel>
    implements $OnBoardingItemModelCopyWith<$Res> {
  _$OnBoardingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnBoardingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? contents = null,
    Object? imgPath = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnBoardingItemModelImplCopyWith<$Res>
    implements $OnBoardingItemModelCopyWith<$Res> {
  factory _$$OnBoardingItemModelImplCopyWith(_$OnBoardingItemModelImpl value,
          $Res Function(_$OnBoardingItemModelImpl) then) =
      __$$OnBoardingItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String contents, String imgPath});
}

/// @nodoc
class __$$OnBoardingItemModelImplCopyWithImpl<$Res>
    extends _$OnBoardingItemModelCopyWithImpl<$Res, _$OnBoardingItemModelImpl>
    implements _$$OnBoardingItemModelImplCopyWith<$Res> {
  __$$OnBoardingItemModelImplCopyWithImpl(_$OnBoardingItemModelImpl _value,
      $Res Function(_$OnBoardingItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnBoardingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? contents = null,
    Object? imgPath = null,
  }) {
    return _then(_$OnBoardingItemModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnBoardingItemModelImpl extends _OnBoardingItemModel {
  const _$OnBoardingItemModelImpl(
      {this.title = '', this.contents = '', this.imgPath = ''})
      : super._();

  factory _$OnBoardingItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnBoardingItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String contents;
  @override
  @JsonKey()
  final String imgPath;

  @override
  String toString() {
    return 'OnBoardingItemModel(title: $title, contents: $contents, imgPath: $imgPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnBoardingItemModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, contents, imgPath);

  /// Create a copy of OnBoardingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnBoardingItemModelImplCopyWith<_$OnBoardingItemModelImpl> get copyWith =>
      __$$OnBoardingItemModelImplCopyWithImpl<_$OnBoardingItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnBoardingItemModelImplToJson(
      this,
    );
  }
}

abstract class _OnBoardingItemModel extends OnBoardingItemModel {
  const factory _OnBoardingItemModel(
      {final String title,
      final String contents,
      final String imgPath}) = _$OnBoardingItemModelImpl;
  const _OnBoardingItemModel._() : super._();

  factory _OnBoardingItemModel.fromJson(Map<String, dynamic> json) =
      _$OnBoardingItemModelImpl.fromJson;

  @override
  String get title;
  @override
  String get contents;
  @override
  String get imgPath;

  /// Create a copy of OnBoardingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnBoardingItemModelImplCopyWith<_$OnBoardingItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
