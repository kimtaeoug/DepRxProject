import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';


class CloseAppBar extends StatelessWidget {
  CloseAppBar({super.key});
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _screenUtil.topPadding),
      child: SizedBox(
        width: _screenUtil.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                width: 36,
                height: 36,
                child: Center(
                  child: Resource.icon('ic_close', width: 28, height: 28),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
