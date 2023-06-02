import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/custom_app_bar.dart';
import '../../core/custom_drawer.dart';
import '../../data/models/appointment.dart';

class AnalysisEditView extends StatefulWidget {
  const AnalysisEditView({super.key});
  @override
  State<AnalysisEditView> createState() => _AnalysisEditViewState();
}

class _AnalysisEditViewState extends State<AnalysisEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Tahlil Düzenleme"),
      drawer: const CustomDrawer(),
      body: Consumer<AnalysisProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(AnalysisProvider value) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: value.CurrentAnalysis!.patient!.name!,
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
    );
  }
}
