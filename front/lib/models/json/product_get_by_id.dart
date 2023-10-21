import 'package:front/models/json/abstract_json_resource.dart';

class ProductGetByIdJson extends AbstractJsonResource {
  String? message;
  int? status;
  Data? data;

  ProductGetByIdJson({this.message, this.status, this.data});

  ProductGetByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? nameproduct;
  int? price;
  List<String>? images;
  String? category;
  bool? favorite;
  int? iV;
  String? description;
  String? user;

  Data(
      {this.sId,
      this.nameproduct,
      this.price,
      this.images,
      this.category,
      this.favorite,
      this.iV,
      this.description,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameproduct = json['nameproduct'];
    price = json['price'];
    images = json['images'].cast<String>();
    category = json['category'];
    favorite = json['favorite'];
    iV = json['__v'];
    description = json['description'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameproduct'] = this.nameproduct;
    data['price'] = this.price;
    data['images'] = this.images;
    data['category'] = this.category;
    data['favorite'] = this.favorite;
    data['__v'] = this.iV;
    data['description'] = this.description;
    data['user'] = this.user;
    return data;
  }
}
