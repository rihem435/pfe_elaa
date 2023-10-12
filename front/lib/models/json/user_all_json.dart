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
  List<String>? guests;
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
  String? city;
  String? adress;
  int? phone;

  Data(
      {this.guests,
      this.sId,
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
      this.city,
      this.adress,
      this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    guests = json['guests'].cast<String>();
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
    city = json['city'];
    adress = json['adress'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guests'] = this.guests;
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
    data['city'] = this.city;
    data['adress'] = this.adress;
    data['phone'] = this.phone;
    return data;
  }
}