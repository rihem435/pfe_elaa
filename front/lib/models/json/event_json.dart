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
  String? description;
  String? titleevent;
  String? dateDebut;
  String? dateFin;
  String? local;
  String? user;
  String? sId;
  int? budget;
  int? iV;

  Data(
      {this.description,
      this.titleevent,
      this.dateDebut,
      this.dateFin,
      this.budget,
      this.local,
      this.user,
      this.sId,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    titleevent = json['titleevent'];
    dateDebut = json['date_debut'];
    dateFin = json['date_fin'];
    budget = json['budget'];
    local = json['local'];
    user = json['user'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['titleevent'] = this.titleevent;
    data['date_debut'] = this.dateDebut;
    data['date_fin'] = this.dateFin;
    data['budget'] = this.budget;
    data['local'] = this.local;
    data['user'] = this.user;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
