
import '../../domain/repositories/education/education_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/etc_api.dart';

///
/// Repository with Education
///
class EducationRepositoryImpl extends EducationRepository {
  @override
  Future<DefaultResponseModel> complete(int eduWeek) async {
    return await ETCAPI.education({'eduWeek': eduWeek}).request();
  }

  @override
  Future<DefaultResponseModel> getLastEdu() async {
    return await ETCAPI.getLastEdu(null).request();
  }
}
