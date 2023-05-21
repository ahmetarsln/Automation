import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TreatmentAddView extends StatefulWidget {
  const TreatmentAddView({super.key});

  @override
  State<TreatmentAddView> createState() => _TreatmentAddViewState();
}

class _TreatmentAddViewState extends State<TreatmentAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    patients();
    final treatmentProvider = Provider.of<TreatmentProvider>(context);

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TreatmentProvider(),)],
      child: Scaffold(
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
                  hintText: 'Randevu Giriniz',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Tedavi notu giriniz',
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
      ),
    );
  }
}
