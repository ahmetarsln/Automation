import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';

class Prescription {
  List<String>? medicationNames;
  DateTime? date;
  Employe? employe;
  Patient? patient;

  Prescription(
      {required this.medicationNames,
      required this.date,
      required this.employe,
      required this.patient});

  Prescription.fromJson(Map<String, dynamic> json) {
    medicationNames = json["medicationNames"];
    date = json["date"];
    employe = Employe.fromJson(json["employe"]);
    patient = Patient.fromJson(json["patient"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicationNames'] = this.medicationNames;
    data['date'] = this.date;
    data['employe'] = this.employe;
    data['patient'] = this.patient;

    return data;
  }
}

// final prescription = () async {
//   var input = await File('assets/json/appointment.json').readAsString();
//   var map = jsonDecode(input);
//   var temp = map['prescription'];
//   var result = <Prescription>[];
//   for (var element in temp) {
//     result.add(Prescription.fromJson(element));
//   }
//   return result;
// };
