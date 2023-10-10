import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/categorie_get_by_id_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiCategoriesGetById extends ApiManager {
  String id ="";
  @override
  String apiUrl() {
    return AppApi.getCategoriesUrl+id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return CategorieGetByIdJson.fromJson(data);
  }
}
