import 'package:demo/src/data/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PatientListView extends StatefulWidget {
  const PatientListView({super.key});

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var patient2 = <Patient>[];

  @override
  Widget build(BuildContext context) {
    patients().then(
      (value) {
        setState(() {
          patient2 = value;
        });
      },
    );
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(patient2[index].gender.toString()),
          );
        },
        itemCount: patient2.length,
      ),
    );
  }
}
