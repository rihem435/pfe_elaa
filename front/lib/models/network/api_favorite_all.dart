import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/favorite_all_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiFavoriteAll extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.getFavoriteAll;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return FavoriteAllJson.fromJson(data);
  }
}
