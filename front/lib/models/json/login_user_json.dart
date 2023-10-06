import 'package:front/models/json/abstract_json_resource.dart';

class LoginUserJson  extends AbstractJsonResource{
 Tokens? tokens;
  User? user;

  LoginUserJson({this.tokens, this.user});

  LoginUserJson.fromJson(Map<String, dynamic> json) {
    tokens =
        json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Tokens {
  String? accessToken;
  String? refreshToken;

  Tokens({this.accessToken, this.refreshToken});

  Tokens.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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