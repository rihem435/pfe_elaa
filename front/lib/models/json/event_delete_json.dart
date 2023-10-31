import 'package:front/models/json/abstract_json_resource.dart';

class EventDeleteJson extends AbstractJsonResource{
  String? message;

  EventDeleteJson({this.message});

  EventDeleteJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}