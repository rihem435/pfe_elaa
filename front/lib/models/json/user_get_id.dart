import 'package:front/models/json/abstract_json_resource.dart';

class UserGetByIdJson extends AbstractJsonResource {
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
  
  List<String>? events;

  List<String>? guests;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? refreshToken;
  String? adress;
  String? image;
  int? phone;
  List<String>? products;
  List<String>? favorites;

  Data(
      {this.sId,
      this.items,
      this.username,
      this.email,
      
      this.password,
      
      this.events,

      this.guests,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.refreshToken,
      this.adress,
      this.image,
      this.phone,
      this.products,
      this.favorites});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    items = json['items'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    events = json['events'].cast<String>();
    guests = json['guests'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    refreshToken = json['refreshToken'];
    adress = json['adress'];
    image = json['image'];
    phone = json['phone'];


    products = json['products'].cast<String>();
    favorites = json['favorites'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['items'] = this.items;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;

    data['events'] = this.events;

    data['guests'] = this.guests;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['refreshToken'] = this.refreshToken;
    data['adress'] = this.adress;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['products'] = this.products;
    data['favorites'] = this.favorites;
    return data;
  }
}

