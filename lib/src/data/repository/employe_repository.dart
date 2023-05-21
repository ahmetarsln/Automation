import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/src/data/models/appointment.dart';
import 'package:demo/src/data/models/employe.dart';

class EmployeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getEmploye(String id) {
    return _firestore.collection('employe').doc(id).get();
  }

  getEmployes() {
    return _firestore.collection('employe').get();
  }

  updateEmploye(Employe employe) {
    return _firestore
        .collection('employe')
        .doc(employe.id)
        .update(employe.toJson());
  }

  deleteEmploye(String id) {
    return _firestore.collection('employe').doc(id).delete();
  }

  addEmploye(Employe employe) {
    return _firestore.collection('employe').add(employe.toJson());
  }
}
