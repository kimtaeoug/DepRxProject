// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinalRewardModelImpl _$$FinalRewardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FinalRewardModelImpl(
      header: json['header'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      contents: json['contents'] as String? ?? '',
      date: json['date'] as String? ?? '',
      why: json['why'] as String? ?? '',
      rewardList: (json['rewardList'] as List<dynamic>?)
              ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FinalRewardModelImplToJson(
        _$FinalRewardModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'imagePath': instance.imagePath,
      'contents': instance.contents,
      'date': instance.date,
      'why': instance.why,
      'rewardList': instance.rewardList,
    };
