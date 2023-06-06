import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/prescription.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/app_constant.dart';

class PrescriptionListView extends StatefulWidget {
  const PrescriptionListView({super.key});

  @override
  State<PrescriptionListView> createState() => _PrescriptionListViewState();
}

class _PrescriptionListViewState extends State<PrescriptionListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var prescription2 = <Prescription>[];

  @override
  Widget build(BuildContext context) {
    prescriptions().then(
      (value) {
        setState(() {
          prescription2 = value;
        });
      },
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "Reçeteler"),
      drawer: const CustomDrawer(),
      body: Consumer<PrescriptionProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(PrescriptionProvider provider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              child: const Text(
                "Yeni Reçete",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(RoutesKeys.analysisNew)},
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text(prescription2[index].patient!.name! +
                      ' ' +
                      prescription2[index].patient!.surname!),
                  subtitle: Text(prescription2[index].patient!.tc!.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          provider.changePrescription(prescription2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.prescriptionEdit);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          provider.changePrescription(prescription2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.prescriptionDelete);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: prescription2.length,
          ),
        ),
      ],
    );
  }
}
