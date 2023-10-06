import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/event_by_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiEventGetById extends ApiManager {
  @override
  String id = '';

  String apiUrl() {
    return AppApi.getEventUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return EventByIdJson.fromJson(data);
  }
}
