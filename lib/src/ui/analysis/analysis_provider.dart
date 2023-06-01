import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/data/repository/analysis_repository.dart';
import 'package:flutter/material.dart';

class AnalysisProvider extends ChangeNotifier {
  final _analysisRepository = AnalysisRepository();
  var error;
  List<Analysis> _analysisList = [];
  Analysis? _currentAnalysis;
  bool isLoading = true;
  List<Analysis> get analysisList => _analysisList;

  set analysisList(List<Analysis> value) {
    _analysisList = value;
    notifyListeners();
  }

  Analysis? get CurrentAnalysis => _currentAnalysis;

  void changeAnalysis(Analysis analysis) {
    print(analysis);
    isLoading = true;
    print(isLoading);
    notifyListeners();
    _currentAnalysis = analysis;
    isLoading = false;
    print(isLoading);
    notifyListeners();
  }

  void fetchAnalysis(String id) {
    isLoading = true;
    notifyListeners();
    _analysisRepository.getAnalysis(id).then((value) {
      _currentAnalysis = Analysis.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void fetchAnalyses() {
    isLoading = true;
    notifyListeners();
    _analysisRepository.getAnalyses().then((value) {
      _analysisList = [];
      for (var element in value.docs) {
        _analysisList.add(Analysis.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void updateAnalysis(Analysis analysis) {
    isLoading = true;
    notifyListeners();
    _analysisRepository.updateAnalysis(analysis).then((value) {
      _currentAnalysis = analysis;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void deleteAnalysis(Analysis analysis) {
    isLoading = true;
    notifyListeners();
    _analysisRepository.deleteAnalysis(analysis.id!).then((value) {
      _analysisList.remove(analysis);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void addAnalysis(Analysis analysis) {
    isLoading = true;
    notifyListeners();
    _analysisRepository.addAnalysis(analysis).then((value) {
      _analysisList.add(analysis);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }
}
