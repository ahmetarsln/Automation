import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PatientEditView extends StatefulWidget {
  const PatientEditView({super.key});
  @override
  State<PatientEditView> createState() => _PatientEditViewState();
}

class _PatientEditViewState extends State<PatientEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Hasta Düzenleme"),
      body: Consumer<PatientProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(context, provider)),
    );
  }

  Widget _bodyWidget(BuildContext context, PatientProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: provider.CurrentPatient!.tc.toString(),
            decoration: const InputDecoration(
              hintText: 'Tcnizi girin',
            ),
            onChanged: (value) =>
                provider.CurrentPatient!.tc = int.tryParse(value),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu alan boş olamaz';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: provider.CurrentPatient!.name,
            decoration: const InputDecoration(
              hintText: 'Adınızı girin',
            ),
            onChanged: (value) => provider.CurrentPatient!.name = value,
          ),
          TextFormField(
            initialValue: provider.CurrentPatient!.surname,
            decoration: const InputDecoration(
              hintText: 'Soyadınız girin',
            ),
            onChanged: (value) => provider.CurrentPatient!.surname = value,
          ),
          TextFormField(
            initialValue: provider.CurrentPatient!.gender! ? 'e' : 'k',
            decoration: const InputDecoration(
              hintText: 'Cinsiyetinizi girin',
            ),
            onChanged: (value) =>
                provider.CurrentPatient!.gender = value == 'e',
          ),
          TextFormField(
            initialValue: provider.CurrentPatient!.birthDate,
            decoration: const InputDecoration(
              hintText: 'Doğum tarihinizi girin',
            ),
            onChanged: (value) => provider.CurrentPatient!.birthDate = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.updatePatient(provider.CurrentPatient!);
                  Navigator.of(context).pop();
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
