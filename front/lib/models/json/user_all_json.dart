import 'package:front/models/json/abstract_json_resource.dart';

class UsersAllJson extends AbstractJsonResource{
  String? message;
  int? status;
  List<Data>? data;

  UsersAllJson({this.message, this.status, this.data});

  UsersAllJson.fromJson(Map<String, dynamic> json) {
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
  String? items;
  String? username;
  String? email;
  String? password;
  List<String>? events;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  List<String>? products;
  String? fullname;
  String? city;
  String? adress;
  int? phone;
  String? image;

  Data(
      {this.sId,
      this.items,
      this.username,
      this.email,
      this.password,
      this.events,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.refreshToken,
      this.products,
      this.fullname,
      this.city,
      this.adress,
      this.phone,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    events = json['events'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
    products = json['products'].cast<String>();
    fullname = json['fullname'];
    city = json['city'];
    adress = json['adress'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['items'] = this.items;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['events'] = this.events;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    data['products'] = this.products;
    data['fullname'] = this.fullname;
    data['city'] = this.city;
    data['adress'] = this.adress;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}