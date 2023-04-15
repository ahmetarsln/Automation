import 'package:demo/src/data/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EmployeAddView extends StatefulWidget {
  const EmployeAddView({super.key});

  @override
  State<EmployeAddView> createState() => _EmployeAddViewState();
}

class _EmployeAddViewState extends State<EmployeAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    patients();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Adınızı girin',
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
                hintText: 'Soyadınızı girin',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Tcnizi girin',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Doğum tarihini giriniz',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cinsiyetinizi giriniz',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Bölümünüzü giriniz',
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
