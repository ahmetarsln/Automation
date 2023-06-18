import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../data/models/appointment.dart';

class PolyclinicEditView extends StatefulWidget {
  const PolyclinicEditView({super.key});
  @override
  State<PolyclinicEditView> createState() => _PolyclinicEditViewState();
}

class _PolyclinicEditViewState extends State<PolyclinicEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Polkiinik Düzenleme"),
      body: Consumer<PolyclinicProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(context, provider)),
    );
  }

  Widget _bodyWidget(BuildContext context, PolyclinicProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: provider.CurrentPolyclinic!.name,
            decoration: const InputDecoration(
              hintText: 'Poliklinik Adını Giriniz',
            ),
            onChanged: (value) => provider.CurrentPolyclinic!.name = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Bırakılamaz';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: provider.CurrentPolyclinic!.employeList![0].name,
            decoration: const InputDecoration(
              hintText: 'Çalışan seçiniz',
            ),
            onChanged: (value) => provider.CurrentPolyclinic!.employeList = [
              Employe(
                  name: value,
                  surname: value,
                  tc: null,
                  birthDate: null,
                  gender: true,
                  department: null)
            ],
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Bırakılamaz';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.updatePolyclinic(provider.CurrentPolyclinic!);
                  Navigator.of(context).pop();
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
