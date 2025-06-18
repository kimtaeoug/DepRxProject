// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_ba_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportBAItemModel _$ReportBAItemModelFromJson(Map<String, dynamic> json) {
  return _ReportBAItemModel.fromJson(json);
}

/// @nodoc
mixin _$ReportBAItemModel {
  String get dateLabel => throw _privateConstructorUsedError;
  List<BAModel> get baList => throw _privateConstructorUsedError;

  /// Serializes this ReportBAItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportBAItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportBAItemModelCopyWith<ReportBAItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportBAItemModelCopyWith<$Res> {
  factory $ReportBAItemModelCopyWith(
          ReportBAItemModel value, $Res Function(ReportBAItemModel) then) =
      _$ReportBAItemModelCopyWithImpl<$Res, ReportBAItemModel>;
  @useResult
  $Res call({String dateLabel, List<BAModel> baList});
}

/// @nodoc
class _$ReportBAItemModelCopyWithImpl<$Res, $Val extends ReportBAItemModel>
    implements $ReportBAItemModelCopyWith<$Res> {
  _$ReportBAItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportBAItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateLabel = null,
    Object? baList = null,
  }) {
    return _then(_value.copyWith(
      dateLabel: null == dateLabel
          ? _value.dateLabel
          : dateLabel // ignore: cast_nullable_to_non_nullable
              as String,
      baList: null == baList
          ? _value.baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<BAModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportBAItemModelImplCopyWith<$Res>
    implements $ReportBAItemModelCopyWith<$Res> {
  factory _$$ReportBAItemModelImplCopyWith(_$ReportBAItemModelImpl value,
          $Res Function(_$ReportBAItemModelImpl) then) =
      __$$ReportBAItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dateLabel, List<BAModel> baList});
}

/// @nodoc
class __$$ReportBAItemModelImplCopyWithImpl<$Res>
    extends _$ReportBAItemModelCopyWithImpl<$Res, _$ReportBAItemModelImpl>
    implements _$$ReportBAItemModelImplCopyWith<$Res> {
  __$$ReportBAItemModelImplCopyWithImpl(_$ReportBAItemModelImpl _value,
      $Res Function(_$ReportBAItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportBAItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateLabel = null,
    Object? baList = null,
  }) {
    return _then(_$ReportBAItemModelImpl(
      dateLabel: null == dateLabel
          ? _value.dateLabel
          : dateLabel // ignore: cast_nullable_to_non_nullable
              as String,
      baList: null == baList
          ? _value._baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<BAModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportBAItemModelImpl extends _ReportBAItemModel {
  const _$ReportBAItemModelImpl(
      {this.dateLabel = '', final List<BAModel> baList = const []})
      : _baList = baList,
        super._();

  factory _$ReportBAItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportBAItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String dateLabel;
  final List<BAModel> _baList;
  @override
  @JsonKey()
  List<BAModel> get baList {
    if (_baList is EqualUnmodifiableListView) return _baList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_baList);
  }

  @override
  String toString() {
    return 'ReportBAItemModel(dateLabel: $dateLabel, baList: $baList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportBAItemModelImpl &&
            (identical(other.dateLabel, dateLabel) ||
                other.dateLabel == dateLabel) &&
            const DeepCollectionEquality().equals(other._baList, _baList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dateLabel, const DeepCollectionEquality().hash(_baList));

  /// Create a copy of ReportBAItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportBAItemModelImplCopyWith<_$ReportBAItemModelImpl> get copyWith =>
      __$$ReportBAItemModelImplCopyWithImpl<_$ReportBAItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportBAItemModelImplToJson(
      this,
    );
  }
}

abstract class _ReportBAItemModel extends ReportBAItemModel {
  const factory _ReportBAItemModel(
      {final String dateLabel,
      final List<BAModel> baList}) = _$ReportBAItemModelImpl;
  const _ReportBAItemModel._() : super._();

  factory _ReportBAItemModel.fromJson(Map<String, dynamic> json) =
      _$ReportBAItemModelImpl.fromJson;

  @override
  String get dateLabel;
  @override
  List<BAModel> get baList;

  /// Create a copy of ReportBAItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportBAItemModelImplCopyWith<_$ReportBAItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
