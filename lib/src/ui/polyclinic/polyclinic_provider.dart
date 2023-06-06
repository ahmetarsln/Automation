import 'package:demo/src/data/models/polyclinic.dart';
import 'package:flutter/material.dart';

import '../../data/repository/polyclinic_repository.dart';

class PolyclinicProvider extends ChangeNotifier {
  final _polyclinicRepository = PolyclinicRepository();
  var error;
  List<Polyclinic> _polyclinicList = [];
  Polyclinic? _currentPolyclinic;
  bool isLoading = true;
  List<Polyclinic> get polyclinicList => _polyclinicList;
  set polyclinicList(List<Polyclinic> value) {
    _polyclinicList = value;
    notifyListeners();
  }

  Polyclinic? get CurrentPolyclinic => _currentPolyclinic;

  void changePolyclinic(Polyclinic polyclinic) {
    isLoading = true;
    notifyListeners();
    _currentPolyclinic = polyclinic;
    isLoading = false;
    notifyListeners();
  }

  void fetchPolyclinic(String id) {
    isLoading = true;
    notifyListeners();
    _polyclinicRepository.getPolyclinic(id).then((value) {
      _currentPolyclinic = Polyclinic.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void fetchPolyclinics() {
    isLoading = true;
    notifyListeners();
    _polyclinicRepository.getPolyclinics().then((value) {
      _polyclinicList = [];
      for (var element in value.docs) {
        _polyclinicList.add(Polyclinic.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void updatePolyclinic(Polyclinic polyclinic) {
    isLoading = true;
    notifyListeners();
    _polyclinicRepository.updatePolyclinic(polyclinic).then((value) {
      _currentPolyclinic = polyclinic;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void deletePolyclinic(Polyclinic polyclinic) {
    isLoading = true;
    notifyListeners();
    _polyclinicRepository.deletePolyclinic(polyclinic.id!).then((value) {
      _currentPolyclinic = polyclinic;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void addPolyclinic(Polyclinic polyclinic) {
    isLoading = true;
    notifyListeners();
    _polyclinicRepository.addPolyclinic(polyclinic).then((value) {
      polyclinic.id =value.id!;
      _polyclinicRepository.updatePolyclinic(polyclinic);
      _currentPolyclinic = polyclinic;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }
}
