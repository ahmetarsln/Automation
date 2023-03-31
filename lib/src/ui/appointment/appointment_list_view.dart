import 'package:demo/src/data/models/appointment.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppointmentListView extends StatefulWidget {
  const AppointmentListView({super.key});

  @override
  State<AppointmentListView> createState() => _AppointmentListViewState();
}

class _AppointmentListViewState extends State<AppointmentListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var appointment2 = <Appointment>[];

  @override
  Widget build(BuildContext context) {
    // appointment().then(
    //   (value) {
    //     setState(() {
    //       appoinment2 = value;
    //     });
    //   },
    // );
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(appointment2[index].employe.toString()),
          );
        },
        itemCount: appointment2.length,
      ),
    );
  }
}
