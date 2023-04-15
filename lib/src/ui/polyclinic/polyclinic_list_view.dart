import 'package:demo/src/data/models/polyclinic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PolyclinicListView extends StatefulWidget {
  const PolyclinicListView({super.key});

  @override
  State<PolyclinicListView> createState() => _PolyclinicListViewState();
}

class _PolyclinicListViewState extends State<PolyclinicListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var polyclinic2 = <Polyclinic>[];

  @override
  Widget build(BuildContext context) {
    // polyclinic().then(
    //   (value) {
    //     setState(() {
    //       polyclinic2 = value;
    //     });
    //   },
    // );
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(polyclinic2[index].employeList.toString()),
          );
        },
        itemCount: polyclinic2.length,
      ),
    );
  }
}