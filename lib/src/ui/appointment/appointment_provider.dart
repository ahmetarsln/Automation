import 'package:demo/src/data/models/appointment.dart';
import 'package:flutter/material.dart';

import '../../data/repository/appointment_repository.dart';

class AppointmentProvider extends ChangeNotifier {
  final _appointmentRepository = AppointmentRepository();
  var error;

  List<Appointment> _appointmentList = [];
  Appointment? _currentAppointment;
  bool isLoading = true;
  List<Appointment> get appointmentList => _appointmentList;
  set appointmentList(List<Appointment> value) {
    _appointmentList = value;
    notifyListeners();
  }

  Appointment? get CurrentAppointment => _currentAppointment;

  void changeAppointment(Appointment appointment) {
    isLoading = true;
    notifyListeners();
    _currentAppointment = appointment;
    isLoading = false;
    notifyListeners();
  }

  void fetchAppointment(String id) {
    isLoading = true;
    notifyListeners();
    _appointmentRepository.getAppointment(id).then((value) {
      _currentAppointment = Appointment.fromJson(value.data()!);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
    isLoading = false;
    notifyListeners();
  }

  void fetchAppointments() {
    isLoading = true;
    notifyListeners();
    _appointmentRepository.getAppointments().then((value) {
      _appointmentList = [];
      for (var element in value.docs) {
        _appointmentList.add(Appointment.fromJson(element.data()));
      }
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
    
  }

  void updateAppointment(Appointment appointment) {
    isLoading = true;
    notifyListeners();
    _appointmentRepository.updateAppointment(appointment).then((value) {
      _currentAppointment = appointment;
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void deleteAppointment(Appointment appointment) {
    isLoading = true;
    notifyListeners();
    _appointmentRepository.deleteAppointment(appointment.id!).then((value) {
      _appointmentList.remove(appointment);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }

  void addAppointment(Appointment appointment) {
    isLoading = true;
    notifyListeners();
    _appointmentRepository.addAppointment(appointment).then((value) {
      _appointmentList.add(appointment);
    }).catchError((e) {
      error = e;
    }).whenComplete(() => {isLoading = false, notifyListeners()});
  }
}
