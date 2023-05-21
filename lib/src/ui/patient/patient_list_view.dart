import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

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
    final patientProvider = Provider.of<PatientProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(
                  patient2[index].name! + ' ' + patient2[index].surname!),
              subtitle: Text(patient2[index].tc!.toString()),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          );
        },
        itemCount: patient2.length,
      ),
    );
  }
}
