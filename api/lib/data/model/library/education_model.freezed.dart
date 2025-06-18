// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EducationModel _$EducationModelFromJson(Map<String, dynamic> json) {
  return _EducationModel.fromJson(json);
}

/// @nodoc
mixin _$EducationModel {
  List<EducationItemModel> get educationList =>
      throw _privateConstructorUsedError;

  /// Serializes this EducationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EducationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EducationModelCopyWith<EducationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationModelCopyWith<$Res> {
  factory $EducationModelCopyWith(
          EducationModel value, $Res Function(EducationModel) then) =
      _$EducationModelCopyWithImpl<$Res, EducationModel>;
  @useResult
  $Res call({List<EducationItemModel> educationList});
}

/// @nodoc
class _$EducationModelCopyWithImpl<$Res, $Val extends EducationModel>
    implements $EducationModelCopyWith<$Res> {
  _$EducationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EducationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? educationList = null,
  }) {
    return _then(_value.copyWith(
      educationList: null == educationList
          ? _value.educationList
          : educationList // ignore: cast_nullable_to_non_nullable
              as List<EducationItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationModelImplCopyWith<$Res>
    implements $EducationModelCopyWith<$Res> {
  factory _$$EducationModelImplCopyWith(_$EducationModelImpl value,
          $Res Function(_$EducationModelImpl) then) =
      __$$EducationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EducationItemModel> educationList});
}

/// @nodoc
class __$$EducationModelImplCopyWithImpl<$Res>
    extends _$EducationModelCopyWithImpl<$Res, _$EducationModelImpl>
    implements _$$EducationModelImplCopyWith<$Res> {
  __$$EducationModelImplCopyWithImpl(
      _$EducationModelImpl _value, $Res Function(_$EducationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EducationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? educationList = null,
  }) {
    return _then(_$EducationModelImpl(
      educationList: null == educationList
          ? _value._educationList
          : educationList // ignore: cast_nullable_to_non_nullable
              as List<EducationItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationModelImpl extends _EducationModel {
  const _$EducationModelImpl(
      {final List<EducationItemModel> educationList = const []})
      : _educationList = educationList,
        super._();

  factory _$EducationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationModelImplFromJson(json);

  final List<EducationItemModel> _educationList;
  @override
  @JsonKey()
  List<EducationItemModel> get educationList {
    if (_educationList is EqualUnmodifiableListView) return _educationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_educationList);
  }

  @override
  String toString() {
    return 'EducationModel(educationList: $educationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationModelImpl &&
            const DeepCollectionEquality()
                .equals(other._educationList, _educationList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_educationList));

  /// Create a copy of EducationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationModelImplCopyWith<_$EducationModelImpl> get copyWith =>
      __$$EducationModelImplCopyWithImpl<_$EducationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationModelImplToJson(
      this,
    );
  }
}

abstract class _EducationModel extends EducationModel {
  const factory _EducationModel(
      {final List<EducationItemModel> educationList}) = _$EducationModelImpl;
  const _EducationModel._() : super._();

  factory _EducationModel.fromJson(Map<String, dynamic> json) =
      _$EducationModelImpl.fromJson;

  @override
  List<EducationItemModel> get educationList;

  /// Create a copy of EducationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EducationModelImplCopyWith<_$EducationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
