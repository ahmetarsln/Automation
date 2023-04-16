import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/prescription.dart';

class PrescriptionRepository {

  final FirebaseFirestore _firestore;

  PrescriptionRepository(this._firestore);

  getPrescription(String id) {
    return _firestore.collection('prescriptions').doc(id).get();
  }

  getPrescriptions() {
    return _firestore.collection('prescriptions').get();
  }

  updatePrescription(Prescription prescription) {
    return _firestore
        .collection('prescriptions')
        .doc(prescription.id)
        .update(prescription.toJson());
  }

  deletePrescription(String id) {
    return _firestore.collection('prescriptions').doc(id).delete();
  }
  
  addPolyclinic(Prescription prescription) {
    return _firestore.collection('prescriptions').add(prescription.toJson());
  }
}