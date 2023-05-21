import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class EmployeListView extends StatefulWidget {
  const EmployeListView({super.key});

  @override
  State<EmployeListView> createState() => _EmployeListViewState();
}

class _EmployeListViewState extends State<EmployeListView> {
  late var employe2 = <Employe>[];

  @override
  Widget build(BuildContext context) {
    employes().then(
      (value) {
        setState(() {
          employe2 = value;
        });
      },
    );
    final employeProvider = Provider.of<EmployeProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(employe2[index].tc.toString()),
          );
        },
        itemCount: employe2.length,
      ),
    );
  }
}
