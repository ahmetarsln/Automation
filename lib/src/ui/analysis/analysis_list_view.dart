import 'package:demo/src/data/models/analysis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


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
    // analysis().then(
    //   (value) {
    //     setState(() {
    //       analysis2 = value;
    //     });
    //   },
    // );
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(analysis2[index].finishdate.toString()),
          );
        },
        itemCount: analysis2.length,
      ),
    );
  }
}
