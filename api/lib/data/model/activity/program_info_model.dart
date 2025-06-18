import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_info_model.g.dart';
part 'program_info_model.freezed.dart';

@freezed
class ProgramInfoModel with _$ProgramInfoModel{
  const factory ProgramInfoModel({
    @Default('') String startDate,
    @Default('') String endDate
  }) = _ProgramInfoModel;
  const ProgramInfoModel._();
  factory ProgramInfoModel.fromJson(Map<String, dynamic> json) => _$ProgramInfoModelFromJson(json);
}