import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/event_delete_json.dart';
import 'package:front/models/json/favorite_delete_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiFavoriteDeleteById extends ApiManager {
    String id = '';

  @override
  String apiUrl() {
    return AppApi.deleteFavoriteUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return FavoriteDeleteJson.fromJson(data);
  }
}
