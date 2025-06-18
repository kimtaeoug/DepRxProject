import 'package:flutter/cupertino.dart';

import 'package:core/core.dart';
import 'package:resource/resource_manager.dart';

class SocialItem extends StatelessWidget {
  final SocialType type;
  final Function() function;

  SocialItem({super.key, required this.type, required this.function});

  final ScreenUtil _screenUtil = ScreenUtil();
  final double _margin = 24;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _margin),
        child: Container(
          width: _screenUtil.width - _margin * 2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: type.color),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Resource.icon(type.imgPath, width: 16, height: 16),
              const SizedBox(
                width: 16,
              ),
              Text(
                type.title,
                style: type.textStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
