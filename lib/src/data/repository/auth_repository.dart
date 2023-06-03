import 'package:demo/src/data/models/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn(AuthModel auth) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: auth.email!, password: auth.password!);
      return user.user?.uid;
    } catch (e) {
      return null;
    }
  }

  Future<String?> signUp(AuthModel auth) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: auth.email!, password: auth.password!);
      return user.user?.uid;
    } catch (e) {
      return null;
    }
  }

  Future<User?> getCurrentUser() async {
    User? user = await _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    User? user = await _firebaseAuth.currentUser;
    user?.sendEmailVerification();
  }

  Future<void> sendPasswordResetMail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return null;
  }
}
