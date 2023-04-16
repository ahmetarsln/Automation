import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/appointment.dart';

class AppointmentRepository {
  final FirebaseFirestore _firestore;


  AppointmentRepository(this._firestore);

  getAppointment(String id) {
    return _firestore.collection('appointments').doc(id).get();
  }

  getAppointments() {
    return _firestore.collection('appointments').get();
  }

  updateAppointment(Appointment appointment) {
    return _firestore
        .collection('appointments')
        .doc(appointment.id)
        .update(appointment.toJson());
  }

  deleteAppointment(String id) {
    return _firestore.collection('appointments').doc(id).delete();
  }

  addAppointment(Appointment appointment) {
    return _firestore.collection('appointments').add(appointment.toJson());
  }

}
