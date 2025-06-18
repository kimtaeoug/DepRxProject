// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) {
  return _DiaryModel.fromJson(json);
}

/// @nodoc
mixin _$DiaryModel {
  String get date => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  /// Serializes this DiaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiaryModelCopyWith<DiaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryModelCopyWith<$Res> {
  factory $DiaryModelCopyWith(
          DiaryModel value, $Res Function(DiaryModel) then) =
      _$DiaryModelCopyWithImpl<$Res, DiaryModel>;
  @useResult
  $Res call({String date, String contents});
}

/// @nodoc
class _$DiaryModelCopyWithImpl<$Res, $Val extends DiaryModel>
    implements $DiaryModelCopyWith<$Res> {
  _$DiaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryModelImplCopyWith<$Res>
    implements $DiaryModelCopyWith<$Res> {
  factory _$$DiaryModelImplCopyWith(
          _$DiaryModelImpl value, $Res Function(_$DiaryModelImpl) then) =
      __$$DiaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String contents});
}

/// @nodoc
class __$$DiaryModelImplCopyWithImpl<$Res>
    extends _$DiaryModelCopyWithImpl<$Res, _$DiaryModelImpl>
    implements _$$DiaryModelImplCopyWith<$Res> {
  __$$DiaryModelImplCopyWithImpl(
      _$DiaryModelImpl _value, $Res Function(_$DiaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? contents = null,
  }) {
    return _then(_$DiaryModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiaryModelImpl extends _DiaryModel {
  const _$DiaryModelImpl({this.date = '', this.contents = ''}) : super._();

  factory _$DiaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiaryModelImplFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String contents;

  @override
  String toString() {
    return 'DiaryModel(date: $date, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, contents);

  /// Create a copy of DiaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryModelImplCopyWith<_$DiaryModelImpl> get copyWith =>
      __$$DiaryModelImplCopyWithImpl<_$DiaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiaryModelImplToJson(
      this,
    );
  }
}

abstract class _DiaryModel extends DiaryModel {
  const factory _DiaryModel({final String date, final String contents}) =
      _$DiaryModelImpl;
  const _DiaryModel._() : super._();

  factory _DiaryModel.fromJson(Map<String, dynamic> json) =
      _$DiaryModelImpl.fromJson;

  @override
  String get date;
  @override
  String get contents;

  /// Create a copy of DiaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiaryModelImplCopyWith<_$DiaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
