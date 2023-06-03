import 'package:demo/src/data/models/analysis.dart';
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
  Analysis analysis = Analysis(parameters: null, patient: null);

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
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(AnalysisProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'başlangıç tarih',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
            onChanged: (newValue) => analysis.notificationDate = newValue,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Sonuç tarihi',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
            onChanged: (newValue) => analysis.finishdate = newValue,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Hasta adı',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
            onChanged: (newValue) => analysis.patient = new Patient(
                name: newValue,
                surname: newValue,
                birthDate: null,
                gender: null,
                tc: null),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Parametreler',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
            onChanged: (newValue) => analysis.parameters = newValue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  provider.addAnalysis(analysis);
                  print("validation complete");
                }
              },
              child: const Text('Ekle'),
            ),
          ),
        ],
      ),
    );
  }
}
