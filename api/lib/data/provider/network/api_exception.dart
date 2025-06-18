import '../../../api_core/api_error_type.dart';

///
/// API Exception 처리용
///
class AppException implements Exception {
  final dynamic code;
  final dynamic message;
  final dynamic details;

  AppException({this.code, this.message, this.details});
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: APIErrorType.badRequest.name,
          message: APIErrorType.badRequest.message,
          details: details,
        );
}

class ForbiddenException extends AppException {
  ForbiddenException(String? details)
      : super(
          code: APIErrorType.forbidden.name,
          message: APIErrorType.forbidden.message,
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: APIErrorType.unauthorised.name,
          message: APIErrorType.unauthorised.message,
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: APIErrorType.timeout.name,
          message: APIErrorType.timeout.message,
          details: details,
        );
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: APIErrorType.fetchData.name,
          message: APIErrorType.fetchData.message,
          details: details,
        );
}

class UnknownException extends AppException {
  UnknownException(String? details)
      : super(
          code: APIErrorType.unknown.name,
          message: APIErrorType.unknown.message,
          details: details,
        );
}
