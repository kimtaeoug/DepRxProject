import 'package:flutter/services.dart';
import 'package:api/api.dart';

class PlistToJsonUtil {
  static const String _keyStartPattern = '<key>';
  static const String _keyEndPattern = '<key>';
  static const String _valueStartPattern = '<string>';
  static const String _valueEndPattern = '<string>';

  static Future<PlistModel> convertPlist(String filePath) async {
    Map<String, dynamic> map = {};
    String rawData = await rootBundle.loadString(filePath);
    String standardKey = '';
    for (String line in rawData.split('\n')) {
      if (line.startsWith(_keyStartPattern)) {
        String key = line
            .replaceAll(_keyStartPattern, '')
            .replaceAll(_keyEndPattern, '')
            .replaceAll(' ', '');
        standardKey = key;
      } else if (line.startsWith(_valueStartPattern)) {
        String value = line
            .replaceAll(_valueStartPattern, '')
            .replaceAll(_valueEndPattern, '')
            .replaceAll(' ', '');
        map[standardKey] = value;
      }
    }
    return PlistModel.fromJson(map);
  }
}
