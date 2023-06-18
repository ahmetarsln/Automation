import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class Prescription {
  String? id;
  List<String>? medicationNames;
  String? date;
  Employe? employe;
  Patient? patient;

  Prescription(
      {required this.id,
      required this.medicationNames,
      required this.date,
      required this.employe,
      required this.patient});

  Prescription.fromJson(Map<String, dynamic> json) {
    medicationNames = json["medicationNames"].cast<String>();
    date = json["date"];
    employe = Employe.fromJson(json["employe"]);
    patient = Patient.fromJson(json["patient"]);
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicationNames'] = this.medicationNames;
    data['date'] = this.date;
    data['employe'] = this.employe?.toJson();
    data['patient'] = this.patient?.toJson();
    data['id'] = this.id;
    return data;
  }
}

final prescriptions = () async {
  var input = await rootBundle.loadString('assets/json/prescription.json');
  var map = jsonDecode(input);
  var temp = map['prescriptions'];
  var result = <Prescription>[];
  for (var element in temp) {
    result.add(Prescription.fromJson(element));
  }
  return result;
};
