// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sdui_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SDUIItemModel _$SDUIItemModelFromJson(Map<String, dynamic> json) {
  return _SDUIItemModel.fromJson(json);
}

/// @nodoc
mixin _$SDUIItemModel {
  int get number => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  List<SDUIItemDetailModel> get data => throw _privateConstructorUsedError;

  /// Serializes this SDUIItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SDUIItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SDUIItemModelCopyWith<SDUIItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SDUIItemModelCopyWith<$Res> {
  factory $SDUIItemModelCopyWith(
          SDUIItemModel value, $Res Function(SDUIItemModel) then) =
      _$SDUIItemModelCopyWithImpl<$Res, SDUIItemModel>;
  @useResult
  $Res call({int number, String keyword, List<SDUIItemDetailModel> data});
}

/// @nodoc
class _$SDUIItemModelCopyWithImpl<$Res, $Val extends SDUIItemModel>
    implements $SDUIItemModelCopyWith<$Res> {
  _$SDUIItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SDUIItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? keyword = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SDUIItemDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SDUIItemModelImplCopyWith<$Res>
    implements $SDUIItemModelCopyWith<$Res> {
  factory _$$SDUIItemModelImplCopyWith(
          _$SDUIItemModelImpl value, $Res Function(_$SDUIItemModelImpl) then) =
      __$$SDUIItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, String keyword, List<SDUIItemDetailModel> data});
}

/// @nodoc
class __$$SDUIItemModelImplCopyWithImpl<$Res>
    extends _$SDUIItemModelCopyWithImpl<$Res, _$SDUIItemModelImpl>
    implements _$$SDUIItemModelImplCopyWith<$Res> {
  __$$SDUIItemModelImplCopyWithImpl(
      _$SDUIItemModelImpl _value, $Res Function(_$SDUIItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SDUIItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? keyword = null,
    Object? data = null,
  }) {
    return _then(_$SDUIItemModelImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SDUIItemDetailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SDUIItemModelImpl extends _SDUIItemModel {
  const _$SDUIItemModelImpl(
      {this.number = 0,
      this.keyword = '',
      final List<SDUIItemDetailModel> data = const []})
      : _data = data,
        super._();

  factory _$SDUIItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SDUIItemModelImplFromJson(json);

  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey()
  final String keyword;
  final List<SDUIItemDetailModel> _data;
  @override
  @JsonKey()
  List<SDUIItemDetailModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SDUIItemModel(number: $number, keyword: $keyword, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SDUIItemModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, number, keyword, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SDUIItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SDUIItemModelImplCopyWith<_$SDUIItemModelImpl> get copyWith =>
      __$$SDUIItemModelImplCopyWithImpl<_$SDUIItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SDUIItemModelImplToJson(
      this,
    );
  }
}

abstract class _SDUIItemModel extends SDUIItemModel {
  const factory _SDUIItemModel(
      {final int number,
      final String keyword,
      final List<SDUIItemDetailModel> data}) = _$SDUIItemModelImpl;
  const _SDUIItemModel._() : super._();

  factory _SDUIItemModel.fromJson(Map<String, dynamic> json) =
      _$SDUIItemModelImpl.fromJson;

  @override
  int get number;
  @override
  String get keyword;
  @override
  List<SDUIItemDetailModel> get data;

  /// Create a copy of SDUIItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SDUIItemModelImplCopyWith<_$SDUIItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
