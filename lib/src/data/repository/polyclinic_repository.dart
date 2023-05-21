import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/polyclinic.dart';

class PolyclinicRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getPolyclinic(String id) {
    return _firestore.collection('polyclinics').doc(id).get();
  }
  
  getPolyclinics() {
    return _firestore.collection('polyclinics').get();
  }

  updatePolyclinic(Polyclinic polyclinic) {
    return _firestore
        .collection('polyclinics')
        .doc(polyclinic.id)
        .update(polyclinic.toJson());
  }

  deletePolyclinic(String id) {
    return _firestore.collection('polyclinics').doc(id).delete();
  }

  addPolyclinic(Polyclinic polyclinic) {
    return _firestore.collection('polyclinics').add(polyclinic.toJson());
  }
}