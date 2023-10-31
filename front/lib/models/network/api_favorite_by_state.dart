import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/favorite_by_state_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiFAvoriteGetState extends ApiManager {
    String state ="";

  @override
  String apiUrl() {
    return AppApi.getFavoriteByStateUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return FavoriteGeByStatetJson.fromJson(data);
  }
}
