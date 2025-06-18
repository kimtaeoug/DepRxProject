import 'package:freezed_annotation/freezed_annotation.dart';

import 'kbads_item_model.dart';


part 'kbads_model.g.dart';
part 'kbads_model.freezed.dart';

@freezed
class KbadsModel with _$KbadsModel{
  const factory KbadsModel({
    @Default(KbadsItemModel()) KbadsItemModel activation,
    @Default(KbadsItemModel()) KbadsItemModel aae,
    @Default(KbadsItemModel()) KbadsItemModel sl,
    @Default(KbadsItemModel()) KbadsItemModel jaal,
  }) = _KbadsModel;
  const KbadsModel._();
  factory KbadsModel.fromJson(Map<String, dynamic> json) => _$KbadsModelFromJson(json);
}