import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Tahlliler'),
            onTap: () {
              Provider.of<AnalysisProvider>(context, listen: false)
                  .fetchAnalyses();
              Navigator.of(context).pushNamed(RoutesKeys.analysisList);
            },
          ),
          ListTile(
            title: const Text('Randevular'),
            onTap: () {
              Provider.of<AppointmentProvider>(context, listen: false)
                  .fetchAppointments();
              Navigator.of(context).pushNamed(RoutesKeys.appointmentList);
            },
          ),
          ListTile(
            title: const Text('Çalışanlar'),
            onTap: () {
              Provider.of<EmployeProvider>(context, listen: false)
                  .fetchEmployes();
              Navigator.of(context).pushNamed(RoutesKeys.employeList);
            },
          ),
          ListTile(
            title: const Text('Hastalar'),
            onTap: () {
              Provider.of<PatientProvider>(context, listen: false)
                  .fetchPatients();
              Navigator.of(context).pushNamed(RoutesKeys.patientList);
            },
          ),
          ListTile(
            title: const Text('Poliklinikler'),
            onTap: () {
              Provider.of<PolyclinicProvider>(context, listen: false)
                  .fetchPolyclinics();
              Navigator.of(context).pushNamed(RoutesKeys.polyclinicList);
            },
          ),
          ListTile(
            title: const Text('Reçeteler'),
            onTap: () {
              Provider.of<PrescriptionProvider>(context, listen: false)
                  .fetchPrescriptions();
              Navigator.of(context).pushNamed(RoutesKeys.prescriptionList);
            },
          ),
          ListTile(
            title: const Text('Tedaviler'),
            onTap: () {
              Provider.of<TreatmentProvider>(context, listen: false)
                  .fetchTreatments();
              Navigator.of(context).pushNamed(RoutesKeys.treatmentList);
            },
          ),
        ],
      ),
    );
  }
}
