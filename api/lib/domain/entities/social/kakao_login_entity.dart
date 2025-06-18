import 'package:freezed_annotation/freezed_annotation.dart';

part 'kakao_login_entity.g.dart';

part 'kakao_login_entity.freezed.dart';

@freezed
class KakaoLoginEntity with _$KakaoLoginEntity {
  const factory KakaoLoginEntity({@Default('') String userId}) =
      _KakaoLoginEntity;

  const KakaoLoginEntity._();

  factory KakaoLoginEntity.fromJson(Map<String, dynamic> json) =>
      _$KakaoLoginEntityFromJson(json);

  factory KakaoLoginEntity.fromObjectJson(Map<Object?, Object?> json) {
    Map<String, dynamic> converted = {};
    for (Object? object in json.keys) {
      if (object == 'userId') {
        converted['userId'] = json['userId'];
      }
    }
    return KakaoLoginEntity.fromJson(converted);
  }
}
