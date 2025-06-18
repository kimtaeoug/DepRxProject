// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_task_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodayTaskItemModel _$TodayTaskItemModelFromJson(Map<String, dynamic> json) {
  return _TodayTaskItemModel.fromJson(json);
}

/// @nodoc
mixin _$TodayTaskItemModel {
  String get date => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  /// Serializes this TodayTaskItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayTaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayTaskItemModelCopyWith<TodayTaskItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayTaskItemModelCopyWith<$Res> {
  factory $TodayTaskItemModelCopyWith(
          TodayTaskItemModel value, $Res Function(TodayTaskItemModel) then) =
      _$TodayTaskItemModelCopyWithImpl<$Res, TodayTaskItemModel>;
  @useResult
  $Res call({String date, String imagePath, String contents, bool done});
}

/// @nodoc
class _$TodayTaskItemModelCopyWithImpl<$Res, $Val extends TodayTaskItemModel>
    implements $TodayTaskItemModelCopyWith<$Res> {
  _$TodayTaskItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayTaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? imagePath = null,
    Object? contents = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodayTaskItemModelImplCopyWith<$Res>
    implements $TodayTaskItemModelCopyWith<$Res> {
  factory _$$TodayTaskItemModelImplCopyWith(_$TodayTaskItemModelImpl value,
          $Res Function(_$TodayTaskItemModelImpl) then) =
      __$$TodayTaskItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String imagePath, String contents, bool done});
}

/// @nodoc
class __$$TodayTaskItemModelImplCopyWithImpl<$Res>
    extends _$TodayTaskItemModelCopyWithImpl<$Res, _$TodayTaskItemModelImpl>
    implements _$$TodayTaskItemModelImplCopyWith<$Res> {
  __$$TodayTaskItemModelImplCopyWithImpl(_$TodayTaskItemModelImpl _value,
      $Res Function(_$TodayTaskItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayTaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? imagePath = null,
    Object? contents = null,
    Object? done = null,
  }) {
    return _then(_$TodayTaskItemModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayTaskItemModelImpl extends _TodayTaskItemModel {
  const _$TodayTaskItemModelImpl(
      {this.date = '',
      this.imagePath = '',
      this.contents = '',
      this.done = false})
      : super._();

  factory _$TodayTaskItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayTaskItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String imagePath;
  @override
  @JsonKey()
  final String contents;
  @override
  @JsonKey()
  final bool done;

  @override
  String toString() {
    return 'TodayTaskItemModel(date: $date, imagePath: $imagePath, contents: $contents, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayTaskItemModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, imagePath, contents, done);

  /// Create a copy of TodayTaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayTaskItemModelImplCopyWith<_$TodayTaskItemModelImpl> get copyWith =>
      __$$TodayTaskItemModelImplCopyWithImpl<_$TodayTaskItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayTaskItemModelImplToJson(
      this,
    );
  }
}

abstract class _TodayTaskItemModel extends TodayTaskItemModel {
  const factory _TodayTaskItemModel(
      {final String date,
      final String imagePath,
      final String contents,
      final bool done}) = _$TodayTaskItemModelImpl;
  const _TodayTaskItemModel._() : super._();

  factory _TodayTaskItemModel.fromJson(Map<String, dynamic> json) =
      _$TodayTaskItemModelImpl.fromJson;

  @override
  String get date;
  @override
  String get imagePath;
  @override
  String get contents;
  @override
  bool get done;

  /// Create a copy of TodayTaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayTaskItemModelImplCopyWith<_$TodayTaskItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
