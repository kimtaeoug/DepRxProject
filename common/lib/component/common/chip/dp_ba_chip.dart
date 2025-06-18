import 'package:flutter/cupertino.dart';
import 'package:core/core.dart';
class DPBAChip extends StatelessWidget {
  final String category;

  DPBAChip({Key? key,required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BAType type = BaTypeStyle.getBAType(category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
          color: type.color.withValues(alpha : 0.1),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Text(
        category,
        style: type.style,
      ),
    );
  }
}
