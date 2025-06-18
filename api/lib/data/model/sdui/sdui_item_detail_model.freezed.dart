// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sdui_item_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SDUIItemDetailModel _$SDUIItemDetailModelFromJson(Map<String, dynamic> json) {
  return _SDUIItemDetailModel.fromJson(json);
}

/// @nodoc
mixin _$SDUIItemDetailModel {
  String get title => throw _privateConstructorUsedError;
  List<String> get selection => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get strongTitle => throw _privateConstructorUsedError;

  /// Serializes this SDUIItemDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SDUIItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SDUIItemDetailModelCopyWith<SDUIItemDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SDUIItemDetailModelCopyWith<$Res> {
  factory $SDUIItemDetailModelCopyWith(
          SDUIItemDetailModel value, $Res Function(SDUIItemDetailModel) then) =
      _$SDUIItemDetailModelCopyWithImpl<$Res, SDUIItemDetailModel>;
  @useResult
  $Res call(
      {String title, List<String> selection, String type, String strongTitle});
}

/// @nodoc
class _$SDUIItemDetailModelCopyWithImpl<$Res, $Val extends SDUIItemDetailModel>
    implements $SDUIItemDetailModelCopyWith<$Res> {
  _$SDUIItemDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SDUIItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? selection = null,
    Object? type = null,
    Object? strongTitle = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selection: null == selection
          ? _value.selection
          : selection // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      strongTitle: null == strongTitle
          ? _value.strongTitle
          : strongTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SDUIItemDetailModelImplCopyWith<$Res>
    implements $SDUIItemDetailModelCopyWith<$Res> {
  factory _$$SDUIItemDetailModelImplCopyWith(_$SDUIItemDetailModelImpl value,
          $Res Function(_$SDUIItemDetailModelImpl) then) =
      __$$SDUIItemDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, List<String> selection, String type, String strongTitle});
}

/// @nodoc
class __$$SDUIItemDetailModelImplCopyWithImpl<$Res>
    extends _$SDUIItemDetailModelCopyWithImpl<$Res, _$SDUIItemDetailModelImpl>
    implements _$$SDUIItemDetailModelImplCopyWith<$Res> {
  __$$SDUIItemDetailModelImplCopyWithImpl(_$SDUIItemDetailModelImpl _value,
      $Res Function(_$SDUIItemDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SDUIItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? selection = null,
    Object? type = null,
    Object? strongTitle = null,
  }) {
    return _then(_$SDUIItemDetailModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selection: null == selection
          ? _value._selection
          : selection // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      strongTitle: null == strongTitle
          ? _value.strongTitle
          : strongTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SDUIItemDetailModelImpl extends _SDUIItemDetailModel {
  const _$SDUIItemDetailModelImpl(
      {this.title = '',
      final List<String> selection = const [],
      this.type = '',
      this.strongTitle = ''})
      : _selection = selection,
        super._();

  factory _$SDUIItemDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SDUIItemDetailModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  final List<String> _selection;
  @override
  @JsonKey()
  List<String> get selection {
    if (_selection is EqualUnmodifiableListView) return _selection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selection);
  }

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String strongTitle;

  @override
  String toString() {
    return 'SDUIItemDetailModel(title: $title, selection: $selection, type: $type, strongTitle: $strongTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SDUIItemDetailModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._selection, _selection) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.strongTitle, strongTitle) ||
                other.strongTitle == strongTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_selection), type, strongTitle);

  /// Create a copy of SDUIItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SDUIItemDetailModelImplCopyWith<_$SDUIItemDetailModelImpl> get copyWith =>
      __$$SDUIItemDetailModelImplCopyWithImpl<_$SDUIItemDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SDUIItemDetailModelImplToJson(
      this,
    );
  }
}

abstract class _SDUIItemDetailModel extends SDUIItemDetailModel {
  const factory _SDUIItemDetailModel(
      {final String title,
      final List<String> selection,
      final String type,
      final String strongTitle}) = _$SDUIItemDetailModelImpl;
  const _SDUIItemDetailModel._() : super._();

  factory _SDUIItemDetailModel.fromJson(Map<String, dynamic> json) =
      _$SDUIItemDetailModelImpl.fromJson;

  @override
  String get title;
  @override
  List<String> get selection;
  @override
  String get type;
  @override
  String get strongTitle;

  /// Create a copy of SDUIItemDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SDUIItemDetailModelImplCopyWith<_$SDUIItemDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
