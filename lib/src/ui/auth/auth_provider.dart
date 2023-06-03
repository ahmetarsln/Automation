import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/data/models/auth.dart';
import 'package:demo/src/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final _authRepository = AuthRepository();
  String? uid;

  bool isLoading = true;

  void login(AuthModel auth, context) {
    isLoading = true;
    notifyListeners();
    _authRepository.signIn(auth).then((value) => uid = value).whenComplete(() {
      isLoading = false;
      notifyListeners();
      Navigator.of(context).pushNamed(RoutesKeys.home);
    });
  }

  void register(AuthModel auth) {
    isLoading = true;
    notifyListeners();
    _authRepository.signUp(auth).then((value) => uid = value).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }

  void getCurrentUser(context) {
    isLoading = true;
    notifyListeners();
    _authRepository
        .getCurrentUser()
        .then((value) => uid = value?.uid)
        .whenComplete(() {
      if (uid != null) {
        Navigator.of(context).pushNamed(RoutesKeys.home);
      }
      isLoading = false;
      notifyListeners();
    });
  }

  void logOut(AuthModel auth) {
    isLoading = true;
    notifyListeners();
    _authRepository.signOut().then((value) => uid = null).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
