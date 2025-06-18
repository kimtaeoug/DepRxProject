import 'package:freezed_annotation/freezed_annotation.dart';

part 'ga_alpha_data_model.g.dart';

part 'ga_alpha_data_model.freezed.dart';

@freezed
class GAAlphaDataModel with _$GAAlphaDataModel {
  const factory GAAlphaDataModel({
    @Default('') String user_id,
    @Default('') String gender,
    @Default('') String birth_year,
    @Default('') String household_size,
    @Default('') String marital_status,
    @Default('') String has_children,
    @Default('') String relationship_status,
    @Default('') String group_activity_count,
    @Default('') String social_interaction_frequency,
    @Default('') String interest,
    @Default('') String sleep_duration,
    @Default('') String favorite_activity,
    @Default('') String religion,
    @Default('') String interest_field,
    @Default('') String occupation,
    @Default('') String volunteer_groups,
    @Default('') String volunteer_frequency,
    @Default('') String personality,
    @Default('') String hobby,
    @Default('') String residence_area,
    @Default('') String housing_type,
    @Default('') String pet,
    @Default('') String exercise_frequency,
    @Default('') String exercise_intensity,
    @Default('') String exercise_duration,
    @Default('') String height,
    @Default('') String weight,
    @Default('') String smoking_status,
    @Default('') String alcohol_consumption,
    @Default('') String alcohol_intake,
    @Default('') String breakfast_frequency,
    @Default('') String medical_condition,
    @Default('') String keyword,
  }) = _GAAlphaDataModel;

  const GAAlphaDataModel._();

  factory GAAlphaDataModel.fromJson(Map<String, dynamic> json) =>
      _$GAAlphaDataModelFromJson(json);
}
