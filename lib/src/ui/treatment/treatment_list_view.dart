import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/treatment.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

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
    treatment().then(
      (value) {
        setState(() {
          treatment2 = value;
        });
      },
    );
    final treatmentProvider = Provider.of<TreatmentProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Reçeteler"),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(treatment2[index].notes![0]),
              subtitle: Text(treatment2[index].startDate!.toString()),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          );
        },
        itemCount: treatment2.length,
      ),
    );
  }
}
