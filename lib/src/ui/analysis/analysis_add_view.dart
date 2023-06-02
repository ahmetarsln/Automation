import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/custom_app_bar.dart';
import '../../core/custom_drawer.dart';

class AnalysisAddView extends StatefulWidget {
  const AnalysisAddView({super.key});

  @override
  State<AnalysisAddView> createState() => _AnalysisAddViewState();
}

class _AnalysisAddViewState extends State<AnalysisAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Tahlil"),
      drawer: const CustomDrawer(),
      body: Consumer<AnalysisProvider>(
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
              hintText: 'Sonuç tarihi',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Hasta adı',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Parametreler',
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
