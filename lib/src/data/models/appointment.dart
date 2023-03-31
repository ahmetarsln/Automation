import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';

class Appointment {

  DateTime startDate;
  DateTime endDate;
  Employe employe;
  Patient patient;

  Appointment({required this.startDate, required this.endDate, required this.employe, required this.patient});
}