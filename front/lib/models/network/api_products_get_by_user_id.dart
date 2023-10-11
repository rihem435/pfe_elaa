import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/product_by_user_is_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiProductsGetByUserId extends ApiManager {
    String id = "";

  @override
  String apiUrl() {
    return AppApi.getProductsByUserUrl + id;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return ProductsByUserIdJson.fromJson(data);
  }
}
