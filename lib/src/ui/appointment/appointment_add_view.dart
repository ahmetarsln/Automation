import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/appointment.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AppointmentAddView extends StatefulWidget {
  const AppointmentAddView({super.key});

  @override
  State<AppointmentAddView> createState() => _AppointmentAddViewState();
}

class _AppointmentAddViewState extends State<AppointmentAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Appointment appointment =
      Appointment(startDate: null, endDate: null, employe: null, patient: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Randevu"),
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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'başlangıç tarihi',
            ),
            onChanged: (value) => appointment.startDate = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Burası boş girilemez';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Bitiş tarihi',
            ),
            onChanged: (value) => appointment.endDate = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Burası boş girilemez';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Çalışan adı',
            ),
            onChanged: (value) => appointment.employe = Employe(
                name: value,
                surname: value,
                tc: null,
                birthDate: null,
                gender: null,
                department: null),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Burası boş girilemez';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Hasta adı',
            ),
            onChanged: (value) => appointment.patient = Patient(
                tc: null,
                name: value,
                surname: value,
                birthDate: null,
                gender: null),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Burası boş girilemez';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  provider.addAppointment(appointment);
                  provider.fetchAppointments();
                  Navigator.of(context).pop();
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
