import 'package:flutter/services.dart';

///
/// 정규식 모음
///
class Regex {
  RegExp phoneRegex =
      RegExp(r'/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/');
  RegExp specialRegex = RegExp(r'[!@#$%^&*]+$');
  RegExp specialRegex2 = RegExp(r'[\W_]');
  RegExp enRegex = RegExp(r'[a-zA-Z]');
  RegExp numberRegex = RegExp(r'[0-9]');
  RegExp numberEnglishRegex = RegExp(r'[a-zA-Z0-9]');
  RegExp spaceRegex = RegExp(r'\s');
  RegExp koreanRegex = RegExp(r'^[가-힣ㄱ-ㅎㅏ-ㅣㆍᆢ]+$');

  RegExp englishNumberSpecialRegex = RegExp(r'[0-9a-zA-Z!@#$%^&*]');
  RegExp koreanEnglishNumberSpecialRegex = RegExp(r'[0-9a-zA-Zㄱ-ㅎ가-힣!@#$%^&*]');
  RegExp koreanNameRegex = RegExp(r'^[가-힣]');


  ///
  /// 한글 받침 유무
  ///
  bool checkAbsence(String input){
    int uni = input.codeUnitAt(0);
    return (uni - 44032) % 28 != 0;
  }
  ///
  /// name
  ///
  bool isValidName(String input) => koreanNameRegex.hasMatch(input);

  ///
  /// id
  ///
  bool isValidIdFormat(String input) => hasEn(input) && hasNumber(input);

  ///
  /// pwd
  ///
  bool hasSpecialCharacter(String input) => specialRegex2.hasMatch(input);

  bool hasEn(String input) => enRegex.hasMatch(input);

  bool hasNumber(String input) => numberRegex.hasMatch(input);

  bool isValidPwdFormat(String input) =>
      hasEn(input) && hasNumber(input) && hasSpecialCharacter(input);

  bool hasFinalConsonant(String word) {
    final finalConsonantRegex = RegExp(r'[\uAC00-\uD7A3][\u3131-\u314e]');
    return finalConsonantRegex.hasMatch(word);
  }
  
  ///
  /// Length
  ///
  bool checkLength(String input, {int min = 8, int max = 16}) =>
      input.length >= min && input.length <= max;

  ///
  /// YouTube
  ///

  RegExp youtubeRegex = RegExp(r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/|live\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*', caseSensitive: false, multiLine: false);

  ///
  /// TextInputFormatter
  ///
  late final TextInputFormatter numberEnglishFormatter =
      FilteringTextInputFormatter(numberEnglishRegex, allow: true);
  late final TextInputFormatter noSpaceFormatter =
      FilteringTextInputFormatter.deny(spaceRegex);
  late final TextInputFormatter specialFormatter =
      FilteringTextInputFormatter(specialRegex, allow: true);
  late final TextInputFormatter numberEnglishSpecialFormatter =
      FilteringTextInputFormatter.allow(englishNumberSpecialRegex);
  late final TextInputFormatter koreanFormatter = FilteringTextInputFormatter.allow(koreanRegex);
}
