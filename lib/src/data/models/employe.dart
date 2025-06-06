import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;

class Employe {
  String? name;
  String? surname;
  int? tc;
  String? birthDate;
  bool? gender;
  String? department;
  String? id;

  Employe(
      {required this.name,
      required this.surname,
      required this.tc,
      required this.birthDate,
      required this.gender,
      required this.department});

  Employe.fromJson(Map<String, dynamic> json) {
    tc = json['tc'];
    name = json['name'];
    surname = json['surname'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    department = json['department'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tc'] = this.tc;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['department'] = this.department;
    data['id'] = this.id;
    return data;
  }
}

final employes = () async {
  var input = await rootBundle.loadString('assets/json/employe.json');
  var map = jsonDecode(input);
  var temp = map['employes'];
  var result = <Employe>[];
  for (var element in temp) {
    result.add(Employe.fromJson(element));
  }
  return result;
};
