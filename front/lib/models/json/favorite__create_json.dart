import 'package:front/models/json/abstract_json_resource.dart';

class FavoriteCreateJson extends AbstractJsonResource {
 String? message;
  int? status;
  Data? data;

  FavoriteCreateJson({this.message, this.status, this.data});

  FavoriteCreateJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? state;
  String? user;
  String? products;
  String? sId;
  int? iV;

  Data({this.state, this.user, this.products, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    user = json['user'];
    products = json['products'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['user'] = this.user;
    data['products'] = this.products;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}