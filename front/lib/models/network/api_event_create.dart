import 'package:dio/dio.dart';
import 'package:front/config/app_api.dart';
import 'package:front/models/json/abstract_json_resource.dart';
import 'package:front/models/json/event_json.dart';
import 'package:front/models/network/api_manager.dart';

class ApiEventCreate extends ApiManager {
  late Dio dio = Dio();
  var token = '';
  @override
  String apiUrl() {
    dioSingleton.dio.options.headers['authorization'] =
        'bearer $token';
    return AppApi.createEventUrl;
  }

  @override
  AbstractJsonResource datajson(data) {
    print('data====================> $data');
    return EventJson.fromJson(data);
  }
}
