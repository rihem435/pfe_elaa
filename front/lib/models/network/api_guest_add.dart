
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/guest_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiGuestCreate extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.createGuestUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return GuestJson.fromJson(data);
    
  }
}