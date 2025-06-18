// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurriculumModel _$CurriculumModelFromJson(Map<String, dynamic> json) {
  return _CurriculumModel.fromJson(json);
}

/// @nodoc
mixin _$CurriculumModel {
  List<CurriculumItemModel> get list => throw _privateConstructorUsedError;

  /// Serializes this CurriculumModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumModelCopyWith<CurriculumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumModelCopyWith<$Res> {
  factory $CurriculumModelCopyWith(
          CurriculumModel value, $Res Function(CurriculumModel) then) =
      _$CurriculumModelCopyWithImpl<$Res, CurriculumModel>;
  @useResult
  $Res call({List<CurriculumItemModel> list});
}

/// @nodoc
class _$CurriculumModelCopyWithImpl<$Res, $Val extends CurriculumModel>
    implements $CurriculumModelCopyWith<$Res> {
  _$CurriculumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CurriculumItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumModelImplCopyWith<$Res>
    implements $CurriculumModelCopyWith<$Res> {
  factory _$$CurriculumModelImplCopyWith(_$CurriculumModelImpl value,
          $Res Function(_$CurriculumModelImpl) then) =
      __$$CurriculumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CurriculumItemModel> list});
}

/// @nodoc
class __$$CurriculumModelImplCopyWithImpl<$Res>
    extends _$CurriculumModelCopyWithImpl<$Res, _$CurriculumModelImpl>
    implements _$$CurriculumModelImplCopyWith<$Res> {
  __$$CurriculumModelImplCopyWithImpl(
      _$CurriculumModelImpl _value, $Res Function(_$CurriculumModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$CurriculumModelImpl(
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CurriculumItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurriculumModelImpl extends _CurriculumModel {
  const _$CurriculumModelImpl(final List<CurriculumItemModel> list)
      : _list = list,
        super._();

  factory _$CurriculumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumModelImplFromJson(json);

  final List<CurriculumItemModel> _list;
  @override
  List<CurriculumItemModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'CurriculumModel(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumModelImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of CurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumModelImplCopyWith<_$CurriculumModelImpl> get copyWith =>
      __$$CurriculumModelImplCopyWithImpl<_$CurriculumModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurriculumModelImplToJson(
      this,
    );
  }
}

abstract class _CurriculumModel extends CurriculumModel {
  const factory _CurriculumModel(final List<CurriculumItemModel> list) =
      _$CurriculumModelImpl;
  const _CurriculumModel._() : super._();

  factory _CurriculumModel.fromJson(Map<String, dynamic> json) =
      _$CurriculumModelImpl.fromJson;

  @override
  List<CurriculumItemModel> get list;

  /// Create a copy of CurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumModelImplCopyWith<_$CurriculumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
