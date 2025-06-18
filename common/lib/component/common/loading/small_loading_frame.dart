import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:resource/resource_manager.dart';

class SmallLoadingFrame extends StatelessWidget {
  SmallLoadingFrame({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: _screenUtil.width,
            height: _screenUtil.height,
            color: DColors.black.withValues(alpha: 0.4),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    color: DColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Center(
                  child:
                      Resource.lottiAnimation('loading', width: 80, height: 40),
                ),
              ),
            ),
          ),
        ));
  }
}
