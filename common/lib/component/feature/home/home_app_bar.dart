import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: _screenUtil.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Resource.image('ic_logo', height: 21, boxFit: BoxFit.fitHeight),
              const SizedBox(
                width: 8.5,
              ),
              SizedBox(
                height: 21,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Resource.icon('ic_logo_title',
                      height: 21, boxFit: BoxFit.fitHeight),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
