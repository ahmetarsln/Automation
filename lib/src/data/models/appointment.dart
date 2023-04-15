import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'dart:convert';
import 'dart:io';

class Appointment {
  String? startDate;
  String? endDate;
  Employe? employe;
  Patient? patient;

  Appointment(
      {required this.startDate,
      required this.endDate,
      required this.employe,
      required this.patient});

  Appointment.fromJson(Map<String, dynamic> json) {
    startDate = json["startDate"];
    endDate = json["endDate"];
    employe = Employe.fromJson(json["employe"]);
    patient = Patient.fromJson(json["patient"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['employe'] = this.employe;
    data['patient'] = this.patient;

    return data;
  }
}

final appointments = () async {
  var input = await File('assets/json/appointment.json').readAsString();
  var map = jsonDecode(input);
  var temp = map['appointments'];
  var result = <Appointment>[];
  for (var element in temp) {
    result.add(Appointment.fromJson(element));
  }
  return result;
};
