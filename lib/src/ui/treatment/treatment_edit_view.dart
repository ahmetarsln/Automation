import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../data/models/appointment.dart';

class TreatmentEditView extends StatefulWidget {
  const TreatmentEditView({super.key});
  @override
  State<TreatmentEditView> createState() => _TreatmentEditViewState();
}

class _TreatmentEditViewState extends State<TreatmentEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Reçete Düzenleme"),
      drawer: const CustomDrawer(),
      body: Consumer<TreatmentProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(context, provider)),
    );
  }

  Widget _bodyWidget(BuildContext context, TreatmentProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: provider.CurrentTreatment!.startDate,
            decoration: const InputDecoration(
              hintText: 'Başlangıç tarihi',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => provider.CurrentTreatment!.startDate = value,
          ),
          TextFormField(
            initialValue: provider.CurrentTreatment!.endDate,
            decoration: const InputDecoration(
              hintText: 'Bitiş tarihi',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => provider.CurrentTreatment!.endDate = value,
          ),
          TextFormField(
            initialValue: provider.CurrentTreatment!.appointments![0].startDate,
            decoration: const InputDecoration(
              hintText: 'Randevular',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) =>
                provider.CurrentTreatment!.appointments ==
                [
                  Appointment(
                      startDate: value,
                      endDate: value,
                      employe: null,
                      patient: null)
                ],
          ),
          TextFormField(
            initialValue: provider.CurrentTreatment!.notes![0],
            decoration: const InputDecoration(
              hintText: 'Notlar',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamaz';
              }
              return null;
            },
            onChanged: (value) => provider.CurrentTreatment!.notes = [value],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.updateTreatment(provider.CurrentTreatment!);
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
