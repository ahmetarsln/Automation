import 'package:demo/src/data/models/analysis.dart';
import 'package:flutter/material.dart';

class AnalysisProvider extends ChangeNotifier {
  List<Analysis> _analysisList = [];
  Analysis? _currentAnalysis;
  bool _isLoading = true;
  List<Analysis> get analysisList => _analysisList;
  set analysisList(List<Analysis> value) {
    _analysisList = value;
    notifyListeners();
  }

  void changeAnalysis(Analysis analysis) {
    _isLoading = true;
    notifyListeners();
    _currentAnalysis = analysis;
    _isLoading = false;
    notifyListeners();
  }

  void fetchAnalysis(String id) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void fetchAnalysiss() {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void updateAnalysis(Analysis analysis) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void deleteAnalysis(Analysis analysis) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
}
