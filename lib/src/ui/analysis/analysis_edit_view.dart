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

  Widget _bodyWidget(AnalysisProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: provider.CurrentAnalysis!.parameters,
            decoration: const InputDecoration(
              hintText: 'Parametreleri Giriniz',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: provider.CurrentAnalysis!.patient!.name! +
                " " +
                provider.CurrentAnalysis!.patient!.surname!,
            decoration: const InputDecoration(
              hintText: 'Hastayı giriniz',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: provider.CurrentAnalysis!.notificationDate!,
            decoration: const InputDecoration(
              hintText: 'Başlangıç tarihi giriniz',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: provider.CurrentAnalysis!.finishdate,
            decoration: const InputDecoration(
              hintText: 'Sonuç tarihi giriniz',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu kısım boş olamaz';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.updateAnalysis(provider.CurrentAnalysis!);
                }
              },
              child: const Text('Kaydet'),
            ),
          ),
        ],
      ),
    );
  }
}
