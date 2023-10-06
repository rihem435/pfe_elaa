
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/product_get_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiProductsGet extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.getProductsUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return ProductGetJson.fromJson(data);
  }
}