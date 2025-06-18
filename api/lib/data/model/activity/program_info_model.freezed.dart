// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgramInfoModel _$ProgramInfoModelFromJson(Map<String, dynamic> json) {
  return _ProgramInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ProgramInfoModel {
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  /// Serializes this ProgramInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgramInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramInfoModelCopyWith<ProgramInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramInfoModelCopyWith<$Res> {
  factory $ProgramInfoModelCopyWith(
          ProgramInfoModel value, $Res Function(ProgramInfoModel) then) =
      _$ProgramInfoModelCopyWithImpl<$Res, ProgramInfoModel>;
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class _$ProgramInfoModelCopyWithImpl<$Res, $Val extends ProgramInfoModel>
    implements $ProgramInfoModelCopyWith<$Res> {
  _$ProgramInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgramInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramInfoModelImplCopyWith<$Res>
    implements $ProgramInfoModelCopyWith<$Res> {
  factory _$$ProgramInfoModelImplCopyWith(_$ProgramInfoModelImpl value,
          $Res Function(_$ProgramInfoModelImpl) then) =
      __$$ProgramInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class __$$ProgramInfoModelImplCopyWithImpl<$Res>
    extends _$ProgramInfoModelCopyWithImpl<$Res, _$ProgramInfoModelImpl>
    implements _$$ProgramInfoModelImplCopyWith<$Res> {
  __$$ProgramInfoModelImplCopyWithImpl(_$ProgramInfoModelImpl _value,
      $Res Function(_$ProgramInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgramInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$ProgramInfoModelImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramInfoModelImpl extends _ProgramInfoModel {
  const _$ProgramInfoModelImpl({this.startDate = '', this.endDate = ''})
      : super._();

  factory _$ProgramInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramInfoModelImplFromJson(json);

  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;

  @override
  String toString() {
    return 'ProgramInfoModel(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramInfoModelImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of ProgramInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramInfoModelImplCopyWith<_$ProgramInfoModelImpl> get copyWith =>
      __$$ProgramInfoModelImplCopyWithImpl<_$ProgramInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramInfoModelImplToJson(
      this,
    );
  }
}

abstract class _ProgramInfoModel extends ProgramInfoModel {
  const factory _ProgramInfoModel(
      {final String startDate, final String endDate}) = _$ProgramInfoModelImpl;
  const _ProgramInfoModel._() : super._();

  factory _ProgramInfoModel.fromJson(Map<String, dynamic> json) =
      _$ProgramInfoModelImpl.fromJson;

  @override
  String get startDate;
  @override
  String get endDate;

  /// Create a copy of ProgramInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramInfoModelImplCopyWith<_$ProgramInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
