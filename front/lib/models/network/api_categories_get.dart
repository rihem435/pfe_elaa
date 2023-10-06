import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/categories_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiCategoriesGet extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.getCategoriesUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return CategorieJson.fromJson(data);
  }
}
