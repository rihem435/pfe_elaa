
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/guest_get_by_id.dart';
import 'package:front/models/network/api_manager.dart';

class ApiGuestGetById extends ApiManager {
  String id ="";
  @override
  String apiUrl() {
    return AppApi.getGuestsUrl+id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GuestGetByIdJson.fromJson(data);
  }
}