import 'package:freezed_annotation/freezed_annotation.dart';

part 'naver_login_response_item_entity.g.dart';
part 'naver_login_response_item_entity.freezed.dart';

@freezed
class NaverLoginResponseItemEntity with _$NaverLoginResponseItemEntity {
  const factory NaverLoginResponseItemEntity({@Default('') String id}) =
      _NaverLoginResponseItemEntity;

  const NaverLoginResponseItemEntity._();

  factory NaverLoginResponseItemEntity.fromJson(Map<String, dynamic> json) =>
      _$NaverLoginResponseItemEntityFromJson(json);

  factory NaverLoginResponseItemEntity.fromRawString(String input){
    String converted = input.replaceAll('{id=', '').replaceAll('}', '');
    return NaverLoginResponseItemEntity(id: converted);
  }
}
