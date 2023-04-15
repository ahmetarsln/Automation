import 'package:demo/src/data/models/prescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrescriptionListView extends StatefulWidget {
  const PrescriptionListView({super.key});

  @override
  State<PrescriptionListView> createState() => _PrescriptionListViewState();
}

class _PrescriptionListViewState extends State<PrescriptionListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var prescription2 = <Prescription>[];

  @override
  Widget build(BuildContext context) {
    // prescription().then(
    //   (value) {
    //     setState(() {
    //       prescription2 = value;
    //     });
    //   },
    // );
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(prescription2[index].employe.toString()),
          );
        },
        itemCount: prescription2.length,
      ),
    );
  }
}