import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
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
      appBar: const CustomAppBar(title: "Çalışan Listesi"),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(employe2[index].tc.toString()),
              leading: const FlutterLogo(size: 72.0),
              subtitle: Text(employe2[index].name!.toString()),
              trailing: const Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          );
        },
        itemCount: employe2.length,
      ),
    );
  }
}
