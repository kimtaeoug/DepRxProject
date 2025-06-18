import 'package:flutter/cupertino.dart';

class DpStrongText extends StatelessWidget {
  final List<String> textList;
  final List<String> strongList;
  final TextStyle defaultStyle;
  final TextStyle strongStyle;

  const DpStrongText({super.key,
    required this.textList,
    required this.strongList,
    required this.defaultStyle,
    required this.strongStyle});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> dataList = [];
    if (strongList.isEmpty) {
      dataList =
          textList.map((e) => TextSpan(text: e, style: defaultStyle)).toList();
    } else if (strongList.length == 1) {
      List<TextSpan> result = [];
      for (String text in textList) {
        result.addAll(spanList(text));
      }
      dataList = result;
    } else {
      dataList = [TextSpan(children: splitText())];
    }
    return Text.rich(
        TextSpan(children: dataList)); // List<TextSpan> dataList = [];

  }

  //가장 앞에 있을 때
  List<TextSpan> spanList(String input) {
    List<TextSpan> result = [];
    String strong = strongList.first;
    int startIdx = input.indexOf(strong);
    int endIdx = startIdx + strong.length;
    result.add(
        TextSpan(text: input.substring(0, startIdx), style: defaultStyle));
    result.add(
        TextSpan(text: input.substring(startIdx, endIdx), style: strongStyle));
    result.add(TextSpan(text: input.substring(endIdx), style: defaultStyle));
    return result;
  }

  List<TextSpan> splitText() {
    Map<int, List<_StrongText>> convertMap = {};
    for (int idx = 0; idx < textList.length; idx++) {
      String text = textList[idx];
      for (String strong in strongList) {
        if (text.contains(strong)) {
          int startIdx = text.indexOf(strong);
          int endIdx = startIdx + strong.length;
          if (convertMap[idx] == null) {
            convertMap[idx] = [_StrongText(startIdx, endIdx)];
          } else {
            convertMap[idx]?.add(_StrongText(startIdx, endIdx));
          }
        }
      }
    }
    List<TextSpan> result = [];
    for (int idx = 0; idx < textList.length; idx++) {
      String text = textList[idx];
      if (convertMap.keys.contains(idx)) {
        List<_StrongText> strong = convertMap[idx] ?? [];
        int beforeStartIdx = 0;
        int beforeEndIdx = 0;
        for (int j = 0; j < strong.length; j ++) {
          _StrongText strongItem = strong[j];
          int startIdx = strongItem.startIdx;
          int endIdx = strongItem.endIdx;
          if (j == 0) {
            beforeStartIdx = startIdx;
            beforeEndIdx = endIdx;
            result.add(TextSpan(
                text: text.substring(0, startIdx), style: defaultStyle));
            result.add(TextSpan(
                text: text.substring(startIdx, endIdx), style: strongStyle));
          } else {
            result.add(TextSpan(text: text.substring(beforeEndIdx, startIdx),
                style: defaultStyle));
            result.add(TextSpan(
                text: text.substring(startIdx, endIdx), style: strongStyle));
            if (j == strong.length - 1) {
              result.add(
                  TextSpan(text: text.substring(endIdx), style: defaultStyle));
            }
            beforeStartIdx = startIdx;
            beforeEndIdx = endIdx;
          }
        }
      } else {
        result.add(TextSpan(text: text, style: defaultStyle));
      }
    }
    return result;
  }
}

///
/// place 0-> front, 1 -> center, 2->last
///
class _StrongText {
  int startIdx;
  int endIdx;

  _StrongText(this.startIdx, this.endIdx);
}
