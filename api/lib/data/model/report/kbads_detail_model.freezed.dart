// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kbads_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KBADSDetailModel _$KBADSDetailModelFromJson(Map<String, dynamic> json) {
  return _KBADSDetailModel.fromJson(json);
}

/// @nodoc
mixin _$KBADSDetailModel {
  List<int?> get score => throw _privateConstructorUsedError;

  /// Serializes this KBADSDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KBADSDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KBADSDetailModelCopyWith<KBADSDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KBADSDetailModelCopyWith<$Res> {
  factory $KBADSDetailModelCopyWith(
          KBADSDetailModel value, $Res Function(KBADSDetailModel) then) =
      _$KBADSDetailModelCopyWithImpl<$Res, KBADSDetailModel>;
  @useResult
  $Res call({List<int?> score});
}

/// @nodoc
class _$KBADSDetailModelCopyWithImpl<$Res, $Val extends KBADSDetailModel>
    implements $KBADSDetailModelCopyWith<$Res> {
  _$KBADSDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KBADSDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<int?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KBADSDetailModelImplCopyWith<$Res>
    implements $KBADSDetailModelCopyWith<$Res> {
  factory _$$KBADSDetailModelImplCopyWith(_$KBADSDetailModelImpl value,
          $Res Function(_$KBADSDetailModelImpl) then) =
      __$$KBADSDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int?> score});
}

/// @nodoc
class __$$KBADSDetailModelImplCopyWithImpl<$Res>
    extends _$KBADSDetailModelCopyWithImpl<$Res, _$KBADSDetailModelImpl>
    implements _$$KBADSDetailModelImplCopyWith<$Res> {
  __$$KBADSDetailModelImplCopyWithImpl(_$KBADSDetailModelImpl _value,
      $Res Function(_$KBADSDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KBADSDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_$KBADSDetailModelImpl(
      score: null == score
          ? _value._score
          : score // ignore: cast_nullable_to_non_nullable
              as List<int?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KBADSDetailModelImpl extends _KBADSDetailModel {
  const _$KBADSDetailModelImpl({final List<int?> score = const []})
      : _score = score,
        super._();

  factory _$KBADSDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KBADSDetailModelImplFromJson(json);

  final List<int?> _score;
  @override
  @JsonKey()
  List<int?> get score {
    if (_score is EqualUnmodifiableListView) return _score;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_score);
  }

  @override
  String toString() {
    return 'KBADSDetailModel(score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KBADSDetailModelImpl &&
            const DeepCollectionEquality().equals(other._score, _score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_score));

  /// Create a copy of KBADSDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KBADSDetailModelImplCopyWith<_$KBADSDetailModelImpl> get copyWith =>
      __$$KBADSDetailModelImplCopyWithImpl<_$KBADSDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KBADSDetailModelImplToJson(
      this,
    );
  }
}

abstract class _KBADSDetailModel extends KBADSDetailModel {
  const factory _KBADSDetailModel({final List<int?> score}) =
      _$KBADSDetailModelImpl;
  const _KBADSDetailModel._() : super._();

  factory _KBADSDetailModel.fromJson(Map<String, dynamic> json) =
      _$KBADSDetailModelImpl.fromJson;

  @override
  List<int?> get score;

  /// Create a copy of KBADSDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KBADSDetailModelImplCopyWith<_$KBADSDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
