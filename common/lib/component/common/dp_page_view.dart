import 'package:flutter/cupertino.dart';

class DpPageView extends StatelessWidget {
  final PageController controller;
  final int length;
  final Function(int) onPageChanged;
  final Widget? Function(BuildContext, int) itemBuilder;

  const DpPageView(
      {super.key,
      required this.controller,
      required this.length,
      required this.onPageChanged,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        pageSnapping: false,
        itemCount: length,
        onPageChanged: onPageChanged,
        itemBuilder: itemBuilder);
  }
}
