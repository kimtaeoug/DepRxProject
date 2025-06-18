// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remain_ba_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemainBAModel _$RemainBAModelFromJson(Map<String, dynamic> json) {
  return _RemainBAModel.fromJson(json);
}

/// @nodoc
mixin _$RemainBAModel {
  List<String> get remainActivity => throw _privateConstructorUsedError;

  /// Serializes this RemainBAModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemainBAModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemainBAModelCopyWith<RemainBAModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemainBAModelCopyWith<$Res> {
  factory $RemainBAModelCopyWith(
          RemainBAModel value, $Res Function(RemainBAModel) then) =
      _$RemainBAModelCopyWithImpl<$Res, RemainBAModel>;
  @useResult
  $Res call({List<String> remainActivity});
}

/// @nodoc
class _$RemainBAModelCopyWithImpl<$Res, $Val extends RemainBAModel>
    implements $RemainBAModelCopyWith<$Res> {
  _$RemainBAModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemainBAModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainActivity = null,
  }) {
    return _then(_value.copyWith(
      remainActivity: null == remainActivity
          ? _value.remainActivity
          : remainActivity // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemainBAModelImplCopyWith<$Res>
    implements $RemainBAModelCopyWith<$Res> {
  factory _$$RemainBAModelImplCopyWith(
          _$RemainBAModelImpl value, $Res Function(_$RemainBAModelImpl) then) =
      __$$RemainBAModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> remainActivity});
}

/// @nodoc
class __$$RemainBAModelImplCopyWithImpl<$Res>
    extends _$RemainBAModelCopyWithImpl<$Res, _$RemainBAModelImpl>
    implements _$$RemainBAModelImplCopyWith<$Res> {
  __$$RemainBAModelImplCopyWithImpl(
      _$RemainBAModelImpl _value, $Res Function(_$RemainBAModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemainBAModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainActivity = null,
  }) {
    return _then(_$RemainBAModelImpl(
      remainActivity: null == remainActivity
          ? _value._remainActivity
          : remainActivity // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemainBAModelImpl extends _RemainBAModel {
  const _$RemainBAModelImpl({final List<String> remainActivity = const []})
      : _remainActivity = remainActivity,
        super._();

  factory _$RemainBAModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemainBAModelImplFromJson(json);

  final List<String> _remainActivity;
  @override
  @JsonKey()
  List<String> get remainActivity {
    if (_remainActivity is EqualUnmodifiableListView) return _remainActivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remainActivity);
  }

  @override
  String toString() {
    return 'RemainBAModel(remainActivity: $remainActivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemainBAModelImpl &&
            const DeepCollectionEquality()
                .equals(other._remainActivity, _remainActivity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_remainActivity));

  /// Create a copy of RemainBAModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemainBAModelImplCopyWith<_$RemainBAModelImpl> get copyWith =>
      __$$RemainBAModelImplCopyWithImpl<_$RemainBAModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemainBAModelImplToJson(
      this,
    );
  }
}

abstract class _RemainBAModel extends RemainBAModel {
  const factory _RemainBAModel({final List<String> remainActivity}) =
      _$RemainBAModelImpl;
  const _RemainBAModel._() : super._();

  factory _RemainBAModel.fromJson(Map<String, dynamic> json) =
      _$RemainBAModelImpl.fromJson;

  @override
  List<String> get remainActivity;

  /// Create a copy of RemainBAModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemainBAModelImplCopyWith<_$RemainBAModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
