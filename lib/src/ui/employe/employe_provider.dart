import 'package:demo/src/data/models/employe.dart';
import 'package:flutter/material.dart';

import '../../data/repository/employe_repository.dart';

class EmployeProvider extends ChangeNotifier {
  final _employeRepository = EmployeRepository();
  var error;

  List<Employe> _employeList = [];
  Employe? _currentEmploye;
  bool _isLoading = true;
  List<Employe> get employeList => _employeList;
  set employeList(List<Employe> value) {
    _employeList = value;
    notifyListeners();
  }

  Employe? get CurrentEmploye => _currentEmploye;

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
    _employeRepository.getEmploye(id).then((value) {
      _currentEmploye = Employe.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void fetchEmployes() {
    _isLoading = true;
    notifyListeners();
    _employeRepository.getEmployes().then((value) {
      _employeList = [];
      for (var element in value.docs) {
        _employeList.add(Employe.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void updateEmploye(Employe employe) {
    _isLoading = true;
    notifyListeners();
    _employeRepository.updateEmploye(employe).then((value) {
      _currentEmploye = employe;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void deleteEmploye(Employe employe) {
    _isLoading = true;
    notifyListeners();
    _employeRepository.deleteEmploye(employe.id!).then((value) {
      _employeList.remove(employe);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void addEmploye(Employe employe) {
    _isLoading = true;
    notifyListeners();
    _employeRepository.addEmploye(employe).then((value) {
      _employeList.add(employe);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }
}
