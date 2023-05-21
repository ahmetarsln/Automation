import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/data/models/appointment.dart';

class AnalysisRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  
  Future getAnalysis(String id ) {
    return _firestore.collection('analysis').doc(id).get();
  }

  Future getAnalyses() {
    return _firestore.collection('analysis').get();
  }

  Future updateAnalysis(Analysis analysis) {
    return _firestore
        .collection('analysis')
        .doc(analysis.id)
        .update(analysis.toJson());
  }

  Future deleteAnalysis(String id) {
    return _firestore.collection('analysis').doc(id).delete();
  }

  Future addAnalysis(Analysis analysis ) {
    return _firestore.collection('analysis').add(analysis.toJson());
  }
}
