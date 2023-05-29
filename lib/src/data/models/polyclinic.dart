import 'package:demo/src/data/models/employe.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Polyclinic {
  String? id;
  String? name;
  List<Employe>? employeList;
  

  Polyclinic({required this.id, required this.name, required this.employeList});

  Polyclinic.fromJson(Map<String, dynamic> json) {
    employeList = json['employeList'];
    name = json['name'];
    id=json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeList'] = this.employeList;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

final polyclinic = () async {
  var input = await rootBundle.loadString('assets/json/polyclinic.json');
  var map = jsonDecode(input);
  var temp = map['polyclinics'];
  var result = <Polyclinic>[];
  for (var element in temp) {
    result.add(Polyclinic.fromJson(element));
  }
  return result;
};
