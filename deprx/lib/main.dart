import 'dart:async';
import 'dart:ui';
import 'package:core/utils/sentry_option_util.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
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

@pragma('vm:entry-point')
void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    ServiceUtil.initUtilBeforeRun();
    final KeyConfiguration configuration = KeyConfiguration();
    await configuration.init(isDebugMode: kDebugMode);
    FirebaseOptions options = await FirebaseOptionUtil.getOption(configuration);
    if (!kDebugMode) {
      SentryOptionUtil();
      SentryUtil.init(configuration);
    }
    await Firebase.initializeApp(options: options, name: '~~~~~~~~');
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Dependency.init();
    await ServiceUtil.initService();
    await FCMHandler.initFCM(backgroundHandler);
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
          bundle: SentryUtil.bundle, child: const DepRxApp()));
    } else {
      runApp(const DepRxApp());
    }
  }, (e, s) async {
    if(!kDebugMode){
      SentryUtil.catchUnExpectedError(e, s);
    }
  });
}

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  FcmHandlerService.sendDataToIsolate(message.data, 'backgroundHandler');
}

class DepRxApp extends StatefulWidget {
  const DepRxApp({super.key});

  @override
  State<StatefulWidget> createState() => _DepRxApp();
}

class _DepRxApp extends State<DepRxApp> with WidgetsBindingObserver {
  @override
  void initState() {
    DeprxLifeCycleHandler();
    ToastHandler();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ServiceUtil.initUtilWithContext(context);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      DeprxLifeCycleHandler().process(state);

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
      navigatorObservers: [NaviObserver(), SentryUtil.observer],
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
