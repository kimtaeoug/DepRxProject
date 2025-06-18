import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class TermDetailPage extends StatelessWidget {
  final TermModel type = Get.arguments!['term'] as TermModel;

  TermDetailPage({super.key});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h5.style.copyWith(color: DColors.black);
  final TextStyle _contentsStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.black);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvokedWithResult: (value, _) {
          // if(value){
          //   Get.back();
          // }
        },
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CloseAppBar(),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                type.title,
                                style: _titleStyle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              '\n\n${type.contents}',
                              style: _contentsStyle,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
