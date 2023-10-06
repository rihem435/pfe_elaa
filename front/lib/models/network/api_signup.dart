import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/user_get_id.dart';
import 'package:front/models/network/api_manager.dart';

class ApiSignup extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.signupUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data======================> $data');
    return UserGetByIdJson.fromJson(data);
  }
}
