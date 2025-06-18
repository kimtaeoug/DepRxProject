// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sdui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SDUIModel _$SDUIModelFromJson(Map<String, dynamic> json) {
  return _SDUIModel.fromJson(json);
}

/// @nodoc
mixin _$SDUIModel {
  List<dynamic> get sequence => throw _privateConstructorUsedError;

  /// Serializes this SDUIModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SDUIModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SDUIModelCopyWith<SDUIModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SDUIModelCopyWith<$Res> {
  factory $SDUIModelCopyWith(SDUIModel value, $Res Function(SDUIModel) then) =
      _$SDUIModelCopyWithImpl<$Res, SDUIModel>;
  @useResult
  $Res call({List<dynamic> sequence});
}

/// @nodoc
class _$SDUIModelCopyWithImpl<$Res, $Val extends SDUIModel>
    implements $SDUIModelCopyWith<$Res> {
  _$SDUIModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SDUIModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = null,
  }) {
    return _then(_value.copyWith(
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SDUIModelImplCopyWith<$Res>
    implements $SDUIModelCopyWith<$Res> {
  factory _$$SDUIModelImplCopyWith(
          _$SDUIModelImpl value, $Res Function(_$SDUIModelImpl) then) =
      __$$SDUIModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> sequence});
}

/// @nodoc
class __$$SDUIModelImplCopyWithImpl<$Res>
    extends _$SDUIModelCopyWithImpl<$Res, _$SDUIModelImpl>
    implements _$$SDUIModelImplCopyWith<$Res> {
  __$$SDUIModelImplCopyWithImpl(
      _$SDUIModelImpl _value, $Res Function(_$SDUIModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SDUIModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = null,
  }) {
    return _then(_$SDUIModelImpl(
      sequence: null == sequence
          ? _value._sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SDUIModelImpl extends _SDUIModel {
  const _$SDUIModelImpl({final List<dynamic> sequence = const []})
      : _sequence = sequence,
        super._();

  factory _$SDUIModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SDUIModelImplFromJson(json);

  final List<dynamic> _sequence;
  @override
  @JsonKey()
  List<dynamic> get sequence {
    if (_sequence is EqualUnmodifiableListView) return _sequence;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sequence);
  }

  @override
  String toString() {
    return 'SDUIModel(sequence: $sequence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SDUIModelImpl &&
            const DeepCollectionEquality().equals(other._sequence, _sequence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sequence));

  /// Create a copy of SDUIModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SDUIModelImplCopyWith<_$SDUIModelImpl> get copyWith =>
      __$$SDUIModelImplCopyWithImpl<_$SDUIModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SDUIModelImplToJson(
      this,
    );
  }
}

abstract class _SDUIModel extends SDUIModel {
  const factory _SDUIModel({final List<dynamic> sequence}) = _$SDUIModelImpl;
  const _SDUIModel._() : super._();

  factory _SDUIModel.fromJson(Map<String, dynamic> json) =
      _$SDUIModelImpl.fromJson;

  @override
  List<dynamic> get sequence;

  /// Create a copy of SDUIModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SDUIModelImplCopyWith<_$SDUIModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
