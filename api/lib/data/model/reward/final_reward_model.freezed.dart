// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'final_reward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinalRewardModel _$FinalRewardModelFromJson(Map<String, dynamic> json) {
  return _FinalRewardModel.fromJson(json);
}

/// @nodoc
mixin _$FinalRewardModel {
  String get header => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get why => throw _privateConstructorUsedError;
  List<RewardModel> get rewardList => throw _privateConstructorUsedError;

  /// Serializes this FinalRewardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinalRewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinalRewardModelCopyWith<FinalRewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinalRewardModelCopyWith<$Res> {
  factory $FinalRewardModelCopyWith(
          FinalRewardModel value, $Res Function(FinalRewardModel) then) =
      _$FinalRewardModelCopyWithImpl<$Res, FinalRewardModel>;
  @useResult
  $Res call(
      {String header,
      String imagePath,
      String contents,
      String date,
      String why,
      List<RewardModel> rewardList});
}

/// @nodoc
class _$FinalRewardModelCopyWithImpl<$Res, $Val extends FinalRewardModel>
    implements $FinalRewardModelCopyWith<$Res> {
  _$FinalRewardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinalRewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? imagePath = null,
    Object? contents = null,
    Object? date = null,
    Object? why = null,
    Object? rewardList = null,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      why: null == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String,
      rewardList: null == rewardList
          ? _value.rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinalRewardModelImplCopyWith<$Res>
    implements $FinalRewardModelCopyWith<$Res> {
  factory _$$FinalRewardModelImplCopyWith(_$FinalRewardModelImpl value,
          $Res Function(_$FinalRewardModelImpl) then) =
      __$$FinalRewardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String header,
      String imagePath,
      String contents,
      String date,
      String why,
      List<RewardModel> rewardList});
}

/// @nodoc
class __$$FinalRewardModelImplCopyWithImpl<$Res>
    extends _$FinalRewardModelCopyWithImpl<$Res, _$FinalRewardModelImpl>
    implements _$$FinalRewardModelImplCopyWith<$Res> {
  __$$FinalRewardModelImplCopyWithImpl(_$FinalRewardModelImpl _value,
      $Res Function(_$FinalRewardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinalRewardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? imagePath = null,
    Object? contents = null,
    Object? date = null,
    Object? why = null,
    Object? rewardList = null,
  }) {
    return _then(_$FinalRewardModelImpl(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      why: null == why
          ? _value.why
          : why // ignore: cast_nullable_to_non_nullable
              as String,
      rewardList: null == rewardList
          ? _value._rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<RewardModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinalRewardModelImpl extends _FinalRewardModel {
  const _$FinalRewardModelImpl(
      {this.header = '',
      this.imagePath = '',
      this.contents = '',
      this.date = '',
      this.why = '',
      final List<RewardModel> rewardList = const []})
      : _rewardList = rewardList,
        super._();

  factory _$FinalRewardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinalRewardModelImplFromJson(json);

  @override
  @JsonKey()
  final String header;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String contents;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String why;
  final List<RewardModel> _rewardList;
  @override
  @JsonKey()
  List<RewardModel> get rewardList {
    if (_rewardList is EqualUnmodifiableListView) return _rewardList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rewardList);
  }

  @override
  String toString() {
    return 'FinalRewardModel(header: $header, imagePath: $imagePath, contents: $contents, date: $date, why: $why, rewardList: $rewardList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinalRewardModelImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.why, why) || other.why == why) &&
            const DeepCollectionEquality()
                .equals(other._rewardList, _rewardList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, imagePath, contents,
      date, why, const DeepCollectionEquality().hash(_rewardList));

  /// Create a copy of FinalRewardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinalRewardModelImplCopyWith<_$FinalRewardModelImpl> get copyWith =>
      __$$FinalRewardModelImplCopyWithImpl<_$FinalRewardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinalRewardModelImplToJson(
      this,
    );
  }
}

abstract class _FinalRewardModel extends FinalRewardModel {
  const factory _FinalRewardModel(
      {final String header,
      final String imagePath,
      final String contents,
      final String date,
      final String why,
      final List<RewardModel> rewardList}) = _$FinalRewardModelImpl;
  const _FinalRewardModel._() : super._();

  factory _FinalRewardModel.fromJson(Map<String, dynamic> json) =
      _$FinalRewardModelImpl.fromJson;

  @override
  String get header;
  @override
  String get imagePath;
  @override
  String get contents;
  @override
  String get date;
  @override
  String get why;
  @override
  List<RewardModel> get rewardList;

  /// Create a copy of FinalRewardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinalRewardModelImplCopyWith<_$FinalRewardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
