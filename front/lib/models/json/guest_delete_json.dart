import 'package:front/models/json/abstract_json_resource.dart';

class GuestDeleteJson extends AbstractJsonResource{
  String? message;

  GuestDeleteJson({this.message});

  GuestDeleteJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}