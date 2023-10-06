import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/login_user_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiLoginn extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.loginUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return LoginUserJson.fromJson(data);
  }
}
