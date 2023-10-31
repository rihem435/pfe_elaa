import 'package:front/models/json/abstract_json_resource.dart';

class FavoriteDeleteJson extends AbstractJsonResource{
  String? message;

  FavoriteDeleteJson({this.message});

  FavoriteDeleteJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}