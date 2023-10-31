import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/event_delete_json.dart';
import 'package:front/models/json/guest_delete_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiGuestDeleteById extends ApiManager {
    String id = '';

  @override
  String apiUrl() {
    return AppApi.deleteGuestUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GuestDeleteJson.fromJson(data);
  }
}
