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

  @override
  Widget build(BuildContext context) {
    patients();
    final patientProvider = Provider.of<PatientProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Hasta"),
      drawer: const CustomDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Tcnizi girin',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Adınızı girin',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Soyadınız girin',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cinsiyetinizi girin',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Doğum tarihinizi girin',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    print("validation complete");
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
