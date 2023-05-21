import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AnalysisListView extends StatefulWidget {
  const AnalysisListView({super.key});

  @override
  State<AnalysisListView> createState() => _AnalysisListViewState();
}

class _AnalysisListViewState extends State<AnalysisListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var analysis2 = <Analysis>[];

  @override
  Widget build(BuildContext context) {
    analyses().then(
      (value) {
        setState(() {
          analysis2 = value;
        });
      },
    );
    final analysisProvider = Provider.of<AnalysisProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(analysis2[index].patient!.name! +
                  ' ' +
                  analysis2[index].patient!.surname!),
              subtitle: Text(analysis2[index].patient!.tc!.toString()),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          );
        },
        itemCount: analysis2.length,
      ),
    );
  }
}
