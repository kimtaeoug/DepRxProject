import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

class ContinuousEduPage extends StatefulWidget {
  final int? week = Get.arguments?['week'] as int?;

  ContinuousEduPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContinuousEduPage();
}

class _ContinuousEduPage extends State<ContinuousEduPage> {
  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.continuousEdu, isDeprx: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (_, __) {},
        child: Scaffold(
          backgroundColor: DColors.white,
          body: EduContinuousFrame(
              week: widget.week ?? 1,
              moveFunction: () {
                Get.offNamed(Routes.educationPage);
              }),
        ));
  }
}
