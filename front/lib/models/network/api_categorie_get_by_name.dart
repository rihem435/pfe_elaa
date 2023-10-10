
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/categorie_get_by_name_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiCategoriesGetByName extends ApiManager {
  String name ="";
  @override
  String apiUrl() {
    return AppApi.getCategorieByNameUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return CategorieGetByNameJson.fromJson(data);
  }
}
