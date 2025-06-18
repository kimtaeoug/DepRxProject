import 'package:flutter/cupertino.dart';

import '../regex/regex.dart';

///
/// UI Util for DepRx
///

class UIUtil{
  static Size textSize(String text, TextStyle style,
      {double? maxWidth, int? maxLines}) {
    final TextPainter painter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines ?? 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth ?? double.infinity);
    return painter.size;
  }

  static Size? widgetSize(GlobalKey key) {
    if (key.currentContext != null) {
      return (key.currentContext!.findRenderObject() as RenderBox).size;
    }
    return null;
  }

  static Offset? widgetPosition(GlobalKey key) {
    if (key.currentContext != null) {
      return (key.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    }
    return null;
  }

  static bool isTextOverflow(
      String text,
      TextStyle style,
      double textScaleFactor, {
        double minWidth = 0,
        double maxWidth = double.infinity,
      }) {
    return (TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: null,
        textDirection: TextDirection.ltr,
        textScaleFactor: textScaleFactor)
      ..layout(minWidth: minWidth, maxWidth: maxWidth))
        .didExceedMaxLines;
  }

  static bool keyboardOpen() =>
      WidgetsBinding.instance.window.viewInsets.bottom > 0;

  static closeKeyBoard() {
    if(FocusManager.instance.primaryFocus?.hasFocus == true){
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static String makeAcceptText(String input, {String? subFix}){
    String last = input.split('').last;
    return '$input${Regex().checkAbsence(last) ? '을' : '를'} ${subFix ?? '받았어요!'}';
  }
}