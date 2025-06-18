// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'naver_login_response_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NaverLoginResponseItemEntity _$NaverLoginResponseItemEntityFromJson(
    Map<String, dynamic> json) {
  return _NaverLoginResponseItemEntity.fromJson(json);
}

/// @nodoc
mixin _$NaverLoginResponseItemEntity {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this NaverLoginResponseItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NaverLoginResponseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NaverLoginResponseItemEntityCopyWith<NaverLoginResponseItemEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverLoginResponseItemEntityCopyWith<$Res> {
  factory $NaverLoginResponseItemEntityCopyWith(
          NaverLoginResponseItemEntity value,
          $Res Function(NaverLoginResponseItemEntity) then) =
      _$NaverLoginResponseItemEntityCopyWithImpl<$Res,
          NaverLoginResponseItemEntity>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$NaverLoginResponseItemEntityCopyWithImpl<$Res,
        $Val extends NaverLoginResponseItemEntity>
    implements $NaverLoginResponseItemEntityCopyWith<$Res> {
  _$NaverLoginResponseItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NaverLoginResponseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NaverLoginResponseItemEntityImplCopyWith<$Res>
    implements $NaverLoginResponseItemEntityCopyWith<$Res> {
  factory _$$NaverLoginResponseItemEntityImplCopyWith(
          _$NaverLoginResponseItemEntityImpl value,
          $Res Function(_$NaverLoginResponseItemEntityImpl) then) =
      __$$NaverLoginResponseItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$NaverLoginResponseItemEntityImplCopyWithImpl<$Res>
    extends _$NaverLoginResponseItemEntityCopyWithImpl<$Res,
        _$NaverLoginResponseItemEntityImpl>
    implements _$$NaverLoginResponseItemEntityImplCopyWith<$Res> {
  __$$NaverLoginResponseItemEntityImplCopyWithImpl(
      _$NaverLoginResponseItemEntityImpl _value,
      $Res Function(_$NaverLoginResponseItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of NaverLoginResponseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$NaverLoginResponseItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NaverLoginResponseItemEntityImpl extends _NaverLoginResponseItemEntity {
  const _$NaverLoginResponseItemEntityImpl({this.id = ''}) : super._();

  factory _$NaverLoginResponseItemEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NaverLoginResponseItemEntityImplFromJson(json);

  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'NaverLoginResponseItemEntity(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverLoginResponseItemEntityImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of NaverLoginResponseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverLoginResponseItemEntityImplCopyWith<
          _$NaverLoginResponseItemEntityImpl>
      get copyWith => __$$NaverLoginResponseItemEntityImplCopyWithImpl<
          _$NaverLoginResponseItemEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NaverLoginResponseItemEntityImplToJson(
      this,
    );
  }
}

abstract class _NaverLoginResponseItemEntity
    extends NaverLoginResponseItemEntity {
  const factory _NaverLoginResponseItemEntity({final String id}) =
      _$NaverLoginResponseItemEntityImpl;
  const _NaverLoginResponseItemEntity._() : super._();

  factory _NaverLoginResponseItemEntity.fromJson(Map<String, dynamic> json) =
      _$NaverLoginResponseItemEntityImpl.fromJson;

  @override
  String get id;

  /// Create a copy of NaverLoginResponseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NaverLoginResponseItemEntityImplCopyWith<
          _$NaverLoginResponseItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
