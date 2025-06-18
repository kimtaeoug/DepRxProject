import 'package:api/api.dart';
import 'package:core/core.dart';
import 'package:core/utils/sentry_option_util.dart';
import 'package:encryption/encryption.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

///
/// Sentry
///
class SentryUtil {
  static void init(KeyConfiguration configuration) async {
    await SentryFlutter.init(
          (options) {
        options.dsn = configuration.sentryKey;
        options.anrEnabled = true;
        options.sampleRate = 1;
        options.tracesSampleRate = 1;
        options.profilesSampleRate = 1;
        options.experimental.replay.sessionSampleRate = 1.0;
        options.experimental.replay.onErrorSampleRate = 1.0;
        options.addIntegration(LoggingIntegration());
      },
    );
  }

  static SentryAssetBundle get bundle => SentryAssetBundle();

  static SentryNavigatorObserver get observer => SentryNavigatorObserver();

  static void captureExceptionWithSentry(Object e, StackTrace s) async {
    if (kDebugMode) {
      Log.e('Error : $e\nStackTrace : $s');
    } else {
      await Sentry.captureException(e, stackTrace: s);
    }
  }

  static void captureExceptionWithSentryTag(Map<String, dynamic> tag, Object e,
      StackTrace s,
      {String? id, SentryLevel? level}) async {
    if (kDebugMode) {
      Log.e('Error : $e\nStackTrace : $s');
    } else {
      await Sentry.captureException(e, stackTrace: s, withScope: (scope) {
        scope.setUser(SentryUser(id: id));
        for (String key in tag.keys) {
          dynamic value = tag[key];
          if (value != null) {
            scope.setTag(key, value);
          }
        }
        scope.level = level ?? SentryLevel.error;
      });
    }
  }

  static void _trackAPIError({required EndPointType type,
    required Object e,
    required StackTrace s,
    required String statusCode,
    String? id}) async {
    SentryUtil.captureExceptionWithSentryTag(
        SentryOptionUtil().checkServiceOfRoute(type, statusCode).toJson(), e, s,
        id: id, level: SentryLevel.error);
  }

  static void trackAPIError({required DefaultResponseModel input,
    required Object e,
    required StackTrace s,
    String? id}) {
    if (input.data is APIRequestRepresentable) {
      _trackAPIError(
          type: input.data.type,
          e: e,
          s: s,
          statusCode: input.errorCode,
          id: id);
    } else {
      captureExceptionWithSentry(
        e,
        s,
      );
    }
  }

  static void catchUnExpectedError(Object e, StackTrace s, {String? id}) async {
    if (!kDebugMode) {
      await Sentry.captureException(e, stackTrace: s, withScope: (scope) {
        scope.setUser(SentryUser(id: id));
        scope.setTag('ErrorType', 'Unexpected');
      });
    } else {
      Log.e('Error : $e, StackTrace : $s');
    }
  }
}
