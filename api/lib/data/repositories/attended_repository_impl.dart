import '../../domain/repositories/attendance/attended_repository.dart';
import '../model/default_response_model.dart';
import '../provider/api/etc_api.dart';

///
/// Repository with Attennded
///
class AttendedRepositoryImpl extends AttendedRepository {
  @override
  Future<DefaultResponseModel> attended() async {
    return await ETCAPI.attendance(null).request();
  }
}
