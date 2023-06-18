import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/custom_app_bar.dart';
import '../../core/custom_drawer.dart';
import '../../data/models/appointment.dart';

class AppointmentEditView extends StatefulWidget {
  const AppointmentEditView({super.key});
  @override
  State<AppointmentEditView> createState() => _AppointmentEditViewState();
}

class _AppointmentEditViewState extends State<AppointmentEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Randevu Düzenleme"),
      body: Consumer<AppointmentProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(context, provider)),
    );
  }

  Widget _bodyWidget(BuildContext context, AppointmentProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: provider.CurrentAppointment!.startDate,
            decoration: const InputDecoration(
              hintText: 'Başlangıç tarihi',
            ),
            onChanged: (value) =>
                provider.CurrentAppointment!.startDate = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Burası boş kalamaz';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: provider.CurrentAppointment!.endDate,
            decoration: const InputDecoration(
              hintText: 'Bitiş tarihi',
            ),
            onChanged: (value) => provider.CurrentAppointment!.endDate = value,
          ),
          TextFormField(
            initialValue: provider.CurrentAppointment!.employe!.name,
            decoration: const InputDecoration(
              hintText: 'Çalışan',
            ),
            onChanged: (value) => provider.CurrentAppointment!.employe =
                Employe(
                    name: value,
                    surname: value,
                    tc: null,
                    birthDate: null,
                    gender: null,
                    department: null),
          ),
          TextFormField(
            initialValue: provider.CurrentAppointment!.patient!.name,
            decoration: const InputDecoration(
              hintText: 'Hasta',
            ),
            onChanged: (value) => provider.CurrentAppointment!.patient =
                Patient(
                    tc: null,
                    name: value,
                    surname: value,
                    birthDate: null,
                    gender: null),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.updateAppointment(provider.CurrentAppointment!);
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
