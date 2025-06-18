import 'package:core/core.dart';
import '../../data/model/default_response_model.dart';
import '../../data/model/sdui/sdui_model.dart';
import '../repositories/sdui/sdui_repository.dart';

///
/// UseCase with SDUI
///
class SDUIUseCase{
  final SDUIRepository _repository;
  SDUIUseCase(this._repository);


  Future getSDUI(List<String> interestList)async{
    DefaultResponseModel response = await _repository.getSDUI(interestList);
    try {
      if(response.errorCode == SUCCESS_CODE){
        return SDUIModel.fromJson(response.data);
      }else{
        throw Exception(response);
      }
    } catch (e) {
      return response;
    }
  }
}