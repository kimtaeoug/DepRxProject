// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_ba_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectedBAItemEntity _$SelectedBAItemEntityFromJson(Map<String, dynamic> json) {
  return _SelectedBAItemEntity.fromJson(json);
}

/// @nodoc
mixin _$SelectedBAItemEntity {
  String get date => throw _privateConstructorUsedError;
  List<String> get selectedBa => throw _privateConstructorUsedError;

  /// Serializes this SelectedBAItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectedBAItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedBAItemEntityCopyWith<SelectedBAItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedBAItemEntityCopyWith<$Res> {
  factory $SelectedBAItemEntityCopyWith(SelectedBAItemEntity value,
          $Res Function(SelectedBAItemEntity) then) =
      _$SelectedBAItemEntityCopyWithImpl<$Res, SelectedBAItemEntity>;
  @useResult
  $Res call({String date, List<String> selectedBa});
}

/// @nodoc
class _$SelectedBAItemEntityCopyWithImpl<$Res,
        $Val extends SelectedBAItemEntity>
    implements $SelectedBAItemEntityCopyWith<$Res> {
  _$SelectedBAItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedBAItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? selectedBa = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBa: null == selectedBa
          ? _value.selectedBa
          : selectedBa // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedBAItemEntityImplCopyWith<$Res>
    implements $SelectedBAItemEntityCopyWith<$Res> {
  factory _$$SelectedBAItemEntityImplCopyWith(_$SelectedBAItemEntityImpl value,
          $Res Function(_$SelectedBAItemEntityImpl) then) =
      __$$SelectedBAItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, List<String> selectedBa});
}

/// @nodoc
class __$$SelectedBAItemEntityImplCopyWithImpl<$Res>
    extends _$SelectedBAItemEntityCopyWithImpl<$Res, _$SelectedBAItemEntityImpl>
    implements _$$SelectedBAItemEntityImplCopyWith<$Res> {
  __$$SelectedBAItemEntityImplCopyWithImpl(_$SelectedBAItemEntityImpl _value,
      $Res Function(_$SelectedBAItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectedBAItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? selectedBa = null,
  }) {
    return _then(_$SelectedBAItemEntityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBa: null == selectedBa
          ? _value._selectedBa
          : selectedBa // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedBAItemEntityImpl extends _SelectedBAItemEntity {
  const _$SelectedBAItemEntityImpl(
      {this.date = '', final List<String> selectedBa = const []})
      : _selectedBa = selectedBa,
        super._();

  factory _$SelectedBAItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedBAItemEntityImplFromJson(json);

  @override
  @JsonKey()
  final String date;
  final List<String> _selectedBa;
  @override
  @JsonKey()
  List<String> get selectedBa {
    if (_selectedBa is EqualUnmodifiableListView) return _selectedBa;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedBa);
  }

  @override
  String toString() {
    return 'SelectedBAItemEntity(date: $date, selectedBa: $selectedBa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedBAItemEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._selectedBa, _selectedBa));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_selectedBa));

  /// Create a copy of SelectedBAItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedBAItemEntityImplCopyWith<_$SelectedBAItemEntityImpl>
      get copyWith =>
          __$$SelectedBAItemEntityImplCopyWithImpl<_$SelectedBAItemEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedBAItemEntityImplToJson(
      this,
    );
  }
}

abstract class _SelectedBAItemEntity extends SelectedBAItemEntity {
  const factory _SelectedBAItemEntity(
      {final String date,
      final List<String> selectedBa}) = _$SelectedBAItemEntityImpl;
  const _SelectedBAItemEntity._() : super._();

  factory _SelectedBAItemEntity.fromJson(Map<String, dynamic> json) =
      _$SelectedBAItemEntityImpl.fromJson;

  @override
  String get date;
  @override
  List<String> get selectedBa;

  /// Create a copy of SelectedBAItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedBAItemEntityImplCopyWith<_$SelectedBAItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
