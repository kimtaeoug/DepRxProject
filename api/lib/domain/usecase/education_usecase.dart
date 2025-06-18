import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/library/edu_last_model.dart';
import '../repositories/education/education_repository.dart';

///
/// UseCase with Education
///
class EducationUseCase {
  final EducationRepository _repository;

  EducationUseCase(this._repository);

  Future completeEducation(int eduWeek,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.complete(eduWeek);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future getLastEducation(
      {required Function(EduLastModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.getLastEdu();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(EduLastModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(e);
    }
  }
}
