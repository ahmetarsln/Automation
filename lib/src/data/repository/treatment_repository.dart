import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/treatment.dart';

class TreatmentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getTreatment(String id) {
    return _firestore.collection('treatments').doc(id).get();
  }

  getTreatments() {
    return _firestore.collection('treatments').get();
  }

  updateTreatment(Treatment treatment) {
    return _firestore
        .collection('treatments')
        .doc(treatment.id)
        .update(treatment.toJson());
  }

  deleteTreatment(String id) {
    return _firestore.collection('treatments').doc(id).delete();
  }

  addTreatment(Treatment treatment) {
    return _firestore.collection('treatments').add(treatment.toJson());
  }
}
