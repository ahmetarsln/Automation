import 'package:demo/src/data/models/employe.dart';
import 'package:flutter/material.dart';

class EmployeProvider extends ChangeNotifier {
  List<Employe> _employeList = [];
  Employe? _currentEmploye;
  bool _isLoading = true;
  List<Employe> get employeList => _employeList;
  set employeList(List<Employe> value) {
    _employeList = value;
    notifyListeners();
  }

  void changeEmploye(Employe employe) {
    _isLoading = true;
    notifyListeners();
    _currentEmploye = employe;
    _isLoading = false;
    notifyListeners();
  }

  void fetchEmploye(String id) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void fetchEmployes() {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void updateEmploye(Employe employe) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void deleteEmploye(Employe employe) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
}