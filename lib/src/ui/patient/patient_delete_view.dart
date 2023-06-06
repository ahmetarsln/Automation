import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PatientDeleteView extends StatefulWidget {
  const PatientDeleteView({super.key});

  @override
  State<PatientDeleteView> createState() => _PatientDeleteViewState();
}

class _PatientDeleteViewState extends State<PatientDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Hasta Silme"),
      body: Consumer<PatientProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(PatientProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPatient!.name!,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Adınızı girin',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPatient!.surname!,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Soyadınız girin',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPatient!.gender! ?'e':'k',
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Cinsiyetinizi girin',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPatient!.birthDate,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Doğum tarihinizi girin',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.deletePatient(provider.CurrentPatient!);
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
