import 'package:demo/src/data/models/prescription.dart';
import 'package:flutter/material.dart';

class PrescriptionSearchDelegate extends SearchDelegate<Prescription> {
  final List<Prescription> prescriptions;

  PrescriptionSearchDelegate({required this.prescriptions});

  @override
  List<Widget>? buildActions(BuildContext context) {
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
            Prescription(
              id: null,
              medicationNames: null,
              date: null,
              employe: null,
              patient: null
            ));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Prescription> results = prescriptions
        .where((Prescription e) =>
            e.date!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(results);
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Prescription e) {
        return ListTile(
          title: Text(e.date!),
          onTap: () {
            close(context, e);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: prescriptions.map<Widget>((Prescription e) {
        return ListTile(
          title: Text(e.date!),
          onTap: () {
            close(context, e);
          },
        );
      }).toList(),
    );
  }
}
