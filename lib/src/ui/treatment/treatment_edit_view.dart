import 'package:demo/src/data/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../data/models/appointment.dart';

class TreatmentEditView extends StatefulWidget {
  final Appointment appointment;
  const TreatmentEditView({super.key, required this.appointment});
  @override
  State<TreatmentEditView> createState() => _TreatmentEditViewState();
}

class _TreatmentEditViewState extends State<TreatmentEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.appointment.startDate.toString(),
              decoration: const InputDecoration(
                hintText: 'Başlangıç tarihi',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: widget.appointment.endDate.toString(),
              decoration: const InputDecoration(
                hintText: 'Bitiş tarihi',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: widget.appointment.patient!.name,
              decoration: const InputDecoration(
                hintText: 'Randevular',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: widget.appointment.patient!.name,
              decoration: const InputDecoration(
                hintText: 'Notlar',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
