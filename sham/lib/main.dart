import 'dart:async';
import 'package:core/utils/sentry_option_util.dart';
import 'package:encryption/key_configuration.dart';
import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/dependency.dart';
import 'core/pages.dart';
import 'core/service/fcm_handler_service.dart';
import 'core/service/procedure_service.dart';
import 'core/service/service_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'core/sham_life_cycle_handler.dart';

@pragma('vm:entry-point')
void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final KeyConfiguration configuration = KeyConfiguration();
    await configuration.init(isDebugMode: kDebugMode, isSham: true);
    ServiceUtil.initUtilBeforeRun();
    if (!kDebugMode) {
      SentryOptionUtil();
      SentryUtil.init(configuration);
    }
    await Firebase.initializeApp(
        options:
            await FirebaseOptionUtil.getOption(configuration, isSham: true),
        name: '~~~~~~~');
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Dependency.init();
    await ServiceUtil.initService();
    await FCMHandler.initFCM(backgroundHandler, isSham: true);
    FCMHandler.startListenFcm(
        fcmFunctionHandler: FcmHandlerService.sendDataToIsolate);
    TimeDetectorUtil().setRefreshMoveFunction(refreshFunction: () {
      ProcedureService service = Get.find();
      service.checkServerUpdate();
    }, moveFunction: () {
      ProcedureService service = Get.find();
      service.moveInRefresh();
    });
    if (!kDebugMode) {
      runApp(DefaultAssetBundle(
          bundle: SentryUtil.bundle, child: const ShamApp()));
    } else {
      runApp(const ShamApp());
    }
  }, (e, s) async {
    if(!kDebugMode){
      SentryUtil.catchUnExpectedError(e, s);
    }
  });
}

///
/// Notification(백그라운드에 있을때(꺼졌을때 아님))
///
@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  //ntoofication
  RemoteNotification? notification = message.notification;
  String? title = notification?.title;
  String? body = notification?.body;
  FcmHandlerService.sendDataToIsolate(message.data, 'backgroundHandler');
}

class ShamApp extends StatefulWidget {
  const ShamApp({super.key});

  @override
  State<StatefulWidget> createState() => _ShamApp();
}

class _ShamApp extends State<ShamApp> with WidgetsBindingObserver{
  @override
  void initState() {
    ShamLifeCycleHandler();
    ToastHandler();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ServiceUtil.initUtilWithContext(context);
    });
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      ShamLifeCycleHandler().process(state);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routingCallback: (route) {
        RoutingCallBackHandler(routing: route);
      },
      navigatorKey: Get.find<ProcedureService>().contextKey,
      navigatorObservers:
          kDebugMode ? [NaviObserver()] : [NaviObserver(), SentryUtil.observer],
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      themeMode: ThemeMode.light,
      getPages: Pages.list,
      locale: const Locale('ko'),
      supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: child!),
      initialRoute: Routes.splash,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      theme: ThemeData.light(),
      darkTheme: ThemeData.light(),
    );
  }
}
