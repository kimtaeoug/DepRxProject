import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../repositories/kbads/kbads_repository.dart';

///
/// UseCase with K-BADS
///
class KBADSUseCase {
  final KBADSRepository _repository;

  KBADSUseCase(this._repository);

  Future completeKBADS(List<int> valueList, int week, int round,
      {required Function() successFunction,
      required Function(dynamic) failFunction}) async {
    DefaultResponseModel response =
        await _repository.save(valueList, week, round);
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
