// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tov_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TOVListEntity _$TOVListEntityFromJson(Map<String, dynamic> json) {
  return _TOVListEntity.fromJson(json);
}

/// @nodoc
mixin _$TOVListEntity {
  String get keyword => throw _privateConstructorUsedError;
  List<dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this TOVListEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TOVListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TOVListEntityCopyWith<TOVListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TOVListEntityCopyWith<$Res> {
  factory $TOVListEntityCopyWith(
          TOVListEntity value, $Res Function(TOVListEntity) then) =
      _$TOVListEntityCopyWithImpl<$Res, TOVListEntity>;
  @useResult
  $Res call({String keyword, List<dynamic> data});
}

/// @nodoc
class _$TOVListEntityCopyWithImpl<$Res, $Val extends TOVListEntity>
    implements $TOVListEntityCopyWith<$Res> {
  _$TOVListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TOVListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TOVListEntityImplCopyWith<$Res>
    implements $TOVListEntityCopyWith<$Res> {
  factory _$$TOVListEntityImplCopyWith(
          _$TOVListEntityImpl value, $Res Function(_$TOVListEntityImpl) then) =
      __$$TOVListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String keyword, List<dynamic> data});
}

/// @nodoc
class __$$TOVListEntityImplCopyWithImpl<$Res>
    extends _$TOVListEntityCopyWithImpl<$Res, _$TOVListEntityImpl>
    implements _$$TOVListEntityImplCopyWith<$Res> {
  __$$TOVListEntityImplCopyWithImpl(
      _$TOVListEntityImpl _value, $Res Function(_$TOVListEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TOVListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? data = null,
  }) {
    return _then(_$TOVListEntityImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TOVListEntityImpl extends _TOVListEntity {
  const _$TOVListEntityImpl(
      {this.keyword = '', final List<dynamic> data = const []})
      : _data = data,
        super._();

  factory _$TOVListEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TOVListEntityImplFromJson(json);

  @override
  @JsonKey()
  final String keyword;
  final List<dynamic> _data;
  @override
  @JsonKey()
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TOVListEntity(keyword: $keyword, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TOVListEntityImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, keyword, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TOVListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TOVListEntityImplCopyWith<_$TOVListEntityImpl> get copyWith =>
      __$$TOVListEntityImplCopyWithImpl<_$TOVListEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TOVListEntityImplToJson(
      this,
    );
  }
}

abstract class _TOVListEntity extends TOVListEntity {
  const factory _TOVListEntity(
      {final String keyword, final List<dynamic> data}) = _$TOVListEntityImpl;
  const _TOVListEntity._() : super._();

  factory _TOVListEntity.fromJson(Map<String, dynamic> json) =
      _$TOVListEntityImpl.fromJson;

  @override
  String get keyword;
  @override
  List<dynamic> get data;

  /// Create a copy of TOVListEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TOVListEntityImplCopyWith<_$TOVListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
