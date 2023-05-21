
import 'package:demo/src/data/models/polyclinic.dart';
import 'package:flutter/material.dart';

import '../../data/repository/polyclinic_repository.dart';

class PolyclinicProvider extends ChangeNotifier {
  final _polyclinicRepository = PolyclinicRepository();
  var error;
  List<Polyclinic> _polyclinicList = [];
  Polyclinic? _currentPolyclinic;
  bool _isLoading = true;
  List<Polyclinic> get polyclinicList => _polyclinicList;
  set polyclinicList(List<Polyclinic> value) {
    _polyclinicList = value;
    notifyListeners();
  }

  Polyclinic? get CurrentPolyclinic => _currentPolyclinic;

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
    _polyclinicRepository.getPolyclinic(id).then((value) {
      _currentPolyclinic = Polyclinic.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void fetchPolyclinics() {
    _isLoading = true;
    notifyListeners();
    _polyclinicRepository.getPolyclinics().then((value) {
      _polyclinicList = [];
      for (var element in value.docs) {
        _polyclinicList.add(Polyclinic.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }
  void updatePolyclinic(Polyclinic polyclinic) {
    _isLoading = true;
    notifyListeners();
    _polyclinicRepository.updatePolyclinic(polyclinic).then((value) {
      _currentPolyclinic = polyclinic;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }
  void deletePolyclinic(Polyclinic polyclinic) {
    _isLoading = true;
    notifyListeners();
    _polyclinicRepository.deletePolyclinic(polyclinic.id!).then((value) {
      _currentPolyclinic = polyclinic;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }

  void addPolyclinic(Polyclinic polyclinic) {
    _isLoading = true;
    notifyListeners();
    _polyclinicRepository.addPolyclinic(polyclinic).then((value) {
      _currentPolyclinic = polyclinic;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {_isLoading = false, notifyListeners()});
  }
}