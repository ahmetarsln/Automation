import 'package:demo/src/data/models/treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TreatmentListView extends StatefulWidget {
  const TreatmentListView({super.key});

  @override
  State<TreatmentListView> createState() => _TreatmentListViewState();
}

class _TreatmentListViewState extends State<TreatmentListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var treatment2 = <Treatment>[];

  @override
  Widget build(BuildContext context) {
    // treatment().then(
    //   (value) {
    //     setState(() {
    //       appointment2 = value;
    //     });
    //   },
    // );
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(treatment2[index].toString()),
          );
        },
        itemCount: treatment2.length,
      ),
    );
  }
}