import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/inspection/bdi_result_model.dart';
import '../../data/model/procedure/procedure_model.dart';
import '../repositories/bdi/bdi_repository.dart';

///
/// UseCase with BDI
///
class BDIUseCase {
  final BDIRepository _repository;

  BDIUseCase(this._repository);

  Future autoComplete(
      {required Function(ProcedureModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.autoComplete();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(ProcedureModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future bdiResult(
      {required Function(BDIResultModel) successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.bdiResult();
    try {
      if (response.errorCode == SUCCESS_CODE) {
        successFunction(BDIResultModel.fromJson(response.data));
      } else {
        throw Exception(response);
      }
    } catch (e) {
      failFunction(response);
    }
  }

  Future saveBDI(List<int> bdiList) async {
    DefaultResponseModel response = await _repository.saveBDI(bdiList);
    try {
      if (response.errorCode == SUCCESS_CODE) {
        return true;
      } else {
        return response;
      }
    } catch (e) {
      return response;
    }
  }

  Future waitBDI(
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.waitBDI();
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

  Future startProgram(
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response = await _repository.startProgram();
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
}
