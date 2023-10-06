
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/product_add_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiProductAdd extends ApiManager {
  @override
  String apiUrl() {
    return AppApi.createProductsUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return ProductAddJson.fromJson(data);
    
  }
}