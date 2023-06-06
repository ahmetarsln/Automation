import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/data/models/prescription.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PrescriptionAddView extends StatefulWidget {
  const PrescriptionAddView({super.key});

  @override
  State<PrescriptionAddView> createState() => _PrescriptionAddViewState();
}

class _PrescriptionAddViewState extends State<PrescriptionAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Prescription prescription = Prescription(
      id: null,
      medicationNames: null,
      date: null,
      employe: null,
      patient: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Reçete"),
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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'İlaç seçiniz',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => prescription.medicationNames = [value],
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Reçete tarihi',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => prescription.date = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Çalışan adı',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => prescription.employe = Employe(
                name: value,
                surname: value,
                tc: null,
                birthDate: null,
                gender: null,
                department: null),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Hasta adı',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => prescription.patient = Patient(
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
                  provider.addPrescription(prescription);
                }
              },
              child: const Text('Ekle'),
            ),
          ),
        ],
      ),
    );
  }
}
