import 'package:front/config/dio_singleton.dart';
import 'package:front/models/json/abstract_json_resource.dart';

abstract class ApiManager {
  DioSingleton dioSingleton = DioSingleton();
  //methode conteint url
  String apiUrl();
  //data
  AbstractJsonResource datajson(data);
  ////////////post data/////////

  Future<AbstractJsonResource?> postData(dataToPost) async {
    var data;
    print('*****************post data****************');
    print('+++++++++++++++++++++++$dataToPost++++++++++++++++++++++++++++');
    AbstractJsonResource? json;

    return await dioSingleton.dio
        .post(apiUrl(), data: dataToPost)
        .then((value) {
      print("post data************ $value");
      data = value.data;
      json = datajson(data);
      print('json==================> ${json}');
      return json;
    }).onError((error, stackTrace) {
      print('error  post=========> $error');
    });
  }

  Future<AbstractJsonResource?> getData({dataToGet}) async {
    var data;
    print('*****************get data****************');
    AbstractJsonResource? json;
    return await dioSingleton.dio
        .get(apiUrl(), queryParameters: dataToGet)
        .then((value) {
      data = value.data;
      json = datajson(data);
      return json;
    }).onError((error, stackTrace) {
      print('error  get=========> $error');
    });
  }

  Future<AbstractJsonResource?> updateData(dataUpdate) async {
    var data;
    AbstractJsonResource? json;
    return await dioSingleton.dio
        .patch(apiUrl(), data: dataUpdate)
        .then((value) {
      data = value.data;
      json = datajson(data);
      return json;
    }).onError((error, stackTrace) {
      print('error update=========> $error');
    });
  }
}
