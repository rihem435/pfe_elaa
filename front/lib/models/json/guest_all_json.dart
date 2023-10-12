import 'package:front/models/json/abstract_json_resource.dart';

class GuestGetAllJson extends AbstractJsonResource {
 String? message;
  int? status;
  List<Data>? data;

  GuestGetAllJson({this.message, this.status, this.data});

  GuestGetAllJson.fromJson(Map<String, dynamic> json) {
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