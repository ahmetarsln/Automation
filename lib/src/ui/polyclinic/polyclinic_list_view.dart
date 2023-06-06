import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/polyclinic.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/app_constant.dart';

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
    polyclinic().then(
      (value) {
        setState(() {
          polyclinic2 = value;
        });
      },
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "Poliklinikler"),
      drawer: const CustomDrawer(),
      body: Consumer<PolyclinicProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(PolyclinicProvider provider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              child: const Text(
                "Yeni Poliklink",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(RoutesKeys.polyclinicNew)},
            ),
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.supervised_user_circle, size: 48),
                title: Text(polyclinic2[index].name!),
                subtitle: Text(polyclinic2[index].id!.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          provider.changePolyclinic(polyclinic2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.polyclinicEdit);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          provider.changePolyclinic(polyclinic2[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.polyclinicDelete);
                        },
                      ),
                  ],
                ),
                isThreeLine: true,
              ),
            );
          },
          itemCount: polyclinic2.length,
        ),
      ],
    );
  }
}
