// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) {
  return _ReportModel.fromJson(json);
}

/// @nodoc
mixin _$ReportModel {
  int get week => throw _privateConstructorUsedError;
  int get achieveRate => throw _privateConstructorUsedError;
  KBADSValueModel get kbadsResult => throw _privateConstructorUsedError;
  List<String> get rewardList => throw _privateConstructorUsedError;
  List<ReportBAItemModel> get baList => throw _privateConstructorUsedError;

  /// Serializes this ReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportModelCopyWith<ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) then) =
      _$ReportModelCopyWithImpl<$Res, ReportModel>;
  @useResult
  $Res call(
      {int week,
      int achieveRate,
      KBADSValueModel kbadsResult,
      List<String> rewardList,
      List<ReportBAItemModel> baList});

  $KBADSValueModelCopyWith<$Res> get kbadsResult;
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res, $Val extends ReportModel>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? achieveRate = null,
    Object? kbadsResult = null,
    Object? rewardList = null,
    Object? baList = null,
  }) {
    return _then(_value.copyWith(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      achieveRate: null == achieveRate
          ? _value.achieveRate
          : achieveRate // ignore: cast_nullable_to_non_nullable
              as int,
      kbadsResult: null == kbadsResult
          ? _value.kbadsResult
          : kbadsResult // ignore: cast_nullable_to_non_nullable
              as KBADSValueModel,
      rewardList: null == rewardList
          ? _value.rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      baList: null == baList
          ? _value.baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<ReportBAItemModel>,
    ) as $Val);
  }

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KBADSValueModelCopyWith<$Res> get kbadsResult {
    return $KBADSValueModelCopyWith<$Res>(_value.kbadsResult, (value) {
      return _then(_value.copyWith(kbadsResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportModelImplCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$$ReportModelImplCopyWith(
          _$ReportModelImpl value, $Res Function(_$ReportModelImpl) then) =
      __$$ReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int week,
      int achieveRate,
      KBADSValueModel kbadsResult,
      List<String> rewardList,
      List<ReportBAItemModel> baList});

  @override
  $KBADSValueModelCopyWith<$Res> get kbadsResult;
}

/// @nodoc
class __$$ReportModelImplCopyWithImpl<$Res>
    extends _$ReportModelCopyWithImpl<$Res, _$ReportModelImpl>
    implements _$$ReportModelImplCopyWith<$Res> {
  __$$ReportModelImplCopyWithImpl(
      _$ReportModelImpl _value, $Res Function(_$ReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? achieveRate = null,
    Object? kbadsResult = null,
    Object? rewardList = null,
    Object? baList = null,
  }) {
    return _then(_$ReportModelImpl(
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      achieveRate: null == achieveRate
          ? _value.achieveRate
          : achieveRate // ignore: cast_nullable_to_non_nullable
              as int,
      kbadsResult: null == kbadsResult
          ? _value.kbadsResult
          : kbadsResult // ignore: cast_nullable_to_non_nullable
              as KBADSValueModel,
      rewardList: null == rewardList
          ? _value._rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      baList: null == baList
          ? _value._baList
          : baList // ignore: cast_nullable_to_non_nullable
              as List<ReportBAItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportModelImpl extends _ReportModel {
  const _$ReportModelImpl(
      {this.week = 0,
      this.achieveRate = 0,
      this.kbadsResult = const KBADSValueModel(),
      final List<String> rewardList = const [],
      final List<ReportBAItemModel> baList = const []})
      : _rewardList = rewardList,
        _baList = baList,
        super._();

  factory _$ReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportModelImplFromJson(json);

  @override
  @JsonKey()
  final int week;
  @override
  @JsonKey()
  final int achieveRate;
  @override
  @JsonKey()
  final KBADSValueModel kbadsResult;
  final List<String> _rewardList;
  @override
  @JsonKey()
  List<String> get rewardList {
    if (_rewardList is EqualUnmodifiableListView) return _rewardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewardList);
  }

  final List<ReportBAItemModel> _baList;
  @override
  @JsonKey()
  List<ReportBAItemModel> get baList {
    if (_baList is EqualUnmodifiableListView) return _baList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_baList);
  }

  @override
  String toString() {
    return 'ReportModel(week: $week, achieveRate: $achieveRate, kbadsResult: $kbadsResult, rewardList: $rewardList, baList: $baList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportModelImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.achieveRate, achieveRate) ||
                other.achieveRate == achieveRate) &&
            (identical(other.kbadsResult, kbadsResult) ||
                other.kbadsResult == kbadsResult) &&
            const DeepCollectionEquality()
                .equals(other._rewardList, _rewardList) &&
            const DeepCollectionEquality().equals(other._baList, _baList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      week,
      achieveRate,
      kbadsResult,
      const DeepCollectionEquality().hash(_rewardList),
      const DeepCollectionEquality().hash(_baList));

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      __$$ReportModelImplCopyWithImpl<_$ReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportModelImplToJson(
      this,
    );
  }
}

abstract class _ReportModel extends ReportModel {
  const factory _ReportModel(
      {final int week,
      final int achieveRate,
      final KBADSValueModel kbadsResult,
      final List<String> rewardList,
      final List<ReportBAItemModel> baList}) = _$ReportModelImpl;
  const _ReportModel._() : super._();

  factory _ReportModel.fromJson(Map<String, dynamic> json) =
      _$ReportModelImpl.fromJson;

  @override
  int get week;
  @override
  int get achieveRate;
  @override
  KBADSValueModel get kbadsResult;
  @override
  List<String> get rewardList;
  @override
  List<ReportBAItemModel> get baList;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
