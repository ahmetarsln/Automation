import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AppointmentAddView extends StatefulWidget {
  const AppointmentAddView({super.key});

  @override
  State<AppointmentAddView> createState() => _AppointmentAddViewState();
}

class _AppointmentAddViewState extends State<AppointmentAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    patients();
    final appointmentProvider = Provider.of<AppointmentProvider>(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'başlangıç tarihi',
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
                hintText: 'Bitiş tarihi',
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
