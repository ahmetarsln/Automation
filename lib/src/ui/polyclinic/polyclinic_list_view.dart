import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/polyclinic.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

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
    final polyclinicProvider = Provider.of<PolyclinicProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Poliklinikler"),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(polyclinic2[index].name!),
              subtitle: Text(polyclinic2[index].id!.toString()),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          );
        },
        itemCount: polyclinic2.length,
      ),
    );
  }
}
