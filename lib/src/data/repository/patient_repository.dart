import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/patient.dart';

class PatientRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getPatient(String id) {
    return _firestore.collection('patients').doc(id).get();
  }

  getPatients() {
    return _firestore.collection('patients').get();
  }

  updatePatient(Patient patient) {
    return _firestore
        .collection('patients')
        .doc(patient.id)
        .update(patient.toJson());
  }

  deletePatient(String id) {
    return _firestore.collection('patients').doc(id).delete();
  }

  addPatient(Patient patient) {
    return _firestore.collection('patients').add(patient.toJson());
  }
}

