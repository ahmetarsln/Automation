import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AppointmentDeleteView extends StatefulWidget {
  const AppointmentDeleteView({super.key});

  @override
  State<AppointmentDeleteView> createState() => _AppointmentDeleteViewState();
}

class _AppointmentDeleteViewState extends State<AppointmentDeleteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Randevu Silme"),
      body: Consumer<AppointmentProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(AppointmentProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentAppointment!.startDate,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Başlangıç tarihi',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentAppointment!.endDate,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Bitiş tarihi',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentAppointment!.employe!.name,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Çalışan',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              initialValue: provider.CurrentAppointment!.patient!.name,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Hasta',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.deleteAppointment(provider.CurrentAppointment!);
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
