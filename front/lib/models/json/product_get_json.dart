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
  int? price;
  List<String>? images;
  String? category;
  int? iV;
  String? description;

  Data(
      {this.sId,
      this.nameproduct,
      this.price,
      this.images,
      this.category,
      this.iV,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nameproduct = json['nameproduct'];
    price = json['price'];
    images = json['images'].cast<String>();
    category = json['category'];
    iV = json['__v'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nameproduct'] = this.nameproduct;
    data['price'] = this.price;
    data['images'] = this.images;
    data['category'] = this.category;
    data['__v'] = this.iV;
    data['description'] = this.description;
    return data;
  }
}