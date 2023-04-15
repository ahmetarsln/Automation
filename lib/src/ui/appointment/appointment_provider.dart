
import 'package:demo/src/data/models/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  List<Appointment> _appointmentList = [];
  Appointment? _currentAppointment;
  bool _isLoading = true;
  List<Appointment> get appointmentList => _appointmentList;
  set appointmentList(List<Appointment> value) {
    _appointmentList = value;
    notifyListeners();
  }

  void changeAppointment(Appointment appointment) {
    _isLoading = true;
    notifyListeners();
    _currentAppointment = appointment;
    _isLoading = false;
    notifyListeners();
  }

  void fetchAppointment(String id) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }

  void fetchAppointments() {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void updateAppointment(Appointment appointment) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
  void deleteAppointment(Appointment appointment) {
    _isLoading = true;
    notifyListeners();
    // buraya api isteği gelecek
    _isLoading = false;
    notifyListeners();
  }
}