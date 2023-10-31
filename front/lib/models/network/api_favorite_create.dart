
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/favorite__create_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiFavoriteCreate extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.createFavoriteUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return FavoriteCreateJson.fromJson(data);
    
  }
}