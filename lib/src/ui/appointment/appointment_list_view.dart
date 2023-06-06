import 'package:demo/src/core/app_constant.dart';
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
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(AppointmentProvider provider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              child: Text(
                "Yeni Randevu",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(RoutesKeys.appointmentNew)},
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.supervised_user_circle, size: 48),
                  title: Text(
                    provider.appointmentList[index].patient!.name! +
                        ' ' +
                        provider.appointmentList[index].patient!.surname!,
                  ),
                  subtitle: Text(provider.appointmentList[index].endDate!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          provider.changeAppointment(
                              provider.appointmentList[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.appointmentEdit);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          provider.changeAppointment(
                              provider.appointmentList[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.appointmentEdit);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: provider.appointmentList.length,
          ),
        ),
      ],
    );
  }
}
