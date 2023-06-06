import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/app_constant.dart';

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

    return Scaffold(
      appBar: const CustomAppBar(title: "Çalışan Listesi"),
      drawer: const CustomDrawer(),
      body: Consumer<EmployeProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(EmployeProvider provider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              child: Text(
                "Yeni Çalışan",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(RoutesKeys.employeNew)},
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.supervised_user_circle, size: 48),
                  title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(employe2[index].tc.toString())),
                  subtitle: Text(employe2[index].name!.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          provider.changeEmploye(employe2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.employeEdit);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          provider.changeEmploye(employe2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.employeDelete);
                        },
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
            itemCount: employe2.length,
          ),
        ),
      ],
    );
  }
}
