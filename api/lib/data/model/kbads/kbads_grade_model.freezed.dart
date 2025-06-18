// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kbads_grade_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KbadsGradeModel _$KbadsGradeModelFromJson(Map<String, dynamic> json) {
  return _KbadsGradeModel.fromJson(json);
}

/// @nodoc
mixin _$KbadsGradeModel {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  String get represent => throw _privateConstructorUsedError;
  List<String> get decrease => throw _privateConstructorUsedError;
  List<String> get same => throw _privateConstructorUsedError;
  List<String> get increase => throw _privateConstructorUsedError;

  /// Serializes this KbadsGradeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KbadsGradeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KbadsGradeModelCopyWith<KbadsGradeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KbadsGradeModelCopyWith<$Res> {
  factory $KbadsGradeModelCopyWith(
          KbadsGradeModel value, $Res Function(KbadsGradeModel) then) =
      _$KbadsGradeModelCopyWithImpl<$Res, KbadsGradeModel>;
  @useResult
  $Res call(
      {int min,
      int max,
      String represent,
      List<String> decrease,
      List<String> same,
      List<String> increase});
}

/// @nodoc
class _$KbadsGradeModelCopyWithImpl<$Res, $Val extends KbadsGradeModel>
    implements $KbadsGradeModelCopyWith<$Res> {
  _$KbadsGradeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KbadsGradeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? represent = null,
    Object? decrease = null,
    Object? same = null,
    Object? increase = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      represent: null == represent
          ? _value.represent
          : represent // ignore: cast_nullable_to_non_nullable
              as String,
      decrease: null == decrease
          ? _value.decrease
          : decrease // ignore: cast_nullable_to_non_nullable
              as List<String>,
      same: null == same
          ? _value.same
          : same // ignore: cast_nullable_to_non_nullable
              as List<String>,
      increase: null == increase
          ? _value.increase
          : increase // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KbadsGradeModelImplCopyWith<$Res>
    implements $KbadsGradeModelCopyWith<$Res> {
  factory _$$KbadsGradeModelImplCopyWith(_$KbadsGradeModelImpl value,
          $Res Function(_$KbadsGradeModelImpl) then) =
      __$$KbadsGradeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int min,
      int max,
      String represent,
      List<String> decrease,
      List<String> same,
      List<String> increase});
}

/// @nodoc
class __$$KbadsGradeModelImplCopyWithImpl<$Res>
    extends _$KbadsGradeModelCopyWithImpl<$Res, _$KbadsGradeModelImpl>
    implements _$$KbadsGradeModelImplCopyWith<$Res> {
  __$$KbadsGradeModelImplCopyWithImpl(
      _$KbadsGradeModelImpl _value, $Res Function(_$KbadsGradeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KbadsGradeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
    Object? represent = null,
    Object? decrease = null,
    Object? same = null,
    Object? increase = null,
  }) {
    return _then(_$KbadsGradeModelImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      represent: null == represent
          ? _value.represent
          : represent // ignore: cast_nullable_to_non_nullable
              as String,
      decrease: null == decrease
          ? _value._decrease
          : decrease // ignore: cast_nullable_to_non_nullable
              as List<String>,
      same: null == same
          ? _value._same
          : same // ignore: cast_nullable_to_non_nullable
              as List<String>,
      increase: null == increase
          ? _value._increase
          : increase // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KbadsGradeModelImpl extends _KbadsGradeModel {
  const _$KbadsGradeModelImpl(
      {this.min = -1,
      this.max = -1,
      this.represent = '',
      final List<String> decrease = const [],
      final List<String> same = const [],
      final List<String> increase = const []})
      : _decrease = decrease,
        _same = same,
        _increase = increase,
        super._();

  factory _$KbadsGradeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KbadsGradeModelImplFromJson(json);

  @override
  @JsonKey()
  final int min;
  @override
  @JsonKey()
  final int max;
  @override
  @JsonKey()
  final String represent;
  final List<String> _decrease;
  @override
  @JsonKey()
  List<String> get decrease {
    if (_decrease is EqualUnmodifiableListView) return _decrease;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_decrease);
  }

  final List<String> _same;
  @override
  @JsonKey()
  List<String> get same {
    if (_same is EqualUnmodifiableListView) return _same;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_same);
  }

  final List<String> _increase;
  @override
  @JsonKey()
  List<String> get increase {
    if (_increase is EqualUnmodifiableListView) return _increase;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_increase);
  }

  @override
  String toString() {
    return 'KbadsGradeModel(min: $min, max: $max, represent: $represent, decrease: $decrease, same: $same, increase: $increase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KbadsGradeModelImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.represent, represent) ||
                other.represent == represent) &&
            const DeepCollectionEquality().equals(other._decrease, _decrease) &&
            const DeepCollectionEquality().equals(other._same, _same) &&
            const DeepCollectionEquality().equals(other._increase, _increase));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      min,
      max,
      represent,
      const DeepCollectionEquality().hash(_decrease),
      const DeepCollectionEquality().hash(_same),
      const DeepCollectionEquality().hash(_increase));

  /// Create a copy of KbadsGradeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KbadsGradeModelImplCopyWith<_$KbadsGradeModelImpl> get copyWith =>
      __$$KbadsGradeModelImplCopyWithImpl<_$KbadsGradeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KbadsGradeModelImplToJson(
      this,
    );
  }
}

abstract class _KbadsGradeModel extends KbadsGradeModel {
  const factory _KbadsGradeModel(
      {final int min,
      final int max,
      final String represent,
      final List<String> decrease,
      final List<String> same,
      final List<String> increase}) = _$KbadsGradeModelImpl;
  const _KbadsGradeModel._() : super._();

  factory _KbadsGradeModel.fromJson(Map<String, dynamic> json) =
      _$KbadsGradeModelImpl.fromJson;

  @override
  int get min;
  @override
  int get max;
  @override
  String get represent;
  @override
  List<String> get decrease;
  @override
  List<String> get same;
  @override
  List<String> get increase;

  /// Create a copy of KbadsGradeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KbadsGradeModelImplCopyWith<_$KbadsGradeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
