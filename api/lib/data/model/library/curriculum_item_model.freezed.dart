// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurriculumItemModel _$CurriculumItemModelFromJson(Map<String, dynamic> json) {
  return _CurriculumItemModel.fromJson(json);
}

/// @nodoc
mixin _$CurriculumItemModel {
  int get idx => throw _privateConstructorUsedError;
  String get weeklyTitle => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;
  List<String> get detail => throw _privateConstructorUsedError;

  /// Serializes this CurriculumItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurriculumItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumItemModelCopyWith<CurriculumItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumItemModelCopyWith<$Res> {
  factory $CurriculumItemModelCopyWith(
          CurriculumItemModel value, $Res Function(CurriculumItemModel) then) =
      _$CurriculumItemModelCopyWithImpl<$Res, CurriculumItemModel>;
  @useResult
  $Res call({int idx, String weeklyTitle, String goal, List<String> detail});
}

/// @nodoc
class _$CurriculumItemModelCopyWithImpl<$Res, $Val extends CurriculumItemModel>
    implements $CurriculumItemModelCopyWith<$Res> {
  _$CurriculumItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurriculumItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? weeklyTitle = null,
    Object? goal = null,
    Object? detail = null,
  }) {
    return _then(_value.copyWith(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyTitle: null == weeklyTitle
          ? _value.weeklyTitle
          : weeklyTitle // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumItemModelImplCopyWith<$Res>
    implements $CurriculumItemModelCopyWith<$Res> {
  factory _$$CurriculumItemModelImplCopyWith(_$CurriculumItemModelImpl value,
          $Res Function(_$CurriculumItemModelImpl) then) =
      __$$CurriculumItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int idx, String weeklyTitle, String goal, List<String> detail});
}

/// @nodoc
class __$$CurriculumItemModelImplCopyWithImpl<$Res>
    extends _$CurriculumItemModelCopyWithImpl<$Res, _$CurriculumItemModelImpl>
    implements _$$CurriculumItemModelImplCopyWith<$Res> {
  __$$CurriculumItemModelImplCopyWithImpl(_$CurriculumItemModelImpl _value,
      $Res Function(_$CurriculumItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurriculumItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? weeklyTitle = null,
    Object? goal = null,
    Object? detail = null,
  }) {
    return _then(_$CurriculumItemModelImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyTitle: null == weeklyTitle
          ? _value.weeklyTitle
          : weeklyTitle // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurriculumItemModelImpl extends _CurriculumItemModel {
  const _$CurriculumItemModelImpl(
      {this.idx = 0,
      this.weeklyTitle = '',
      this.goal = '',
      final List<String> detail = const []})
      : _detail = detail,
        super._();

  factory _$CurriculumItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumItemModelImplFromJson(json);

  @override
  @JsonKey()
  final int idx;
  @override
  @JsonKey()
  final String weeklyTitle;
  @override
  @JsonKey()
  final String goal;
  final List<String> _detail;
  @override
  @JsonKey()
  List<String> get detail {
    if (_detail is EqualUnmodifiableListView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detail);
  }

  @override
  String toString() {
    return 'CurriculumItemModel(idx: $idx, weeklyTitle: $weeklyTitle, goal: $goal, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumItemModelImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.weeklyTitle, weeklyTitle) ||
                other.weeklyTitle == weeklyTitle) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idx, weeklyTitle, goal,
      const DeepCollectionEquality().hash(_detail));

  /// Create a copy of CurriculumItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumItemModelImplCopyWith<_$CurriculumItemModelImpl> get copyWith =>
      __$$CurriculumItemModelImplCopyWithImpl<_$CurriculumItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurriculumItemModelImplToJson(
      this,
    );
  }
}

abstract class _CurriculumItemModel extends CurriculumItemModel {
  const factory _CurriculumItemModel(
      {final int idx,
      final String weeklyTitle,
      final String goal,
      final List<String> detail}) = _$CurriculumItemModelImpl;
  const _CurriculumItemModel._() : super._();

  factory _CurriculumItemModel.fromJson(Map<String, dynamic> json) =
      _$CurriculumItemModelImpl.fromJson;

  @override
  int get idx;
  @override
  String get weeklyTitle;
  @override
  String get goal;
  @override
  List<String> get detail;

  /// Create a copy of CurriculumItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumItemModelImplCopyWith<_$CurriculumItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
