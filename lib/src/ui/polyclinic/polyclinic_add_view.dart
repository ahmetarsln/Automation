import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/polyclinic.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class PolyclinicAddView extends StatefulWidget {
  const PolyclinicAddView({super.key});

  @override
  State<PolyclinicAddView> createState() => _PolyclinicAddViewState();
}

class _PolyclinicAddViewState extends State<PolyclinicAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Polyclinic polyclinic = Polyclinic(id: null, name: null, employeList: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Poliklinik"),
      drawer: const CustomDrawer(),
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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Poliklinik Adını Giriniz',
            ),
            onChanged: (value) => polyclinic.name = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Bırakılamaz';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Çalışan seçiniz',
            ),
            onChanged: (value) => polyclinic.employeList = [
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
                  provider.addPolyclinic(polyclinic);
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
