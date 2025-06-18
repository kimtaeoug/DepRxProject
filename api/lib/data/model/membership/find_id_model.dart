import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_id_model.g.dart';
part 'find_id_model.freezed.dart';

@freezed
class FindIdModel with _$FindIdModel{
  const factory FindIdModel({
    @Default('') String id,
    @Default('') String socialsType
  }) = _FindIdModel;
  const FindIdModel._();
  factory FindIdModel.fromJson(Map<String, dynamic> json) => _$FindIdModelFromJson(json);
}