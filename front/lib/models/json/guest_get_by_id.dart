import 'package:front/models/json/abstract_json_resource.dart';

class GuestGetByIdJson extends AbstractJsonResource{
  String? message;
  int? status;
  Data? data;

  GuestGetByIdJson({this.message, this.status, this.data});

  GuestGetByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? phonenumber;
  bool? invited;
  String? events;
  int? iV;

  Data(
      {this.sId,
      this.name,
      this.phonenumber,
      this.invited,
      this.events,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phonenumber = json['phonenumber'];
    invited = json['invited'];
    events = json['events'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phonenumber'] = this.phonenumber;
    data['invited'] = this.invited;
    data['events'] = this.events;
    data['__v'] = this.iV;
    return data;
  }
}