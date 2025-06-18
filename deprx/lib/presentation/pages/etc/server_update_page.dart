import 'package:common/common.dart';
import 'package:core/config/routes.dart';
import 'package:core/utils/time_detector_util.dart';
import 'package:deprx/core/service/procedure_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/colors.dart';

class ServerUpdatePage extends StatefulWidget {
  final Function()? function = Get.arguments?['function'] as Function()?;

  ServerUpdatePage({super.key});

  @override
  State<StatefulWidget> createState() => _ServerUpdatePage();
}

class _ServerUpdatePage extends State<ServerUpdatePage> {
  final TimeDetectorUtil _timeDetectorUtil = TimeDetectorUtil();
  final ProcedureService _service = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timeDetectorUtil.setLandingPage(true);
      _service.checkServerUpdate();
    });
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: Obx(() {
            RxBool loading = _service.serverUpdateLoading;
            return ServerUpdateLoadingFrame(
              doneFunction: () {
                if (widget.function != null) {
                  widget.function?.call();
                } else {
                  Get.offAllNamed(Routes.socialLogin);
                }
              },
              isLoading: loading.value,
            );
          }),
        ));
  }
}
