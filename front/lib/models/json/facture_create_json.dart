import 'package:front/models/json/abstract_json_resource.dart';

class FactureCreateJson extends AbstractJsonResource{
  String? message;
  int? status;
  Data? data;

  FactureCreateJson({this.message, this.status, this.data});

  FactureCreateJson.fromJson(Map<String, dynamic> json) {
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
  String? dateFacture;
  int? total;
  String? event;
  String? sId;
  int? iV;

  Data({this.dateFacture, this.total, this.event, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    dateFacture = json['date_facture'];
    total = json['total'];
    event = json['event'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_facture'] = this.dateFacture;
    data['total'] = this.total;
    data['event'] = this.event;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}