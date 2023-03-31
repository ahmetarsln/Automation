import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';

class Prescription {
  
  List<String> medicationNames;
  DateTime date;
  Employe employe;
  Patient patient;

  Prescription({required this.medicationNames, required this.date, required this.employe, required this.patient});
}