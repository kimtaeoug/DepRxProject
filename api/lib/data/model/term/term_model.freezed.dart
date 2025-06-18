// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'term_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TermModel _$TermModelFromJson(Map<String, dynamic> json) {
  return _TermModel.fromJson(json);
}

/// @nodoc
mixin _$TermModel {
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  /// Serializes this TermModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TermModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TermModelCopyWith<TermModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermModelCopyWith<$Res> {
  factory $TermModelCopyWith(TermModel value, $Res Function(TermModel) then) =
      _$TermModelCopyWithImpl<$Res, TermModel>;
  @useResult
  $Res call({String title, String contents});
}

/// @nodoc
class _$TermModelCopyWithImpl<$Res, $Val extends TermModel>
    implements $TermModelCopyWith<$Res> {
  _$TermModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TermModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? contents = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermModelImplCopyWith<$Res>
    implements $TermModelCopyWith<$Res> {
  factory _$$TermModelImplCopyWith(
          _$TermModelImpl value, $Res Function(_$TermModelImpl) then) =
      __$$TermModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String contents});
}

/// @nodoc
class __$$TermModelImplCopyWithImpl<$Res>
    extends _$TermModelCopyWithImpl<$Res, _$TermModelImpl>
    implements _$$TermModelImplCopyWith<$Res> {
  __$$TermModelImplCopyWithImpl(
      _$TermModelImpl _value, $Res Function(_$TermModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TermModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? contents = null,
  }) {
    return _then(_$TermModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
class _$TermModelImpl extends _TermModel {
  const _$TermModelImpl({this.title = '', this.contents = ''}) : super._();

  factory _$TermModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String contents;

  @override
  String toString() {
    return 'TermModel(title: $title, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, contents);

  /// Create a copy of TermModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermModelImplCopyWith<_$TermModelImpl> get copyWith =>
      __$$TermModelImplCopyWithImpl<_$TermModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermModelImplToJson(
      this,
    );
  }
}

abstract class _TermModel extends TermModel {
  const factory _TermModel({final String title, final String contents}) =
      _$TermModelImpl;
  const _TermModel._() : super._();

  factory _TermModel.fromJson(Map<String, dynamic> json) =
      _$TermModelImpl.fromJson;

  @override
  String get title;
  @override
  String get contents;

  /// Create a copy of TermModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermModelImplCopyWith<_$TermModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
