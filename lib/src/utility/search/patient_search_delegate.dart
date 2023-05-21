import 'package:demo/src/data/models/patient.dart';
import 'package:flutter/material.dart';

class PatientSearchDelegate extends SearchDelegate<Patient> {
  final List<Patient> patients;

  PatientSearchDelegate({required this.patients});

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
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
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Patient(
              name: null,
              surname: null,
              tc: null,
              birthDate: 'null',
              gender: null,
            ));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final List<Patient> results = patients
        .where(
            (Patient e) => e.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(results);
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Patient e) {
        return ListTile(
          title: Text(e.name! + ' ' + e.surname!),
          onTap: () {
            close(context, e);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final List<Patient> suggestionList = query.isEmpty
        ? patients
        : patients
            .where((Patient e) =>
                e.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: suggestionList.map<Widget>((Patient e) {
        return ListTile(
          title: Text(e.name! + ' ' + e.surname!),
          onTap: () {
            close(context, e);
          },
        );
      }).toList(),
    );
  }
}
