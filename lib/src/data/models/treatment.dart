import 'package:demo/src/data/models/appointment.dart';
import 'dart:convert';
import 'dart:io';

class Treatment {

  DateTime? startDate;
  DateTime? endDate;
  List<Appointment>? appointments;
  List<String>? notes;

  Treatment({required this.startDate, required this.appointments, required this.notes, this.endDate});

  Treatment.fromJson(Map<String, dynamic> json) {
    startDate = json["startDate"];
    endDate = json["endDate"];
    appointments = [Appointment.fromJson(json["appointments"])];
    notes = json["notes"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['appointments'] = this.appointments;
    data['notes'] = this.notes;

    return data;
  }
  
}

// final treatment = () async {
//   var input = await File('assets/json/employe.json').readAsString();
//   var map = jsonDecode(input);
//   var temp = map['treatment'];
//   var result = <Treatment>[];
//   for (var element in temp) {
//     result.add(Treatment.fromJson(element));
//   }
//   return result;
// };