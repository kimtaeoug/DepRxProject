import 'package:flutter/cupertino.dart';

import 'package:resource/resource_manager.dart';
import '../../common/animation/dp_skeleton_container.dart';

class StepperSkeleton extends StatelessWidget {
  StepperSkeleton({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: DColors.bgLightGray),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _rectangle(_screenUtil.width),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(8, (idx) => _step(isLast: idx == 7)),
          )
        ],
      ),
    );
  }

  Widget _step({bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: isLast ? 20 : 0),
      child: SizedBox(
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _circle(),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [_rectangle(44), _rectangle(53)],
                ),
                const SizedBox(
                  height: 4,
                ),
                _rectangle(147)
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _circle() => DPSkeletonContainer(
        width: 50,
        height: 50,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      );

  Widget _rectangle(double width) => DPSkeletonContainer(
        width: width,
        height: 24,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      );
}
