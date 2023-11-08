import 'package:front/models/json/abstract_json_resource.dart';

class FavoriteByUserIdJson extends AbstractJsonResource {
  String? message;
  int? status;
  List<DataFav>? data;

  FavoriteByUserIdJson({this.message, this.status, this.data});

  FavoriteByUserIdJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DataFav>[];
      json['data'].forEach((v) {
        data!.add(new DataFav.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataFav {
  String? sId;
  bool? state;
  String? user;
  String? products;
  int? iV;

  DataFav({this.sId, this.state, this.user, this.products, this.iV});

  DataFav.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    user = json['user'];
    products = json['products'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['user'] = this.user;
    data['products'] = this.products;
    data['__v'] = this.iV;
    return data;
  }
}
