import 'package:api/data/model/attendance/sham_attendance_model.dart';

import '../../data/model/attendance/attendance_model.dart';
import '../../data/model/default_response_model.dart';
import '../repositories/attendance/attended_repository.dart';
import 'package:core/core.dart';

///
/// UseCase with Attendance
///
class AttendanceUseCase {
  final AttendedRepository _repository;

  AttendanceUseCase(this._repository);

  Future attended(
      {required Function(AttendanceModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.attended();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(AttendanceModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future shamAttended(
      {required Function(ShamAttendanceModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.attended();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ShamAttendanceModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }
}
