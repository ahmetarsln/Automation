import 'package:demo/src/data/models/appointment.dart';

class Treatment {

  DateTime startDate;
  DateTime? endDate;
  List<Appointment> appointments;
  List<String> notes;

  Treatment({required this.startDate, required this.appointments, required this.notes, this.endDate});
  
}