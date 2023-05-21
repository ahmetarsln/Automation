import 'package:demo/src/data/models/polyclinic.dart';
import 'package:flutter/material.dart';

class PolyclinicSearchDelegate extends SearchDelegate<Polyclinic> {
  final List<Polyclinic> polyclinics;

  PolyclinicSearchDelegate({required this.polyclinics});

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
            Polyclinic(
              name: null,
              id: null,
              employeList: null,
            ));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Polyclinic> results = polyclinics
        .where((Polyclinic e) =>
            e.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(results);
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Polyclinic e) {
        return ListTile(
          title: Text(e.name!),
          onTap: () {
            close(context, e);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Polyclinic> results = polyclinics
        .where((Polyclinic e) =>
            e.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(results);
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Polyclinic e) {
        return ListTile(
          title: Text(e.name!),
          onTap: () {
            close(context, e);
          },
        );
      }).toList(),
    );
  }
}

