import 'package:demo/src/data/models/treatment.dart';
import 'package:flutter/material.dart';

import '../../data/repository/treatment_repository.dart';

class TreatmentProvider extends ChangeNotifier {
  final _treatmentRepository = TreatmentRepository();
  var error;

  List<Treatment> _treatmentList = [];
  Treatment? _currentTreatment;
  bool isLoading = true;
  List<Treatment> get treatmentList => _treatmentList;
  set treatmentList(List<Treatment> value) {
    _treatmentList = value;
    notifyListeners();
  }

  Treatment? get CurrentTreatment => _currentTreatment;

  void changeTreatment(Treatment treatment) {
    isLoading = true;
    notifyListeners();
    _currentTreatment = treatment;
    isLoading = false;
    notifyListeners();
  }

  void fetchTreatment(String id) {
    isLoading = true;
    notifyListeners();
    _treatmentRepository.getTreatment(id).then((value) {
      _currentTreatment = Treatment.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void fetchTreatments() {
    isLoading = true;
    notifyListeners();
    _treatmentRepository.getTreatments().then((value) {
      _treatmentList = [];
      for (var element in value.docs) {
        _treatmentList.add(Treatment.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void updateTreatment(Treatment treatment) {
    isLoading = true;
    notifyListeners();
    _treatmentRepository.updateTreatment(treatment).then((value) {
      _currentTreatment = treatment;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void deleteTreatment(Treatment treatment) {
    isLoading = true;
    notifyListeners();
    _treatmentRepository.deleteTreatment(treatment.id!).then((value) {
      _treatmentList.remove(treatment);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void addTreatment(Treatment treatment) {
    isLoading = true;
    notifyListeners();
    _treatmentRepository.addTreatment(treatment).then((value) {
      treatment.id = value.id!;
      _treatmentRepository.updateTreatment(treatment);
      _treatmentList.add(treatment);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }
}
