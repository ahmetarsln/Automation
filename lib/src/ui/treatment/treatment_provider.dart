import 'package:demo/src/data/models/treatment.dart';
import 'package:flutter/material.dart';

class TreatmentProvider extends ChangeNotifier {
  List<Treatment> _treatmentList = [];
  Treatment? _currentTreatment;
  bool _isLoading = true;
  List<Treatment> get treatmentList => _treatmentList;
  set treatmentList(List<Treatment> value) {
    _treatmentList = value;
    notifyListeners();
  }
  void changeTreatment(Treatment treatment) {
    _isLoading = true;
    notifyListeners();
    _currentTreatment = treatment;
    _isLoading = false;
    notifyListeners();
  }

  void fetchTreatment(String id) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void fetchTreatments() {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void updateTreatment(Treatment treatment) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void deleteTreatment(Treatment treatment) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
}