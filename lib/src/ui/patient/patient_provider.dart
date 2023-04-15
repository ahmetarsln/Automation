import 'package:demo/src/data/models/patient.dart';
import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  List<Patient> _patientList = [];
  Patient? _currentPatient;
  bool _isLoading = true;
  List<Patient> get patientList => _patientList;
  set patientList(List<Patient> value) {
    _patientList = value;
    notifyListeners();
  }
  void changePatient(Patient patient) {
    _isLoading = true;
    notifyListeners();
    _currentPatient = patient;
    _isLoading = false;
    notifyListeners();
  }

  void fetchPatient(String id) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void fetchPatients() {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void updatePatient(Patient patient) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void deletePatient(Patient patient) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
}