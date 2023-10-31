import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/favorite_by_user_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiFavoriteGetByUserId extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return AppApi.getFavoriteByUserIdUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return FavoriteByUserIdJson.fromJson(data);
  }
}
