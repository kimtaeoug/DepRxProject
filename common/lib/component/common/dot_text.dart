import 'package:flutter/cupertino.dart';

class DotText extends StatelessWidget {
  final List<String> textList;
  final TextStyle defaultStyle;

  const DotText(
      {super.key, required this.textList, required this.defaultStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(textList.length, (idx) {
        String text = textList[idx];
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ' · ',
              style: defaultStyle,
            ),
            Expanded(
                child: Text(
              text,
              style: defaultStyle,
            ))
          ],
        );
      }),
    );
  }
}
