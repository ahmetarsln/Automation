
import 'package:demo/src/data/models/polyclinic.dart';
import 'package:flutter/material.dart';

class PolyclinicProvider extends ChangeNotifier {
  List<Polyclinic> _polyclinicList = [];
  Polyclinic? _currentPolyclinic;
  bool _isLoading = true;
  List<Polyclinic> get polyclinicList => _polyclinicList;
  set polyclinicList(List<Polyclinic> value) {
    _polyclinicList = value;
    notifyListeners();
  }
  void changePolyclinic(Polyclinic polyclinic) {
    _isLoading = true;
    notifyListeners();
    _currentPolyclinic = polyclinic;
    _isLoading = false;
    notifyListeners();
  }

  void fetchPolyclinic(String id) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void fetchPolyclinics() {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void updatePolyclinic(Polyclinic polyclinic) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void deletePolyclinic(Polyclinic polyclinic) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
}