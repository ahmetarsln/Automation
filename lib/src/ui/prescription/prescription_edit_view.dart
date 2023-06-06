import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../data/models/appointment.dart';

class PrescriptionEditView extends StatefulWidget {
  const PrescriptionEditView({super.key});
  @override
  State<PrescriptionEditView> createState() => _PrescriptionEditViewState();
}

class _PrescriptionEditViewState extends State<PrescriptionEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Reçete Silme"),
      drawer: const CustomDrawer(),
      body: Consumer<PrescriptionProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(context, provider)),
    );
  }

  Widget _bodyWidget(BuildContext context, PrescriptionProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: provider.CurrentPrescription!.medicationNames![0],
            decoration: const InputDecoration(
              hintText: 'İlaç seçiniz',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) =>
                provider.CurrentPrescription!.medicationNames = [value],
          ),
          TextFormField(
            initialValue: provider.CurrentPrescription!.date,
            decoration: const InputDecoration(
              hintText: 'Reçete tarihi',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => provider.CurrentPrescription!.date = value,
          ),
          TextFormField(
            initialValue: provider.CurrentPrescription!.employe!.name,
            decoration: const InputDecoration(
              hintText: 'Çalışan adı',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => provider.CurrentPrescription!.employe =
                Employe(
                    name: value,
                    surname: value,
                    tc: null,
                    birthDate: null,
                    gender: null,
                    department: null),
          ),
          TextFormField(
            initialValue: provider.CurrentPrescription!.patient!.name,
            decoration: const InputDecoration(
              hintText: 'Hasta adı',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) =>
                provider.CurrentPrescription!.patient = Patient(
              name: value,
              surname: value,
              tc: null,
              birthDate: null,
              gender: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.updatePrescription(provider.CurrentPrescription!);
                }
              },
              child: const Text('Düzenle'),
            ),
          ),
        ],
      ),
    );
  }
}
