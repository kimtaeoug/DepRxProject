// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kbads_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KbadsItemModelImpl _$$KbadsItemModelImplFromJson(Map<String, dynamic> json) =>
    _$KbadsItemModelImpl(
      grade1: json['grade1'] == null
          ? const KbadsGradeModel()
          : KbadsGradeModel.fromJson(json['grade1'] as Map<String, dynamic>),
      grade2: json['grade2'] == null
          ? const KbadsGradeModel()
          : KbadsGradeModel.fromJson(json['grade2'] as Map<String, dynamic>),
      grade3: json['grade3'] == null
          ? const KbadsGradeModel()
          : KbadsGradeModel.fromJson(json['grade3'] as Map<String, dynamic>),
      grade4: json['grade4'] == null
          ? const KbadsGradeModel()
          : KbadsGradeModel.fromJson(json['grade4'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KbadsItemModelImplToJson(
        _$KbadsItemModelImpl instance) =>
    <String, dynamic>{
      'grade1': instance.grade1,
      'grade2': instance.grade2,
      'grade3': instance.grade3,
      'grade4': instance.grade4,
    };
