import 'package:front/models/json/abstract_json_resource.dart';

class EventByIdJson extends AbstractJsonResource {
  String? message;
  int? status;
  Data? data;

  EventByIdJson({this.message, this.status, this.data});

  EventByIdJson.fromJson(Map<String, dynamic> json) {
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
  String? titleevent;
  String? description;
  String? dateDebut;
  String? dateFin;
  String? local;
  int? budget;
  String? user;
  int? iV;

  Data(
      {this.sId,
      this.titleevent,
      this.description,
      this.dateDebut,
      this.dateFin,
      this.local,
      this.budget,
      this.user,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    titleevent = json['titleevent'];
    description = json['description'];
    dateDebut = json['date_debut'];
    dateFin = json['date_fin'];
    local = json['local'];
    budget = json['budget'];
    user = json['user'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['titleevent'] = this.titleevent;
    data['description'] = this.description;
    data['date_debut'] = this.dateDebut;
    data['date_fin'] = this.dateFin;
    data['local'] = this.local;
    data['budget'] = this.budget;
    data['user'] = this.user;
    data['__v'] = this.iV;
    return data;
  }
}