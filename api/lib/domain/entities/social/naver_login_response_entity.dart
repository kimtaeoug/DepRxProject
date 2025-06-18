import 'package:freezed_annotation/freezed_annotation.dart';

part 'naver_login_response_entity.g.dart';

part 'naver_login_response_entity.freezed.dart';

@freezed
class NaverLoginResponseEntity with _$NaverLoginResponseEntity {
  const factory NaverLoginResponseEntity(
      {@Default('') String code,
      @Default('') String message,
      @Default('') String response}) = _NaverLoginResponseEntity;

  const NaverLoginResponseEntity._();

  factory NaverLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$NaverLoginResponseEntityFromJson(json);

  factory NaverLoginResponseEntity.fromObjectJson(Map<Object?, Object?> json) {
    Map<String, dynamic> converted = {};
    for (Object? object in json.keys) {
      if (object == 'response') {
        converted['response'] = json['response'];
      } else if (object == 'message') {
        converted['message'] = json['message'];
      } else if (object == 'code') {
        converted['code'] = json['code'];
      }
    }
    return NaverLoginResponseEntity.fromJson(converted);
  }
}
