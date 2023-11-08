import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/guest_by_event_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiGuestsGetByEventId extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    print('url list guest===> ${AppApi.getGuestsByEventIdUrl + id}');
    return AppApi.getGuestsByEventIdUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    return GuestByEventIdJson.fromJson(data);
  }
}
