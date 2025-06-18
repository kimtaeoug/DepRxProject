// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'additional_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdditionalDataEntity _$AdditionalDataEntityFromJson(Map<String, dynamic> json) {
  return _AdditionalDataEntity.fromJson(json);
}

/// @nodoc
mixin _$AdditionalDataEntity {
  List<TOVListEntity> get tovList => throw _privateConstructorUsedError;
  AlphaDataEntity get alphaData => throw _privateConstructorUsedError;

  /// Serializes this AdditionalDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdditionalDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdditionalDataEntityCopyWith<AdditionalDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalDataEntityCopyWith<$Res> {
  factory $AdditionalDataEntityCopyWith(AdditionalDataEntity value,
          $Res Function(AdditionalDataEntity) then) =
      _$AdditionalDataEntityCopyWithImpl<$Res, AdditionalDataEntity>;
  @useResult
  $Res call({List<TOVListEntity> tovList, AlphaDataEntity alphaData});

  $AlphaDataEntityCopyWith<$Res> get alphaData;
}

/// @nodoc
class _$AdditionalDataEntityCopyWithImpl<$Res,
        $Val extends AdditionalDataEntity>
    implements $AdditionalDataEntityCopyWith<$Res> {
  _$AdditionalDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdditionalDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tovList = null,
    Object? alphaData = null,
  }) {
    return _then(_value.copyWith(
      tovList: null == tovList
          ? _value.tovList
          : tovList // ignore: cast_nullable_to_non_nullable
              as List<TOVListEntity>,
      alphaData: null == alphaData
          ? _value.alphaData
          : alphaData // ignore: cast_nullable_to_non_nullable
              as AlphaDataEntity,
    ) as $Val);
  }

  /// Create a copy of AdditionalDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlphaDataEntityCopyWith<$Res> get alphaData {
    return $AlphaDataEntityCopyWith<$Res>(_value.alphaData, (value) {
      return _then(_value.copyWith(alphaData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdditionalDataEntityImplCopyWith<$Res>
    implements $AdditionalDataEntityCopyWith<$Res> {
  factory _$$AdditionalDataEntityImplCopyWith(_$AdditionalDataEntityImpl value,
          $Res Function(_$AdditionalDataEntityImpl) then) =
      __$$AdditionalDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TOVListEntity> tovList, AlphaDataEntity alphaData});

  @override
  $AlphaDataEntityCopyWith<$Res> get alphaData;
}

/// @nodoc
class __$$AdditionalDataEntityImplCopyWithImpl<$Res>
    extends _$AdditionalDataEntityCopyWithImpl<$Res, _$AdditionalDataEntityImpl>
    implements _$$AdditionalDataEntityImplCopyWith<$Res> {
  __$$AdditionalDataEntityImplCopyWithImpl(_$AdditionalDataEntityImpl _value,
      $Res Function(_$AdditionalDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdditionalDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tovList = null,
    Object? alphaData = null,
  }) {
    return _then(_$AdditionalDataEntityImpl(
      tovList: null == tovList
          ? _value._tovList
          : tovList // ignore: cast_nullable_to_non_nullable
              as List<TOVListEntity>,
      alphaData: null == alphaData
          ? _value.alphaData
          : alphaData // ignore: cast_nullable_to_non_nullable
              as AlphaDataEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdditionalDataEntityImpl extends _AdditionalDataEntity {
  const _$AdditionalDataEntityImpl(
      {final List<TOVListEntity> tovList = const [],
      this.alphaData = const AlphaDataEntity()})
      : _tovList = tovList,
        super._();

  factory _$AdditionalDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionalDataEntityImplFromJson(json);

  final List<TOVListEntity> _tovList;
  @override
  @JsonKey()
  List<TOVListEntity> get tovList {
    if (_tovList is EqualUnmodifiableListView) return _tovList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tovList);
  }

  @override
  @JsonKey()
  final AlphaDataEntity alphaData;

  @override
  String toString() {
    return 'AdditionalDataEntity(tovList: $tovList, alphaData: $alphaData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalDataEntityImpl &&
            const DeepCollectionEquality().equals(other._tovList, _tovList) &&
            (identical(other.alphaData, alphaData) ||
                other.alphaData == alphaData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tovList), alphaData);

  /// Create a copy of AdditionalDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionalDataEntityImplCopyWith<_$AdditionalDataEntityImpl>
      get copyWith =>
          __$$AdditionalDataEntityImplCopyWithImpl<_$AdditionalDataEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdditionalDataEntityImplToJson(
      this,
    );
  }
}

abstract class _AdditionalDataEntity extends AdditionalDataEntity {
  const factory _AdditionalDataEntity(
      {final List<TOVListEntity> tovList,
      final AlphaDataEntity alphaData}) = _$AdditionalDataEntityImpl;
  const _AdditionalDataEntity._() : super._();

  factory _AdditionalDataEntity.fromJson(Map<String, dynamic> json) =
      _$AdditionalDataEntityImpl.fromJson;

  @override
  List<TOVListEntity> get tovList;
  @override
  AlphaDataEntity get alphaData;

  /// Create a copy of AdditionalDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdditionalDataEntityImplCopyWith<_$AdditionalDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
