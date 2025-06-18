// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recognize_me_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecognizeMeDataEntity _$RecognizeMeDataEntityFromJson(
    Map<String, dynamic> json) {
  return _RecognizeMeDataEntity.fromJson(json);
}

/// @nodoc
mixin _$RecognizeMeDataEntity {
  String get title => throw _privateConstructorUsedError;
  List<RecognizeMeItemEntity> get data => throw _privateConstructorUsedError;

  /// Serializes this RecognizeMeDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecognizeMeDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecognizeMeDataEntityCopyWith<RecognizeMeDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecognizeMeDataEntityCopyWith<$Res> {
  factory $RecognizeMeDataEntityCopyWith(RecognizeMeDataEntity value,
          $Res Function(RecognizeMeDataEntity) then) =
      _$RecognizeMeDataEntityCopyWithImpl<$Res, RecognizeMeDataEntity>;
  @useResult
  $Res call({String title, List<RecognizeMeItemEntity> data});
}

/// @nodoc
class _$RecognizeMeDataEntityCopyWithImpl<$Res,
        $Val extends RecognizeMeDataEntity>
    implements $RecognizeMeDataEntityCopyWith<$Res> {
  _$RecognizeMeDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecognizeMeDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecognizeMeItemEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecognizeMeDataEntityImplCopyWith<$Res>
    implements $RecognizeMeDataEntityCopyWith<$Res> {
  factory _$$RecognizeMeDataEntityImplCopyWith(
          _$RecognizeMeDataEntityImpl value,
          $Res Function(_$RecognizeMeDataEntityImpl) then) =
      __$$RecognizeMeDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<RecognizeMeItemEntity> data});
}

/// @nodoc
class __$$RecognizeMeDataEntityImplCopyWithImpl<$Res>
    extends _$RecognizeMeDataEntityCopyWithImpl<$Res,
        _$RecognizeMeDataEntityImpl>
    implements _$$RecognizeMeDataEntityImplCopyWith<$Res> {
  __$$RecognizeMeDataEntityImplCopyWithImpl(_$RecognizeMeDataEntityImpl _value,
      $Res Function(_$RecognizeMeDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecognizeMeDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? data = null,
  }) {
    return _then(_$RecognizeMeDataEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecognizeMeItemEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecognizeMeDataEntityImpl extends _RecognizeMeDataEntity {
  const _$RecognizeMeDataEntityImpl(
      {this.title = '', final List<RecognizeMeItemEntity> data = const []})
      : _data = data,
        super._();

  factory _$RecognizeMeDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecognizeMeDataEntityImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  final List<RecognizeMeItemEntity> _data;
  @override
  @JsonKey()
  List<RecognizeMeItemEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RecognizeMeDataEntity(title: $title, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecognizeMeDataEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_data));

  /// Create a copy of RecognizeMeDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecognizeMeDataEntityImplCopyWith<_$RecognizeMeDataEntityImpl>
      get copyWith => __$$RecognizeMeDataEntityImplCopyWithImpl<
          _$RecognizeMeDataEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecognizeMeDataEntityImplToJson(
      this,
    );
  }
}

abstract class _RecognizeMeDataEntity extends RecognizeMeDataEntity {
  const factory _RecognizeMeDataEntity(
      {final String title,
      final List<RecognizeMeItemEntity> data}) = _$RecognizeMeDataEntityImpl;
  const _RecognizeMeDataEntity._() : super._();

  factory _RecognizeMeDataEntity.fromJson(Map<String, dynamic> json) =
      _$RecognizeMeDataEntityImpl.fromJson;

  @override
  String get title;
  @override
  List<RecognizeMeItemEntity> get data;

  /// Create a copy of RecognizeMeDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecognizeMeDataEntityImplCopyWith<_$RecognizeMeDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
