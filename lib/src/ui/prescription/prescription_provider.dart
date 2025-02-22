import 'package:demo/src/data/models/prescription.dart';
import 'package:flutter/material.dart';

import '../../data/repository/prescription_repository.dart';

class PrescriptionProvider extends ChangeNotifier {
  final _prescriptionRepository = PrescriptionRepository();
  var error;
  List<Prescription> _prescriptionList = [];
  Prescription? _currentPrescription;
  bool isLoading = true;
  List<Prescription> get prescriptionList => _prescriptionList;
  set prescriptionList(List<Prescription> value) {
    _prescriptionList = value;
    notifyListeners();
  }

  Prescription? get CurrentPrescription => _currentPrescription;

  void changePrescription(Prescription prescription) {
    isLoading = true;
    notifyListeners();
    _currentPrescription = prescription;
    isLoading = false;
    notifyListeners();
  }

  void fetchPrescription(String id) {
    isLoading = true;
    notifyListeners();
    _prescriptionRepository.getPrescription(id).then((value) {
      _currentPrescription = Prescription.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void fetchPrescriptions() {
    isLoading = true;
    notifyListeners();
    _prescriptionRepository.getPrescriptions().then((value) {
      _prescriptionList = [];
      for (var element in value.docs) {
        print("buarada");
        _prescriptionList.add(Prescription.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void updatePrescription(Prescription prescription) {
    isLoading = true;
    notifyListeners();
    _prescriptionRepository.updatePrescription(prescription).then((value) {
      _currentPrescription = prescription;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void deletePrescription(Prescription prescription) {
    isLoading = true;
    notifyListeners();
    _prescriptionRepository.deletePrescription(prescription.id!).then((value) {
      _prescriptionList.remove(prescription);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void addPrescription(Prescription prescription) {
    isLoading = true;
    notifyListeners();
    _prescriptionRepository.addPrescription(prescription).then((value) {
      prescription.id = value.id!;
      _prescriptionRepository.updatePrescription(prescription);
      _prescriptionList.add(prescription);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }
}
