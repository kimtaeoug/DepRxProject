
import '../regex/regex.dart';

class VideoUtil{
  static String? getIdFromYoutube(String input){
    return Regex().youtubeRegex.firstMatch(input)?.group(1);
  }
  static String getYoutubeThumbNail(String videoId){
    return 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';
  }
}