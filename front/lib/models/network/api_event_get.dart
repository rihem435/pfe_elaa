import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/event_get_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiEventGet extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.getEventUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return EventGetJson.fromJson(data);
  }
}