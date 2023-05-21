import 'package:demo/src/data/models/patient.dart';
import 'package:flutter/material.dart';

import '../../data/repository/patient_repository.dart';

class PatientProvider extends ChangeNotifier {
  final _patientRepository = PatientRepository();
  var error;
  List<Patient> _patientList = [];
  Patient? _currentPatient;
  bool _isLoading = true;
  List<Patient> get patientList => _patientList;
  set patientList(List<Patient> value) {
    _patientList = value;
    notifyListeners();
  }

  Patient? get CurrentPatient => _currentPatient;

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
    _patientRepository.getPatient(id).then((value) {
      _currentPatient = Patient.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void fetchPatients() {
    _isLoading = true;
    notifyListeners();
    _patientRepository.getPatients().then((value) {
      _patientList = [];
      for (var element in value.docs) {
        _patientList.add(Patient.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void updatePatient(Patient patient) {
    _isLoading = true;
    notifyListeners();
    _patientRepository.updatePatient(patient).then((value) {
      _currentPatient = patient;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void deletePatient(Patient patient) {
    _isLoading = true;
    notifyListeners();
    _patientRepository.deletePatient(patient.id!).then((value) {
      _currentPatient = patient;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void addPatient(Patient patient) {
    _isLoading = true;
    notifyListeners();
    _patientRepository.addPatient(patient).then((value) {
      _currentPatient = patient;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }
}
