import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/custom_app_bar.dart';

class EmployeAddView extends StatefulWidget {
  const EmployeAddView({super.key});

  @override
  State<EmployeAddView> createState() => _EmployeAddViewState();
}

class _EmployeAddViewState extends State<EmployeAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Employe employe = Employe(
      name: null,
      surname: null,
      tc: null,
      birthDate: null,
      gender: null,
      department: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Çalışan"),
      drawer: const CustomDrawer(),
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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Adınızı giriniz',
            ),
            onChanged: (value) => employe.name = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Burası boş girilemez';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Soyadınızı giriniz',
            ),
            onChanged: (value) => employe.surname = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Tcnizi giriniz',
            ),
            onChanged: (value) => employe.tc = int.tryParse(value),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Doğum tarihini giriniz',
            ),
            onChanged: (value) => employe.birthDate = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Cinsiyetinizi giriniz',
            ),
            onChanged: (value) => employe.gender = value == 'e',
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Bölümünüzü giriniz',
            ),
            onChanged: (value) => employe.department = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.addEmploye(employe);
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
