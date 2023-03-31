import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/appointment/appointment_add_view.dart';
import 'package:demo/src/ui/appointment/appointment_delete_view.dart';
import 'package:demo/src/ui/appointment/appointment_list_view.dart';
import 'package:demo/src/ui/patient/patient_add_view.dart';
import 'package:demo/src/ui/patient/patient_delete_view.dart';
import 'package:demo/src/ui/patient/patient_edit_view.dart';
import 'package:demo/src/ui/patient/patient_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PatientEditView(
      //     patient: Patient(
      //         tc: 6567765675,
      //         name: "name",
      //         surname: "surname",
      //         birthDate: "birthDate",
      //         gender: false)),
      home: AppointmentListView(),
    );
  }
}
