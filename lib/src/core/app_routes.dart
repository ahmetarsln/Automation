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
import 'package:demo/src/ui/auth/login_view.dart';
import 'package:demo/src/ui/auth/register_view.dart';
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

      case RoutesKeys.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesKeys.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case RoutesKeys.analysisNew:
        return MaterialPageRoute(builder: (_) => const AnalysisAddView());
      case RoutesKeys.analysisList:
        return MaterialPageRoute(builder: (_) => const AnalysisListView());
      case RoutesKeys.analysisEdit:
        return MaterialPageRoute(builder: (_) => const AnalysisEditView());
      case RoutesKeys.analysisDelete:
        return MaterialPageRoute(builder: (_) => const AnalysisDeleteView());

      case RoutesKeys.appointmentNew:
        return MaterialPageRoute(builder: (_) => const AppointmentAddView());
      case RoutesKeys.appointmentList:
        return MaterialPageRoute(builder: (_) => const AppointmentListView());
      case RoutesKeys.appointmentEdit:
        return MaterialPageRoute(builder: (_) => const AppointmentEditView());
      case RoutesKeys.appointmentDelete:
        return MaterialPageRoute(builder: (_) => const AppointmentDeleteView());

      case RoutesKeys.employeNew:
        return MaterialPageRoute(builder: (_) => const EmployeAddView());
      case RoutesKeys.employeList:
        return MaterialPageRoute(builder: (_) => const EmployeListView());
      case RoutesKeys.employeEdit:
        return MaterialPageRoute(builder: (_) => const EmployeEditView());
      case RoutesKeys.employeDelete:
        return MaterialPageRoute(builder: (_) => const EmployeDeleteView());

      case RoutesKeys.patientNew:
        return MaterialPageRoute(builder: (_) => const PatientAddView());
      case RoutesKeys.patientList:
        return MaterialPageRoute(builder: (_) => const PatientListView());
      case RoutesKeys.patientEdit:
        return MaterialPageRoute(builder: (_) => const PatientEditView());
      case RoutesKeys.patientDelete:
        return MaterialPageRoute(builder: (_) => const PatientDeleteView());

      case RoutesKeys.polyclinicNew:
        return MaterialPageRoute(builder: (_) => const PolyclinicAddView());
      case RoutesKeys.polyclinicList:
        return MaterialPageRoute(builder: (_) => const PolyclinicListView());
      case RoutesKeys.polyclinicEdit:
        return MaterialPageRoute(builder: (_) => const PolyclinicEditView());
      case RoutesKeys.polyclinicDelete:
        return MaterialPageRoute(builder: (_) => const PolyclinicDeleteView());

      case RoutesKeys.prescriptionNew:
        return MaterialPageRoute(builder: (_) => const PrescriptionAddView());
      case RoutesKeys.prescriptionList:
        return MaterialPageRoute(builder: (_) => const PrescriptionListView());
      case RoutesKeys.prescriptionEdit:
        return MaterialPageRoute(builder: (_) => const PrescriptionEditView());
      case RoutesKeys.prescriptionDelete:
        return MaterialPageRoute(
            builder: (_) => const PrescriptionDeleteView());

      case RoutesKeys.treatmentNew:
        return MaterialPageRoute(builder: (_) => const TreatmentAddView());
      case RoutesKeys.treatmentList:
        return MaterialPageRoute(builder: (_) => const TreatmentListView());
      case RoutesKeys.treatmentEdit:
        return MaterialPageRoute(builder: (_) => const TreatmentEditView());
      case RoutesKeys.treatmentDelete:
        return MaterialPageRoute(builder: (_) => const TreatmentDeleteView());

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
