enum SocialLoginType { login, logout, closeConnection, profile, reagree }

extension SocialTypeExtension on SocialLoginType {
  String get method => name;
}
