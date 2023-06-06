import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/app_constant.dart';

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
      appBar: const CustomAppBar(title: "Hastalar Listesi"),
      drawer: const CustomDrawer(),
      body: Consumer<PatientProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(PatientProvider value) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              child: const Text(
                "Yeni Hasta",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(RoutesKeys.patientNew)},
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.supervised_user_circle, size: 48),
                  title: Text(
                      patient2[index].name! + ' ' + patient2[index].surname!),
                  subtitle: Text(patient2[index].tc!.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          value.changePatient(patient2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.patientEdit);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          value.changePatient(patient2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.patientDelete);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: patient2.length,
          ),
        ),
      ],
    );
  }
}
