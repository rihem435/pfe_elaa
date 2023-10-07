import 'package:front/models/json/abstract_json_resource.dart';

class UserGetByIdJson extends AbstractJsonResource{
  String? message;
  int? status;
  Data? data;

  UserGetByIdJson({this.message, this.status, this.data});

  UserGetByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? items;
  String? username;
  String? email;
  String? password;
  String? city;
  String? adress;
  int? phone;
  String? image;
  List<String>? events;
  List<String>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;

  Data(
      {this.sId,
      this.items,
      this.username,
      this.email,
      this.password,
      this.city,
      this.adress,
      this.phone,
      this.image,
      this.events,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    city = json['city'];
    adress = json['adress'];
    phone = json['phone'];
    image = json['image'];
    events = json['events'].cast<String>();
    products = json['products'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['items'] = this.items;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['city'] = this.city;
    data['adress'] = this.adress;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['events'] = this.events;
    data['products'] = this.products;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}