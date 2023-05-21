import 'package:demo/src/data/models/employe.dart';
import 'package:flutter/material.dart';

class EmployeSearchDelegate extends SearchDelegate<Employe> {
  final List<Employe> employes;

  EmployeSearchDelegate({required this.employes});

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
              Employe(
                name: null,
                surname: null,
                tc: null,
                birthDate: null,
                department: null,
                gender: null,
              ));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Employe> results = employes
        .where(
            (Employe e) => e.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(results);
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: results.map<Widget>((Employe e) {
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
    final List<Employe> suggestionList = query.isEmpty
        ? employes
        : employes.where((Employe e) {
            print("burada");
            return e.name!.toLowerCase().contains(query.toLowerCase());
          }).toList();
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: suggestionList.map<Widget>((Employe e) {
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
