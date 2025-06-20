// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'procedure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcedureModel _$ProcedureModelFromJson(Map<String, dynamic> json) {
  return _ProcedureModel.fromJson(json);
}

/// @nodoc
mixin _$ProcedureModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  int get week => throw _privateConstructorUsedError;
  String get sequence => throw _privateConstructorUsedError;

  /// Serializes this ProcedureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProcedureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcedureModelCopyWith<ProcedureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcedureModelCopyWith<$Res> {
  factory $ProcedureModelCopyWith(
          ProcedureModel value, $Res Function(ProcedureModel) then) =
      _$ProcedureModelCopyWithImpl<$Res, ProcedureModel>;
  @useResult
  $Res call(
      {String accessToken, String name, int round, int week, String sequence});
}

/// @nodoc
class _$ProcedureModelCopyWithImpl<$Res, $Val extends ProcedureModel>
    implements $ProcedureModelCopyWith<$Res> {
  _$ProcedureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcedureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? name = null,
    Object? round = null,
    Object? week = null,
    Object? sequence = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcedureModelImplCopyWith<$Res>
    implements $ProcedureModelCopyWith<$Res> {
  factory _$$ProcedureModelImplCopyWith(_$ProcedureModelImpl value,
          $Res Function(_$ProcedureModelImpl) then) =
      __$$ProcedureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken, String name, int round, int week, String sequence});
}

/// @nodoc
class __$$ProcedureModelImplCopyWithImpl<$Res>
    extends _$ProcedureModelCopyWithImpl<$Res, _$ProcedureModelImpl>
    implements _$$ProcedureModelImplCopyWith<$Res> {
  __$$ProcedureModelImplCopyWithImpl(
      _$ProcedureModelImpl _value, $Res Function(_$ProcedureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcedureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? name = null,
    Object? round = null,
    Object? week = null,
    Object? sequence = null,
  }) {
    return _then(_$ProcedureModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcedureModelImpl extends _ProcedureModel {
  const _$ProcedureModelImpl(
      {this.accessToken = '',
      this.name = '',
      this.round = 1,
      this.week = 0,
      this.sequence = ''})
      : super._();

  factory _$ProcedureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcedureModelImplFromJson(json);

  @override
  @JsonKey()
  final String accessToken;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int round;
  @override
  @JsonKey()
  final int week;
  @override
  @JsonKey()
  final String sequence;

  @override
  String toString() {
    return 'ProcedureModel(accessToken: $accessToken, name: $name, round: $round, week: $week, sequence: $sequence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedureModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.round, round) || other.round == round) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, name, round, week, sequence);

  /// Create a copy of ProcedureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedureModelImplCopyWith<_$ProcedureModelImpl> get copyWith =>
      __$$ProcedureModelImplCopyWithImpl<_$ProcedureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcedureModelImplToJson(
      this,
    );
  }
}

abstract class _ProcedureModel extends ProcedureModel {
  const factory _ProcedureModel(
      {final String accessToken,
      final String name,
      final int round,
      final int week,
      final String sequence}) = _$ProcedureModelImpl;
  const _ProcedureModel._() : super._();

  factory _ProcedureModel.fromJson(Map<String, dynamic> json) =
      _$ProcedureModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get name;
  @override
  int get round;
  @override
  int get week;
  @override
  String get sequence;

  /// Create a copy of ProcedureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcedureModelImplCopyWith<_$ProcedureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
