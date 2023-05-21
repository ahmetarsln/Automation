import 'package:flutter/material.dart';

import '../../data/models/analysis.dart';

class AnalysisSearchDelegate extends SearchDelegate<Analysis> {
  final List<Analysis> analysis;

  AnalysisSearchDelegate({required this.analysis});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(
          context,
          Analysis(
              patient: null,
              parameters: null,
              finishdate: null,
              notificationDate: null)),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text(analysis[index].patient!.name! +
                ' ' +
                analysis[index].patient!.surname!),
            subtitle: Text(analysis[index].patient!.surname!),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        );
      },
      itemCount: analysis.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(analysis);
    final suggestionList = query.isEmpty
        ? analysis
        : analysis.where((element) {
            print("burada");
            print(element.patient!.name);
            return element.patient!.name!.startsWith(query);
          }).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text(suggestionList[index].patient!.name! +
                ' ' +
                suggestionList[index].patient!.surname!),
            subtitle: Text(suggestionList[index].patient!.tc!.toString()),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
