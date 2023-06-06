import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
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
  Analysis analysis = Analysis(
    parameters: null,
    patient: null,
    notificationDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Tahlil"),
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
            initialValue: DateFormat('yyyy-MM-dd').format(DateTime.now()),
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
            onChanged: (newValue) => analysis.patient = Patient(
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
                if (_formKey.currentState!.validate()) {
                  provider.addAnalysis(analysis);
                  Navigator.of(context).pop();
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
