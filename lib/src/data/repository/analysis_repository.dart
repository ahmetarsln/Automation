import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/appointment.dart';

class AnalysisRepository {
  final FirebaseFirestore _firestore;

  AnalysisRepository(this._firestore);

  getAnalysis(String id) {
    return _firestore.collection('analysis').doc(id).get();
  }

  getAnalyses() {
    return _firestore.collection('analysis').get();
  }

  updateAnalysis(Appointment appointment) {
    return _firestore
        .collection('analysis')
        .doc(appointment.id)
        .update(appointment.toJson());
  }

  deleteAnalysis(String id) {
    return _firestore.collection('analysis').doc(id).delete();
  }

  addAnalysis(Appointment appointment) {
    return _firestore.collection('analysis').add(appointment.toJson());
  }
}
