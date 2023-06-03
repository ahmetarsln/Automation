import 'package:demo/src/data/models/patient.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class Analysis {
  String? id;
  String? parameters;
  Patient? patient;
  String? finishdate;
  String? notificationDate;

  Analysis(
      {this.id,
      required this.parameters,
      required this.patient,
      this.finishdate,
      this.notificationDate});

  Analysis.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    parameters = json["parameters"];
    patient = Patient.fromJson(json["patient"]);
    finishdate = json["finishdate"];
    notificationDate = json["notificationDate"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parameters'] = this.parameters;
    data['patient'] = this.patient?.toJson();
    data['finishdate'] = this.finishdate;
    data['notificationDate'] = this.notificationDate;

    return data;
  }
}

final analyses = () async {
  var input = await rootBundle.loadString('assets/json/analysis.json');
  var map = jsonDecode(input);
  var temp = map['analyses'];
  var result = <Analysis>[];
  for (var element in temp) {
    result.add(Analysis.fromJson(element));
  }
  return result;
};
