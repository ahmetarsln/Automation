import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/custom_app_bar.dart';
import '../../core/custom_drawer.dart';

class AnalysisDeleteView extends StatefulWidget {
  const AnalysisDeleteView({super.key});

  @override
  State<AnalysisDeleteView> createState() => _AnalysisDeleteViewState();
}

class _AnalysisDeleteViewState extends State<AnalysisDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Tahlil Silme"),
      body: Consumer<AnalysisProvider>(
        builder: (context, provider, child) => provider.isLoading
            ? const Center(
                child: Text("Yükleniyor"),
              )
            : _bodyWidget(provider),
      ),
    );
  }

  Widget _bodyWidget(AnalysisProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentAnalysis!.notificationDate!,
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
              initialValue: provider.CurrentAnalysis!.finishdate!,
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
              initialValue: provider.CurrentAnalysis!.patient!.name! +
                  " " +
                  provider.CurrentAnalysis!.patient!.surname!,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Hasta',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentAnalysis!.parameters!,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Parametreler',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.deleteAnalysis(provider.CurrentAnalysis!);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Sil'),
            ),
          ),
        ],
      ),
    );
  }
}
