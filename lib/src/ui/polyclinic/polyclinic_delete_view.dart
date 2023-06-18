import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PolyclinicDeleteView extends StatefulWidget {
  const PolyclinicDeleteView({super.key});

  @override
  State<PolyclinicDeleteView> createState() => _PolyclinicDeleteViewState();
}

class _PolyclinicDeleteViewState extends State<PolyclinicDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Poliklinik Silme"),
      body: Consumer<PolyclinicProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(PolyclinicProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPolyclinic!.name,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Poliklinik Adını Giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentPolyclinic!.employeList![0].name,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Çalışan seçiniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.deletePolyclinic(provider.CurrentPolyclinic!);
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
