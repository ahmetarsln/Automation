import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class EmployeDeleteView extends StatefulWidget {
  const EmployeDeleteView({super.key});

  @override
  State<EmployeDeleteView> createState() => _EmployeDeleteViewState();
}

class _EmployeDeleteViewState extends State<EmployeDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    patients();
    final employeProvider = Provider.of<EmployeProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Çalışan Silme"),
      drawer: const CustomDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                initialValue: "taoeo",
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Başlangıç tarihi',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                initialValue: "taoeo",
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Bitiş tarihi',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                initialValue: "taoeo",
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Çalışan',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                initialValue: "taoeo",
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Hasta',
                  border: OutlineInputBorder(),
                ),
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
