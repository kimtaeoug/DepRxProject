// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edu_last_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EduLastModel _$EduLastModelFromJson(Map<String, dynamic> json) {
  return _EduLastModel.fromJson(json);
}

/// @nodoc
mixin _$EduLastModel {
  List<int> get remainEducationList => throw _privateConstructorUsedError;

  /// Serializes this EduLastModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EduLastModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EduLastModelCopyWith<EduLastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EduLastModelCopyWith<$Res> {
  factory $EduLastModelCopyWith(
          EduLastModel value, $Res Function(EduLastModel) then) =
      _$EduLastModelCopyWithImpl<$Res, EduLastModel>;
  @useResult
  $Res call({List<int> remainEducationList});
}

/// @nodoc
class _$EduLastModelCopyWithImpl<$Res, $Val extends EduLastModel>
    implements $EduLastModelCopyWith<$Res> {
  _$EduLastModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EduLastModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainEducationList = null,
  }) {
    return _then(_value.copyWith(
      remainEducationList: null == remainEducationList
          ? _value.remainEducationList
          : remainEducationList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EduLastModelImplCopyWith<$Res>
    implements $EduLastModelCopyWith<$Res> {
  factory _$$EduLastModelImplCopyWith(
          _$EduLastModelImpl value, $Res Function(_$EduLastModelImpl) then) =
      __$$EduLastModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> remainEducationList});
}

/// @nodoc
class __$$EduLastModelImplCopyWithImpl<$Res>
    extends _$EduLastModelCopyWithImpl<$Res, _$EduLastModelImpl>
    implements _$$EduLastModelImplCopyWith<$Res> {
  __$$EduLastModelImplCopyWithImpl(
      _$EduLastModelImpl _value, $Res Function(_$EduLastModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EduLastModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainEducationList = null,
  }) {
    return _then(_$EduLastModelImpl(
      remainEducationList: null == remainEducationList
          ? _value._remainEducationList
          : remainEducationList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EduLastModelImpl extends _EduLastModel {
  const _$EduLastModelImpl({final List<int> remainEducationList = const []})
      : _remainEducationList = remainEducationList,
        super._();

  factory _$EduLastModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EduLastModelImplFromJson(json);

  final List<int> _remainEducationList;
  @override
  @JsonKey()
  List<int> get remainEducationList {
    if (_remainEducationList is EqualUnmodifiableListView)
      return _remainEducationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remainEducationList);
  }

  @override
  String toString() {
    return 'EduLastModel(remainEducationList: $remainEducationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EduLastModelImpl &&
            const DeepCollectionEquality()
                .equals(other._remainEducationList, _remainEducationList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_remainEducationList));

  /// Create a copy of EduLastModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EduLastModelImplCopyWith<_$EduLastModelImpl> get copyWith =>
      __$$EduLastModelImplCopyWithImpl<_$EduLastModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EduLastModelImplToJson(
      this,
    );
  }
}

abstract class _EduLastModel extends EduLastModel {
  const factory _EduLastModel({final List<int> remainEducationList}) =
      _$EduLastModelImpl;
  const _EduLastModel._() : super._();

  factory _EduLastModel.fromJson(Map<String, dynamic> json) =
      _$EduLastModelImpl.fromJson;

  @override
  List<int> get remainEducationList;

  /// Create a copy of EduLastModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EduLastModelImplCopyWith<_$EduLastModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
