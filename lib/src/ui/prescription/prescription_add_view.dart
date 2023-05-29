import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
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

  @override
  Widget build(BuildContext context) {
    patients();
    final prescriptionProvider = Provider.of<PrescriptionProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Reçete"),
      drawer: const CustomDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'İlaç seçiniz',
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
                hintText: 'Reçete tarihi',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Çalışan adı',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Hasta adı',
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
