import 'package:freezed_annotation/freezed_annotation.dart';

part 'alpha_data_entity.g.dart';
part 'alpha_data_entity.freezed.dart';

@freezed
class AlphaDataEntity with _$AlphaDataEntity{
  const factory AlphaDataEntity({
    @Default('') String locationType,
    @Default('') String residenceType,
    @Default('') String petType,
    @Default([]) List<List<bool>> availableTimes,
    @Default('') String exerciseFrequency,
    @Default('') String exerciseIntensity,
    @Default('') String exerciseTimes,
    @Default(0) int height,
    @Default(0) int weight,
    @Default('') String smokingStatus,
    @Default('') String drinkFrequency,
    @Default('') String drinkAmount,
    @Default('') String breakfastFrequency,
    @Default([]) List<String> disease
  }) =_AlphaDataEntity;
  const AlphaDataEntity._();
  factory AlphaDataEntity.fromJson(Map<String, dynamic> json) => _$AlphaDataEntityFromJson(json);
} 