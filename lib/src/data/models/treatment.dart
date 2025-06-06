import 'package:demo/src/data/models/appointment.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class Treatment {
  String? id;
  String? startDate;
  String? endDate;
  List<String>? appointments;
  List<String>? notes;

  Treatment(
      {required this.startDate,
      required this.appointments,
      required this.notes,
      this.endDate});

  Treatment.fromJson(Map<String, dynamic> json) {
    startDate = json["startDate"];
    endDate = json["endDate"];
    appointments = json["appointments"].cast<String>();
    json["appointments"].cast<Appointment>();
    notes = json["notes"].cast<String>();
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['appointments'] = this.appointments;
    data['notes'] = this.notes;
    data['id'] = this.id;
    return data;
  }
}

final treatment = () async {
  var input = await rootBundle.loadString('assets/json/treatment.json');
  var map = jsonDecode(input);
  var temp = map['treatments'];
  var result = <Treatment>[];
  for (var element in temp) {
    result.add(Treatment.fromJson(element));
  }
  return result;
};
