import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class EmployeDeleteView extends StatefulWidget {
  const EmployeDeleteView({super.key});

  @override
  State<EmployeDeleteView> createState() => _EmployeDeleteViewState();
}

class _EmployeDeleteViewState extends State<EmployeDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Çalışan Silme"),
      body: Consumer<EmployeProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(EmployeProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentEmploye!.name,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Adıızı giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentEmploye!.surname,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Soyadınız giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentEmploye!.tc.toString(),
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Tcnizi giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentEmploye!.birthDate,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Doğum tarihini giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentEmploye!.gender! ?'e':'k',
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Cinsiyetinizi giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentEmploye!.department,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Bölümünüzü giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.deleteEmploye(provider.CurrentEmploye!);
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
