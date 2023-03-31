import 'package:demo/src/data/models/patient.dart';

class Analysis {

  Map<String, String> parameters ;
  Patient patient;
  DateTime? finishdate;
  DateTime notificationDate;

  Analysis({required this.parameters, required this.patient, this.finishdate, DateTime? notificationDate}):notificationDate=notificationDate??DateTime.now();
  
}