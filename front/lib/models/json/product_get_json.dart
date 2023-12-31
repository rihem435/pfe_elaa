import 'package:front/models/json/abstract_json_resource.dart';

class ProductGetJson extends AbstractJsonResource {

   String? message;
  int? status;
  List<Data>? data;

  ProductGetJson({this.message, this.status, this.data});

  ProductGetJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? sId;
  String? nameproduct;
  String? description;
  int? price;
  String? location;
  List<String>? images;
  String? category;
  String? user;
  int? iV;

  Data(
      {this.sId,
      this.nameproduct,
      this.description,
      this.price,
      this.location,
      this.images,
      this.category,
      this.user,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameproduct = json['nameproduct'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    images = json['images'].cast<String>();
    category = json['category'];
    user = json['user'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameproduct'] = this.nameproduct;
    data['description'] = this.description;
    data['price'] = this.price;
    data['location'] = this.location;
    data['images'] = this.images;
    data['category'] = this.category;
    data['user'] = this.user;
    data['__v'] = this.iV;
    return data;
  }
}
