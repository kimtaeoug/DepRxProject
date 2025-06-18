// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alpha_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlphaDataEntityImpl _$$AlphaDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AlphaDataEntityImpl(
      locationType: json['locationType'] as String? ?? '',
      residenceType: json['residenceType'] as String? ?? '',
      petType: json['petType'] as String? ?? '',
      availableTimes: (json['availableTimes'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
              .toList() ??
          const [],
      exerciseFrequency: json['exerciseFrequency'] as String? ?? '',
      exerciseIntensity: json['exerciseIntensity'] as String? ?? '',
      exerciseTimes: json['exerciseTimes'] as String? ?? '',
      height: (json['height'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      smokingStatus: json['smokingStatus'] as String? ?? '',
      drinkFrequency: json['drinkFrequency'] as String? ?? '',
      drinkAmount: json['drinkAmount'] as String? ?? '',
      breakfastFrequency: json['breakfastFrequency'] as String? ?? '',
      disease: (json['disease'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AlphaDataEntityImplToJson(
        _$AlphaDataEntityImpl instance) =>
    <String, dynamic>{
      'locationType': instance.locationType,
      'residenceType': instance.residenceType,
      'petType': instance.petType,
      'availableTimes': instance.availableTimes,
      'exerciseFrequency': instance.exerciseFrequency,
      'exerciseIntensity': instance.exerciseIntensity,
      'exerciseTimes': instance.exerciseTimes,
      'height': instance.height,
      'weight': instance.weight,
      'smokingStatus': instance.smokingStatus,
      'drinkFrequency': instance.drinkFrequency,
      'drinkAmount': instance.drinkAmount,
      'breakfastFrequency': instance.breakfastFrequency,
      'disease': instance.disease,
    };
