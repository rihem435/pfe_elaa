
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/guest_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiGuestsGet extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.getGuestsUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GuestGetAllJson.fromJson(data);
  }
}