import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';

class DPToggle extends StatelessWidget {
  final Function() function;
  final bool isLeft;

  const DPToggle({super.key, required this.function, this.isLeft = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        width: 44,
        height: 26,
        child: Stack(
          children: [
            AnimatedContainer(
              width: 44,
              height: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isLeft
                      ? DColors.inInactiveColor2
                      : DColors.primaryNormalColor),
              duration: ScreenUtil().duration300,
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: AnimatedAlign(
                alignment:
                    isLeft ? Alignment.centerLeft : Alignment.centerRight,
                duration: ScreenUtil().duration300,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: DColors.white,
                      boxShadow: [
                        BoxShadow(
                            color: DColors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 2))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
