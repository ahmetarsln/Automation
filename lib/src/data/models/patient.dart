import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';

class Patient {
  int? tc;
  String? name;
  String? surname;
  String? birthDate;
  bool? gender;
  Patient(
      {required this.tc,
      required this.name,
      required this.surname,
      required this.birthDate,
      required this.gender});
  Patient.fromJson(Map<String, dynamic> json) {
    tc = json['tc'];
    name = json['name'];
    surname = json['surname'];
    birthDate = json['birthDate'];
    gender = json['gender'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tc'] = this.tc;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    return data;
  }
}

final patients = () async {
  var input = await File('assets/json/patient.json').readAsString();
  var map = jsonDecode(input);
  var temp = map['patients'];
  var result = <Patient>[];
  for (var element in temp) {
    result.add(Patient.fromJson(element));
  }
  return result;
};
