import 'package:core/core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

///
/// FCM handler
///
@pragma('vm:entry-point')
class FCMHandler {
  FCMHandler._();

  static Future<String?> getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }

  ///
  /// FCM & Notification Handler
  ///
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static void cancelAll() async {
    await _plugin.cancelAll();
  }

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance
    ..setForegroundNotificationPresentationOptions(alert: true);

  static const InitializationSettings _notiConfig = InitializationSettings(
      android: AndroidInitializationSettings("@drawable/splash"),
      iOS: DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      ));

  @pragma('vm:entry-point')
  static Future<void> initFCM(
      Future<void> Function(RemoteMessage) backgroundHandler,
      {bool isSham = false}) async {
    AndroidNotificationChannel channel = isSham ? shamChannel : defaultChannel;
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @pragma('vm:entry-point')
  static void startListenFcm(
      {required Function(dynamic data, String functionName) fcmFunctionHandler,
      bool isSham = false}) async {
    _appResumed(fcmFunctionHandler);
    _initializedPlugin(fcmFunctionHandler);
    _handingNoTouchOnForeground(fcmFunctionHandler, isSham: isSham);
    _processOnBackground(fcmFunctionHandler);
  }

  ///
  /// os : ios
  /// 상태 : Foreground
  /// when : app이 foregroun에 있을때 FCM이 날라왔을 때 callback
  ///
  @pragma('vm:entry-point')
  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Log.e('onDidReceiveLocalNotification is invoked');
  }

  ///
  /// 상태 : BackGroudn
  /// when : 앱이 백그라운드(꺼져있을 때 아님)에 있을떄 터치했을때
  ///
  @pragma('vm:entry-point')
  static void _processOnBackground(
      Function(dynamic data, String functionName) function) {
    FirebaseMessaging.onMessageOpenedApp.listen(((message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        function(message.data, 'processOnBackground');
      }
    }));
  }

  ///
  /// 앱 꺼져있다가 작동할
  ///
  @pragma('vm:entry-point')
  static void _appResumed(
      Function(dynamic data, String functionName) function) async {
    await _firebaseMessaging.getInitialMessage().then((value) {
      RemoteNotification? remote = value?.notification;
      if (remote != null) {
        function(value?.data, 'appResumed');
      }
    });
  }

  @pragma('vm:entry-point')
  static void _initializedPlugin(
      Function(dynamic data, String functionName) function) async {
    await _plugin.initialize(_notiConfig,
        onDidReceiveNotificationResponse: (response) {
      onDidReceiveNotificationResponse(response, function);
    });
  }

  ///
  /// Foreground 상태(앱이 열린 상태에서 받은 경우)
  ///
  @pragma('vm:entry-point')
  static void onDidReceiveNotificationResponse(NotificationResponse response,
      Function(dynamic data, String functionName) function) {
    function(response.payload, 'onDidReceiveNotificationResponse');
  }

  ///
  /// Foreground(터치 없을때)
  ///
  @pragma('vm:entry-point')
  static void _handingNoTouchOnForeground(
      Function(dynamic data, String functionName) function,
      {bool isSham = false}) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        function(message.data, 'handingNoTouchOnForeground');
        showNoti(notification.title ?? '', notification.body ?? '',
            notification.hashCode,
            isSham: isSham);
      }
    });
  }

  ///
  /// Show Notification
  ///
  @pragma('vm:entry-point')
  static void showNoti(String title, String body, int id,
      {String? payLoad, bool isSham = false}) async {
    AndroidNotificationChannel channel = isSham ? shamChannel : defaultChannel;
    await _plugin.show(
        id,
        title,
        body,
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                icon: "@drawable/splash",
                importance: Importance.max)),
        payload: payLoad);
  }

  ///
  /// DepRx
  ///
  static const String _defaultId = 'deprx_channel';
  static const String _defaultName = 'deprx_notification';
  static const AndroidNotificationChannel defaultChannel =
      AndroidNotificationChannel(_defaultId, _defaultName,
          importance: Importance.max, enableLights: true);

  ///
  /// Sham
  ///
  static const String _shamId = 'sham_channel';
  static const String _shamName = 'sham_notification';
  static const AndroidNotificationChannel shamChannel =
      AndroidNotificationChannel(_shamId, _shamName,
          importance: Importance.max, enableLights: true);

  static AndroidNotificationChannel getChannel({bool isSham = false}) =>
      isSham ? shamChannel : defaultChannel;
}
