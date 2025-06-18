// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kbads_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KBADSListModel _$KBADSListModelFromJson(Map<String, dynamic> json) {
  return _KBADSListModel.fromJson(json);
}

/// @nodoc
mixin _$KBADSListModel {
  List<String> get list => throw _privateConstructorUsedError;

  /// Serializes this KBADSListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KBADSListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KBADSListModelCopyWith<KBADSListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KBADSListModelCopyWith<$Res> {
  factory $KBADSListModelCopyWith(
          KBADSListModel value, $Res Function(KBADSListModel) then) =
      _$KBADSListModelCopyWithImpl<$Res, KBADSListModel>;
  @useResult
  $Res call({List<String> list});
}

/// @nodoc
class _$KBADSListModelCopyWithImpl<$Res, $Val extends KBADSListModel>
    implements $KBADSListModelCopyWith<$Res> {
  _$KBADSListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KBADSListModel
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
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KBADSListModelImplCopyWith<$Res>
    implements $KBADSListModelCopyWith<$Res> {
  factory _$$KBADSListModelImplCopyWith(_$KBADSListModelImpl value,
          $Res Function(_$KBADSListModelImpl) then) =
      __$$KBADSListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> list});
}

/// @nodoc
class __$$KBADSListModelImplCopyWithImpl<$Res>
    extends _$KBADSListModelCopyWithImpl<$Res, _$KBADSListModelImpl>
    implements _$$KBADSListModelImplCopyWith<$Res> {
  __$$KBADSListModelImplCopyWithImpl(
      _$KBADSListModelImpl _value, $Res Function(_$KBADSListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KBADSListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$KBADSListModelImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KBADSListModelImpl extends _KBADSListModel {
  const _$KBADSListModelImpl({final List<String> list = const []})
      : _list = list,
        super._();

  factory _$KBADSListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KBADSListModelImplFromJson(json);

  final List<String> _list;
  @override
  @JsonKey()
  List<String> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'KBADSListModel(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KBADSListModelImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of KBADSListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KBADSListModelImplCopyWith<_$KBADSListModelImpl> get copyWith =>
      __$$KBADSListModelImplCopyWithImpl<_$KBADSListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KBADSListModelImplToJson(
      this,
    );
  }
}

abstract class _KBADSListModel extends KBADSListModel {
  const factory _KBADSListModel({final List<String> list}) =
      _$KBADSListModelImpl;
  const _KBADSListModel._() : super._();

  factory _KBADSListModel.fromJson(Map<String, dynamic> json) =
      _$KBADSListModelImpl.fromJson;

  @override
  List<String> get list;

  /// Create a copy of KBADSListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KBADSListModelImplCopyWith<_$KBADSListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
