import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/event_by_id_json.dart';
import 'package:front/models/json/favorite_by_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiFAvoriteGetById extends ApiManager {
    String id = '';

  @override
  String apiUrl() {
    return AppApi.createFavoriteUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return FavoriteByIdJson.fromJson(data);
  }
}
