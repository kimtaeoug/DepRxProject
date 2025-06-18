import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  final SplashController _controller = Get.find();
  final PermissionUtil permissionUtil = PermissionUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.splash);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: DColors.transparent,
        statusBarIconBrightness: Brightness.dark));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _controller.init();
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: Center(
            child: SizedBox(
              width: 60,
              child: Resource.image('ic_logo', boxFit: BoxFit.fitWidth),
            ),
          ),
        ));
  }
}
