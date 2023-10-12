import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/guest_by_user_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiGuestsGetByUserId extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return AppApi.getGuestsByUserIdUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GuestByUserIdJson.fromJson(data);
  }
}
