import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PatientAddView extends StatefulWidget {
  const PatientAddView({super.key});

  @override
  State<PatientAddView> createState() => _PatientAddViewState();
}

class _PatientAddViewState extends State<PatientAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Patient patient = Patient(
      tc: null, name: null, surname: null, birthDate: null, gender: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Hasta"),
      drawer: const CustomDrawer(),
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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Tcnizi giriniz',
            ),
            onChanged: (value) => patient.tc = int.tryParse(value),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu alan boş girilemez';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Adınızı girin',
            ),
            onChanged: (value) => patient.name = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Soyadınız girin',
            ),
            onChanged: (value) => patient.surname = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Cinsiyetinizi girin',
            ),
            onChanged: (value) => patient.gender = value == 'e',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Doğum tarihinizi girin',
            ),
            onChanged: (value) => patient.birthDate = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.addPatient(patient);
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
