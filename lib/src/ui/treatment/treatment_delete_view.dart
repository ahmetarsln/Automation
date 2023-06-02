import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TreatmentDeleteView extends StatefulWidget {
  const TreatmentDeleteView({super.key});

  @override
  State<TreatmentDeleteView> createState() => _TreatmentDeleteViewState();
}

class _TreatmentDeleteViewState extends State<TreatmentDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: const CustomAppBar(title: "Reçete Silme"),
      drawer: const CustomDrawer(),
      body: Consumer<TreatmentProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget()),
    );
  }

  Widget _bodyWidget() {
    return Form(
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
                hintText: 'Randevu tarihi',
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
                hintText: 'Notlar',
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
    );
  }
}
