import 'package:demo/src/data/models/treatment.dart';
import 'package:flutter/material.dart';

class TreatmentSearchDelegate extends SearchDelegate<Treatment> {
  final List<Treatment> treatments;

  TreatmentSearchDelegate({required this.treatments});

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
      tooltip: "Back",
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context,
            Treatment(startDate: null, appointments: null, notes: null));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Treatment> results = treatments
        .where((Treatment e) =>
            e.startDate!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(results);
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Treatment e) {
        return ListTile(
          title: Text(e.startDate!),
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
      children: treatments.map<Widget>((Treatment e) {
        return ListTile(
          title: Text(e.startDate!),
          onTap: () {
            close(context, e);
          },
        );
      }).toList(),
    );
  }
}
