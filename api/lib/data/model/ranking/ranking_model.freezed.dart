// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RankingModel _$RankingModelFromJson(Map<String, dynamic> json) {
  return _RankingModel.fromJson(json);
}

/// @nodoc
mixin _$RankingModel {
  List<RankingItemModel> get rankingList => throw _privateConstructorUsedError;
  bool get isPreferred => throw _privateConstructorUsedError;
  bool get isWorse => throw _privateConstructorUsedError;

  /// Serializes this RankingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RankingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingModelCopyWith<RankingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingModelCopyWith<$Res> {
  factory $RankingModelCopyWith(
          RankingModel value, $Res Function(RankingModel) then) =
      _$RankingModelCopyWithImpl<$Res, RankingModel>;
  @useResult
  $Res call(
      {List<RankingItemModel> rankingList, bool isPreferred, bool isWorse});
}

/// @nodoc
class _$RankingModelCopyWithImpl<$Res, $Val extends RankingModel>
    implements $RankingModelCopyWith<$Res> {
  _$RankingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankingList = null,
    Object? isPreferred = null,
    Object? isWorse = null,
  }) {
    return _then(_value.copyWith(
      rankingList: null == rankingList
          ? _value.rankingList
          : rankingList // ignore: cast_nullable_to_non_nullable
              as List<RankingItemModel>,
      isPreferred: null == isPreferred
          ? _value.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
      isWorse: null == isWorse
          ? _value.isWorse
          : isWorse // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingModelImplCopyWith<$Res>
    implements $RankingModelCopyWith<$Res> {
  factory _$$RankingModelImplCopyWith(
          _$RankingModelImpl value, $Res Function(_$RankingModelImpl) then) =
      __$$RankingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RankingItemModel> rankingList, bool isPreferred, bool isWorse});
}

/// @nodoc
class __$$RankingModelImplCopyWithImpl<$Res>
    extends _$RankingModelCopyWithImpl<$Res, _$RankingModelImpl>
    implements _$$RankingModelImplCopyWith<$Res> {
  __$$RankingModelImplCopyWithImpl(
      _$RankingModelImpl _value, $Res Function(_$RankingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RankingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankingList = null,
    Object? isPreferred = null,
    Object? isWorse = null,
  }) {
    return _then(_$RankingModelImpl(
      rankingList: null == rankingList
          ? _value._rankingList
          : rankingList // ignore: cast_nullable_to_non_nullable
              as List<RankingItemModel>,
      isPreferred: null == isPreferred
          ? _value.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
      isWorse: null == isWorse
          ? _value.isWorse
          : isWorse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingModelImpl extends _RankingModel {
  const _$RankingModelImpl(
      {final List<RankingItemModel> rankingList = const [],
      this.isPreferred = false,
      this.isWorse = false})
      : _rankingList = rankingList,
        super._();

  factory _$RankingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingModelImplFromJson(json);

  final List<RankingItemModel> _rankingList;
  @override
  @JsonKey()
  List<RankingItemModel> get rankingList {
    if (_rankingList is EqualUnmodifiableListView) return _rankingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rankingList);
  }

  @override
  @JsonKey()
  final bool isPreferred;
  @override
  @JsonKey()
  final bool isWorse;

  @override
  String toString() {
    return 'RankingModel(rankingList: $rankingList, isPreferred: $isPreferred, isWorse: $isWorse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingModelImpl &&
            const DeepCollectionEquality()
                .equals(other._rankingList, _rankingList) &&
            (identical(other.isPreferred, isPreferred) ||
                other.isPreferred == isPreferred) &&
            (identical(other.isWorse, isWorse) || other.isWorse == isWorse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_rankingList), isPreferred, isWorse);

  /// Create a copy of RankingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingModelImplCopyWith<_$RankingModelImpl> get copyWith =>
      __$$RankingModelImplCopyWithImpl<_$RankingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingModelImplToJson(
      this,
    );
  }
}

abstract class _RankingModel extends RankingModel {
  const factory _RankingModel(
      {final List<RankingItemModel> rankingList,
      final bool isPreferred,
      final bool isWorse}) = _$RankingModelImpl;
  const _RankingModel._() : super._();

  factory _RankingModel.fromJson(Map<String, dynamic> json) =
      _$RankingModelImpl.fromJson;

  @override
  List<RankingItemModel> get rankingList;
  @override
  bool get isPreferred;
  @override
  bool get isWorse;

  /// Create a copy of RankingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingModelImplCopyWith<_$RankingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
