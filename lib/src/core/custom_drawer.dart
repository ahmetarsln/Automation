import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
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
              Navigator.of(context).pushNamed(RoutesKeys.appointmentList);
            },
          ),
          ListTile(
            title: const Text('Çalışanlar'),
            onTap: () {
              Navigator.of(context).pushNamed(RoutesKeys.employeList);
            },
          ),
          ListTile(
            title: const Text('Hastalar'),
            onTap: () {
              Navigator.of(context).pushNamed(RoutesKeys.patientList);
            },
          ),
          ListTile(
            title: const Text('Poliklinikler'),
            onTap: () {
              Navigator.of(context).pushNamed(RoutesKeys.polyclinicList);
            },
          ),
          ListTile(
            title: const Text('Reçeteler'),
            onTap: () {
              Navigator.of(context).pushNamed(RoutesKeys.prescriptionList);
            },
          ),
          ListTile(
            title: const Text('Tedaviler'),
            onTap: () {
              Navigator.of(context).pushNamed(RoutesKeys.treatmentList);
            },
          ),
        ],
      ),
    );
  }
}
