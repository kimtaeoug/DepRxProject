import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

///
/// Log 관련 util
///
class Log {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(), filter: _LogFilter()
          // filter: LogFilter()
          // output: LogOutput()
          );

  static void e(dynamic msg) {
    if (kDebugMode) {
      _logger.e(msg);
    }
  }

  static void i(dynamic msg) {
    if (kDebugMode) {
      _logger.i(msg);
    }
  }

  static void d(dynamic msg) {
    if (kDebugMode) {
      _logger.d(msg);
    }
  }

  static void w(dynamic msg) {
    if (kDebugMode) {
      _logger.w(msg);
    }
  }
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
