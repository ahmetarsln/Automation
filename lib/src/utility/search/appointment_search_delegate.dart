import 'package:flutter/material.dart';

import '../../data/models/appointment.dart';

class AppointmentSearchDelegate extends SearchDelegate<Appointment> {
  final List<Appointment> appointments;

  AppointmentSearchDelegate(this.appointments);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        tooltip: 'Back',
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(
              context,
              Appointment(
                  employe: null,
                  patient: null,
                  startDate: null,
                  endDate: null));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Appointment> results = appointments
        .where((Appointment a) =>
            a.patient!.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Appointment a) {
        return ListTile(
          title: Text(a.patient!.name! + ' ' + a.patient!.surname!),
          onTap: () {
            close(context, a);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Appointment> results = appointments
        .where((Appointment a) =>
            a.patient!.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Appointment a) {
        return ListTile(
          title: Text(a.patient!.name! + ' ' + a.patient!.surname!),
          onTap: () {
            close(context, a);
          },
        );
      }).toList(),
    );
  }
}
