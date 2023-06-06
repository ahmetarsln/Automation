import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../data/models/appointment.dart';

class EmployeEditView extends StatefulWidget {
  const EmployeEditView({super.key});
  @override
  State<EmployeEditView> createState() => _EmployeEditViewState();
}

class _EmployeEditViewState extends State<EmployeEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Çalışan Düzenleme"),
      drawer: const CustomDrawer(),
      body: Consumer<EmployeProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(context, provider)),
    );
  }

  Widget _bodyWidget(BuildContext context, EmployeProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: provider.CurrentEmploye!.name,
            decoration: const InputDecoration(
              hintText: 'Adınızı giriniz',
            ),
            onChanged: (value) => provider.CurrentEmploye!.name = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Burası boş girilemez';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: provider.CurrentEmploye!.surname,
            decoration: const InputDecoration(
              hintText: 'Soyadınız girin',
            ),
            onChanged: (value) => provider.CurrentEmploye!.surname = value,
          ),
          TextFormField(
            initialValue: provider.CurrentEmploye!.tc.toString(),
            decoration: const InputDecoration(
              hintText: 'Tcnizi girin',
            ),
            onChanged: (value) =>
                provider.CurrentEmploye!.tc = int.tryParse(value),
          ),
          TextFormField(
            initialValue: provider.CurrentEmploye!.birthDate,
            decoration: const InputDecoration(
              hintText: 'Doğum tarihini girin',
            ),
            onChanged: (value) => provider.CurrentEmploye!.birthDate = value,
          ),
          TextFormField(
            initialValue: provider.CurrentEmploye!.gender! ? 'e' : 'k',
            decoration: const InputDecoration(
              hintText: 'Cinsiyetinizi giriniz',
            ),
            onChanged: (value) =>
                provider.CurrentEmploye!.gender = value == 'e',
          ),
          TextFormField(
            initialValue: provider.CurrentEmploye!.department,
            decoration: const InputDecoration(
              hintText: 'Bölümünüzü giriniz',
            ),
            onChanged: (value) => provider.CurrentEmploye!.department = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.updateEmploye(provider.CurrentEmploye!);
                }
              },
              child: const Text('Düzenle'),
            ),
          ),
        ],
      ),
    );
  }
}
