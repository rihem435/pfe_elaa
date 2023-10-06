import 'package:front/models/json/abstract_json_resource.dart';

class EventJson extends AbstractJsonResource {
  String? message;
  int? status;
  Data? data;

  EventJson({this.message, this.status, this.data});

  EventJson.fromJson(Map<String, dynamic> json) {
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
  String? titleevent;
  String? description;
  String? dateDebut;
  String? dateFin;
  String? local;
  int? budget;
  String? user;
  String? sId;
  int? iV;

  Data(
      {this.titleevent,
      this.description,
      this.dateDebut,
      this.dateFin,
      this.local,
      this.budget,
      this.user,
      this.sId,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    titleevent = json['titleevent'];
    description = json['description'];
    dateDebut = json['date_debut'];
    dateFin = json['date_fin'];
    local = json['local'];
    budget = json['budget'];
    user = json['user'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titleevent'] = this.titleevent;
    data['description'] = this.description;
    data['date_debut'] = this.dateDebut;
    data['date_fin'] = this.dateFin;
    data['local'] = this.local;
    data['budget'] = this.budget;
    data['user'] = this.user;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
