import 'package:demo/src/data/models/appointment.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/custom_app_bar.dart';
import '../../core/custom_drawer.dart';

class AppointmentListView extends StatefulWidget {
  const AppointmentListView({super.key});

  @override
  State<AppointmentListView> createState() => _AppointmentListViewState();
}

class _AppointmentListViewState extends State<AppointmentListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var appointment2 = <Appointment>[];

  @override
  Widget build(BuildContext context) {
    appointments().then(
      (value) {
        setState(() {
          appointment2 = value;
        });
      },
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "Randevular"),
      drawer: const CustomDrawer(),
      body: Consumer<AppointmentProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget()),
    );
  }

  Widget _bodyWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                appointment2[index].patient!.name! +
                    ' ' +
                    appointment2[index].patient!.surname!,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(appointment2[index].startDate! +
                  ' - ' +
                  appointment2[index].endDate!),
            ),
            trailing: Container(
              child: Icon(Icons.more_vert),
              height: double.infinity,
            ),
            isThreeLine: true,
          ),
        );
      },
      itemCount: appointment2.length,
    );
  }
}
