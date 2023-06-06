import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PrescriptionDeleteView extends StatefulWidget {
  const PrescriptionDeleteView({super.key});

  @override
  State<PrescriptionDeleteView> createState() => _PrescriptionDeleteViewState();
}

class _PrescriptionDeleteViewState extends State<PrescriptionDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Reçete Silme"),
      body: Consumer<PrescriptionProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(PrescriptionProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPrescription!.medicationNames![0],
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'İlaç seçiniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPrescription!.date,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Reçete tarihi',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPrescription!.employe!.name,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Çalışan adı',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPrescription!.patient!.name,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Hasta adı',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.deletePrescription(provider.CurrentPrescription!);
                }
              },
              child: const Text('Sil'),
            ),
          ),
        ],
      ),
    );
  }
}
