import 'package:freezed_annotation/freezed_annotation.dart';

import 'alpha_data_entity.dart';
import 'tov_list_entity.dart';

part 'additional_data_entity.g.dart';

part 'additional_data_entity.freezed.dart';

@freezed
class AdditionalDataEntity with _$AdditionalDataEntity {
  const factory AdditionalDataEntity(
          {@Default([]) List<TOVListEntity> tovList,
          @Default(AlphaDataEntity()) AlphaDataEntity alphaData}) =
      _AdditionalDataEntity;

  const AdditionalDataEntity._();

  factory AdditionalDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AdditionalDataEntityFromJson(json);
}
