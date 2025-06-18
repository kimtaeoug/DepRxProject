import 'package:common/common.dart';
import 'package:core/config/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/colors.dart';

class ServerUpdatePage extends StatelessWidget {
  final Function()? function = Get.arguments?['function'] as Function()?;

  ServerUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: ServerUpdateLoadingFrame(doneFunction: () {
            if (function != null) {
              function?.call();
            } else {
              Get.offAllNamed(Routes.socialLogin);
            }
          }),
        ));
  }
}
