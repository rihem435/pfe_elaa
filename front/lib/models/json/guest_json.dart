import 'package:front/models/json/abstract_json_resource.dart';

class GuestJson extends AbstractJsonResource {
  String? message;
  int? status;
  Data? data;

  GuestJson({this.message, this.status, this.data});

  GuestJson.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? phonenumber;
  bool? invited;
  String? events;
  String? sId;
  int? iV;

  Data(
      {this.name,
      this.phonenumber,
      this.invited,
      this.events,
      this.sId,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phonenumber = json['phonenumber'];
    invited = json['invited'];
    events = json['events'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phonenumber'] = this.phonenumber;
    data['invited'] = this.invited;
    data['events'] = this.events;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}