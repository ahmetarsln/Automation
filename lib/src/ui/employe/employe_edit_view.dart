import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../data/models/appointment.dart';

class EmployeEditView extends StatefulWidget {
  const EmployeEditView({super.key});
  @override
  State<EmployeEditView> createState() => _EmployeEditViewState();
}

class _EmployeEditViewState extends State<EmployeEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final employeProvider = Provider.of<EmployeProvider>(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: Provider.of<EmployeProvider>(context).CurrentEmploye!.birthDate!,
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
                hintText: 'Soyadınız girin',
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
