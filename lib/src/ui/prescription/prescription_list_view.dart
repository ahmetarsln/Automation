import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/prescription.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

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
    prescriptions().then(
      (value) {
        setState(() {
          prescription2 = value;
        });
      },
    );
    final prescriptionProvider = Provider.of<PrescriptionProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Reçeteler"),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(prescription2[index].patient!.name! +
                  ' ' +
                  prescription2[index].patient!.surname!),
              subtitle: Text(prescription2[index].patient!.tc!.toString()),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          );
        },
        itemCount: prescription2.length,
      ),
    );
  }
}
