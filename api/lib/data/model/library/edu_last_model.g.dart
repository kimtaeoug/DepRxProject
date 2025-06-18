// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edu_last_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EduLastModelImpl _$$EduLastModelImplFromJson(Map<String, dynamic> json) =>
    _$EduLastModelImpl(
      remainEducationList: (json['remainEducationList'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EduLastModelImplToJson(_$EduLastModelImpl instance) =>
    <String, dynamic>{
      'remainEducationList': instance.remainEducationList,
    };
