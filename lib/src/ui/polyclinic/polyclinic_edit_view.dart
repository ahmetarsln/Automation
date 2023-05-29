import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../data/models/appointment.dart';

class PolyclinicEditView extends StatefulWidget {
  const PolyclinicEditView({super.key});
  @override
  State<PolyclinicEditView> createState() => _PolyclinicEditViewState();
}

class _PolyclinicEditViewState extends State<PolyclinicEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final polyclinicProvider = Provider.of<PolyclinicProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Polkiinik Düzenleme"),
      drawer: const CustomDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: Provider.of<PolyclinicProvider>(context)
                  .CurrentPolyclinic!
                  .name,
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
