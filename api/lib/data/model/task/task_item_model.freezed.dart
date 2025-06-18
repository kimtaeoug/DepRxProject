// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskItemModel _$TaskItemModelFromJson(Map<String, dynamic> json) {
  return _TaskItemModel.fromJson(json);
}

/// @nodoc
mixin _$TaskItemModel {
  String get taskName => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  /// Serializes this TaskItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskItemModelCopyWith<TaskItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskItemModelCopyWith<$Res> {
  factory $TaskItemModelCopyWith(
          TaskItemModel value, $Res Function(TaskItemModel) then) =
      _$TaskItemModelCopyWithImpl<$Res, TaskItemModel>;
  @useResult
  $Res call({String taskName, bool done});
}

/// @nodoc
class _$TaskItemModelCopyWithImpl<$Res, $Val extends TaskItemModel>
    implements $TaskItemModelCopyWith<$Res> {
  _$TaskItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskItemModelImplCopyWith<$Res>
    implements $TaskItemModelCopyWith<$Res> {
  factory _$$TaskItemModelImplCopyWith(
          _$TaskItemModelImpl value, $Res Function(_$TaskItemModelImpl) then) =
      __$$TaskItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskName, bool done});
}

/// @nodoc
class __$$TaskItemModelImplCopyWithImpl<$Res>
    extends _$TaskItemModelCopyWithImpl<$Res, _$TaskItemModelImpl>
    implements _$$TaskItemModelImplCopyWith<$Res> {
  __$$TaskItemModelImplCopyWithImpl(
      _$TaskItemModelImpl _value, $Res Function(_$TaskItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskName = null,
    Object? done = null,
  }) {
    return _then(_$TaskItemModelImpl(
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
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
class _$TaskItemModelImpl extends _TaskItemModel {
  const _$TaskItemModelImpl({this.taskName = '', this.done = false})
      : super._();

  factory _$TaskItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String taskName;
  @override
  @JsonKey()
  final bool done;

  @override
  String toString() {
    return 'TaskItemModel(taskName: $taskName, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskItemModelImpl &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskName, done);

  /// Create a copy of TaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskItemModelImplCopyWith<_$TaskItemModelImpl> get copyWith =>
      __$$TaskItemModelImplCopyWithImpl<_$TaskItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskItemModelImplToJson(
      this,
    );
  }
}

abstract class _TaskItemModel extends TaskItemModel {
  const factory _TaskItemModel({final String taskName, final bool done}) =
      _$TaskItemModelImpl;
  const _TaskItemModel._() : super._();

  factory _TaskItemModel.fromJson(Map<String, dynamic> json) =
      _$TaskItemModelImpl.fromJson;

  @override
  String get taskName;
  @override
  bool get done;

  /// Create a copy of TaskItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskItemModelImplCopyWith<_$TaskItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
