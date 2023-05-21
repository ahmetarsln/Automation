import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/ui/analysis/analysis_add_view.dart';
import 'package:demo/src/ui/analysis/analysis_delete_view.dart';
import 'package:demo/src/ui/analysis/analysis_edit_view.dart';
import 'package:demo/src/ui/analysis/analysis_list_view.dart';
import 'package:demo/src/ui/appointment/appointment_add_view.dart';
import 'package:demo/src/ui/appointment/appointment_delete_view.dart';
import 'package:demo/src/ui/appointment/appointment_edit_view.dart';
import 'package:demo/src/ui/appointment/appointment_list_view.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:demo/src/ui/employe/employe_add_view.dart';
import 'package:demo/src/ui/employe/employe_delete_view.dart';
import 'package:demo/src/ui/employe/employe_edit_view.dart';
import 'package:demo/src/ui/employe/employe_list_view.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:demo/src/ui/home/home_view.dart';
import 'package:demo/src/ui/patient/patient_add_view.dart';
import 'package:demo/src/ui/patient/patient_delete_view.dart';
import 'package:demo/src/ui/patient/patient_edit_view.dart';
import 'package:demo/src/ui/patient/patient_list_view.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_add_view.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_delete_view.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_edit_view.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_list_view.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:demo/src/ui/prescription/prescription_add_view.dart';
import 'package:demo/src/ui/prescription/prescription_delete_view.dart';
import 'package:demo/src/ui/prescription/prescription_edit_view.dart';
import 'package:demo/src/ui/prescription/prescription_list_view.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:demo/src/ui/treatment/treatment_add_view.dart';
import 'package:demo/src/ui/treatment/treatment_delete_view.dart';
import 'package:demo/src/ui/treatment/treatment_edit_view.dart';
import 'package:demo/src/ui/treatment/treatment_list_view.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../ui/analysis/analysis_provider.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesKeys.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case RoutesKeys.analysisNew:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                      create: (context) => AnalysisProvider())
                ], child: const AnalysisAddView()));
      case RoutesKeys.analysisList:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => AnalysisProvider(),
                  )
                ], child: const AnalysisListView()));
      case RoutesKeys.analysisEdit:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => AnalysisProvider(),
                  )
                ], child: const AnalysisEditView()));
      case RoutesKeys.analysisDelete:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => AnalysisProvider(),
                  )
                ], child: const AnalysisDeleteView()));

      case RoutesKeys.appointmentNew:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => AppointmentProvider(),
                  )
                ], child: const AppointmentAddView()));
      case RoutesKeys.appointmentList:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => AppointmentProvider(),
                  )
                ], child: const AppointmentListView()));
      case RoutesKeys.appointmentEdit:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => AppointmentProvider(),
                  )
                ], child: const AppointmentEditView()));
      case RoutesKeys.appointmentDelete:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => AppointmentProvider(),
                  )
                ], child: const AppointmentDeleteView()));

      case RoutesKeys.employeNew:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => EmployeProvider(),
                  )
                ], child: const EmployeAddView()));
      case RoutesKeys.employeList:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => EmployeProvider(),
                  )
                ], child: const EmployeListView()));
      case RoutesKeys.employeEdit:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => EmployeProvider(),
                  )
                ], child: const EmployeEditView()));
      case RoutesKeys.employeDelete:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => EmployeProvider(),
                  )
                ], child: const EmployeDeleteView()));

      case RoutesKeys.patientNew:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PatientProvider(),
                  )
                ], child: const PatientAddView()));
      case RoutesKeys.patientList:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PatientProvider(),
                  )
                ], child: const PatientListView()));
      case RoutesKeys.patientEdit:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PatientProvider(),
                  )
                ], child: const PatientEditView()));
      case RoutesKeys.patientDelete:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PatientProvider(),
                  )
                ], child: const PatientDeleteView()));

      case RoutesKeys.polyclinicNew:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PolyclinicProvider(),
                  )
                ], child: const PolyclinicAddView()));
      case RoutesKeys.polyclinicList:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PolyclinicProvider(),
                  )
                ], child: const PolyclinicListView()));
      case RoutesKeys.polyclinicEdit:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PolyclinicProvider(),
                  )
                ], child: const PolyclinicEditView()));
      case RoutesKeys.polyclinicDelete:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PolyclinicProvider(),
                  )
                ], child: const PolyclinicDeleteView()));

      case RoutesKeys.prescriptionNew:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PrescriptionProvider(),
                  )
                ], child: const PrescriptionAddView()));
      case RoutesKeys.prescriptionList:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PrescriptionProvider(),
                  )
                ], child: const PrescriptionListView()));
      case RoutesKeys.prescriptionEdit:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PrescriptionProvider(),
                  )
                ], child: const PrescriptionEditView()));
      case RoutesKeys.prescriptionDelete:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => PrescriptionProvider(),
                  )
                ], child: const PrescriptionDeleteView()));

      case RoutesKeys.treatmentNew:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => TreatmentProvider(),
                  )
                ], child: const TreatmentAddView()));
      case RoutesKeys.treatmentList:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => TreatmentProvider(),
                  )
                ], child: const TreatmentListView()));
      case RoutesKeys.treatmentEdit:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => TreatmentProvider(),
                  )
                ], child: const TreatmentEditView()));
      case RoutesKeys.treatmentDelete:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider(
                    create: (context) => TreatmentProvider(),
                  )
                ], child: const TreatmentDeleteView()));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('404 sayfa bulunanmadı'),
            ),
          ),
        );
    }
  }
}
