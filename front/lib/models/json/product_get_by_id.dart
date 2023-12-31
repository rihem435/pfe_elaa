import 'package:front/models/json/abstract_json_resource.dart';

class ProductGetByIdJson extends AbstractJsonResource{
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
  String? description;
  int? price;
  String? location;
  List<String>? images;
  String? category;
  String? user;
  int? iV;
  Favorites? favorites;

  Data(
      {this.sId,
      this.nameproduct,
      this.description,
      this.price,
      this.location,
      this.images,
      this.category,
      this.user,
      this.iV,
      this.favorites});

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
    favorites = json['favorites'] != null
        ? new Favorites.fromJson(json['favorites'])
        : null;
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
    if (this.favorites != null) {
      data['favorites'] = this.favorites!.toJson();
    }
    return data;
  }
}

class Favorites {
  String? sId;
  bool? state;
  String? user;
  String? products;
  int? iV;

  Favorites({this.sId, this.state, this.user, this.products, this.iV});

  Favorites.fromJson(Map<String, dynamic> json) {
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
