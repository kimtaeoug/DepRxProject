// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_ba_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectedBAEntity _$SelectedBAEntityFromJson(Map<String, dynamic> json) {
  return _SelectedBAEntity.fromJson(json);
}

/// @nodoc
mixin _$SelectedBAEntity {
  List<SelectedBAItemEntity> get baList => throw _privateConstructorUsedError;

  /// Serializes this SelectedBAEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectedBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedBAEntityCopyWith<SelectedBAEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedBAEntityCopyWith<$Res> {
  factory $SelectedBAEntityCopyWith(
          SelectedBAEntity value, $Res Function(SelectedBAEntity) then) =
      _$SelectedBAEntityCopyWithImpl<$Res, SelectedBAEntity>;
  @useResult
  $Res call({List<SelectedBAItemEntity> baList});
}

/// @nodoc
class _$SelectedBAEntityCopyWithImpl<$Res, $Val extends SelectedBAEntity>
    implements $SelectedBAEntityCopyWith<$Res> {
  _$SelectedBAEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baList = null,
  }) {
    return _then(_value.copyWith(
      baList: null == baList
          ? _value.baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<SelectedBAItemEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedBAEntityImplCopyWith<$Res>
    implements $SelectedBAEntityCopyWith<$Res> {
  factory _$$SelectedBAEntityImplCopyWith(_$SelectedBAEntityImpl value,
          $Res Function(_$SelectedBAEntityImpl) then) =
      __$$SelectedBAEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SelectedBAItemEntity> baList});
}

/// @nodoc
class __$$SelectedBAEntityImplCopyWithImpl<$Res>
    extends _$SelectedBAEntityCopyWithImpl<$Res, _$SelectedBAEntityImpl>
    implements _$$SelectedBAEntityImplCopyWith<$Res> {
  __$$SelectedBAEntityImplCopyWithImpl(_$SelectedBAEntityImpl _value,
      $Res Function(_$SelectedBAEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectedBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baList = null,
  }) {
    return _then(_$SelectedBAEntityImpl(
      baList: null == baList
          ? _value._baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<SelectedBAItemEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedBAEntityImpl extends _SelectedBAEntity {
  const _$SelectedBAEntityImpl(
      {final List<SelectedBAItemEntity> baList = const []})
      : _baList = baList,
        super._();

  factory _$SelectedBAEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedBAEntityImplFromJson(json);

  final List<SelectedBAItemEntity> _baList;
  @override
  @JsonKey()
  List<SelectedBAItemEntity> get baList {
    if (_baList is EqualUnmodifiableListView) return _baList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_baList);
  }

  @override
  String toString() {
    return 'SelectedBAEntity(baList: $baList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedBAEntityImpl &&
            const DeepCollectionEquality().equals(other._baList, _baList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_baList));

  /// Create a copy of SelectedBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedBAEntityImplCopyWith<_$SelectedBAEntityImpl> get copyWith =>
      __$$SelectedBAEntityImplCopyWithImpl<_$SelectedBAEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedBAEntityImplToJson(
      this,
    );
  }
}

abstract class _SelectedBAEntity extends SelectedBAEntity {
  const factory _SelectedBAEntity({final List<SelectedBAItemEntity> baList}) =
      _$SelectedBAEntityImpl;
  const _SelectedBAEntity._() : super._();

  factory _SelectedBAEntity.fromJson(Map<String, dynamic> json) =
      _$SelectedBAEntityImpl.fromJson;

  @override
  List<SelectedBAItemEntity> get baList;

  /// Create a copy of SelectedBAEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedBAEntityImplCopyWith<_$SelectedBAEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
