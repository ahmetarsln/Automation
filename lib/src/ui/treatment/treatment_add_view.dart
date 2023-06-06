import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/appointment.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/data/models/treatment.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TreatmentAddView extends StatefulWidget {
  const TreatmentAddView({super.key});

  @override
  State<TreatmentAddView> createState() => _TreatmentAddViewState();
}

class _TreatmentAddViewState extends State<TreatmentAddView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Treatment treatment =
      Treatment(startDate: null, appointments: null, notes: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yeni Tedavi"),
      drawer: const CustomDrawer(),
      body: Consumer<TreatmentProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(TreatmentProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'başlangıç tarihi',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamz';
              }
              return null;
            },
            onChanged: (value) => treatment.startDate = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Bitiş tarihi',
            ),
            onChanged: (value) => treatment.endDate = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamz';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Randevu Giriniz',
            ),
            onChanged: (value) => treatment.appointments = [
              Appointment(
                  startDate: value,
                  endDate: value,
                  employe: null,
                  patient: null)
            ],
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamz';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Tedavi notu giriniz',
            ),
            onChanged: (value) => treatment.notes = [value],
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Bu Kısım Boş Olamz';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  provider.addTreatment(treatment);
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
