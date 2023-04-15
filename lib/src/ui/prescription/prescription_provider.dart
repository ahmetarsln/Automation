
import 'package:demo/src/data/models/prescription.dart';
import 'package:flutter/material.dart';

class PrescriptionProvider extends ChangeNotifier {
  List<Prescription> _prescriptionList = [];
  Prescription? _currentPrescription;
  bool _isLoading = true;
  List<Prescription> get prescriptionList => _prescriptionList;
  set prescriptionList(List<Prescription> value) {
    _prescriptionList = value;
    notifyListeners();
  }
}