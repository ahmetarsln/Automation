import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/core/app_routes.dart';
import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/data/models/employe.dart';
import 'package:demo/src/data/models/patient.dart';
import 'package:demo/src/ui/analysis/analysis_add_view.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:demo/src/ui/appointment/appointment_add_view.dart';
import 'package:demo/src/ui/appointment/appointment_delete_view.dart';
import 'package:demo/src/ui/appointment/appointment_list_view.dart';
import 'package:demo/src/ui/appointment/appointment_provider.dart';
import 'package:demo/src/ui/employe/employe_add_view.dart';
import 'package:demo/src/ui/employe/employe_list_view.dart';
import 'package:demo/src/ui/employe/employe_provider.dart';
import 'package:demo/src/ui/patient/patient_add_view.dart';
import 'package:demo/src/ui/patient/patient_delete_view.dart';
import 'package:demo/src/ui/patient/patient_edit_view.dart';
import 'package:demo/src/ui/patient/patient_list_view.dart';
import 'package:demo/src/ui/patient/patient_provider.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_add_view.dart';
import 'package:demo/src/ui/polyclinic/polyclinic_provider.dart';
import 'package:demo/src/ui/prescription/prescription_add_view.dart';
import 'package:demo/src/ui/prescription/prescription_provider.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:demo/src/utility/search/analysis_search_delegate.dart';
import 'package:demo/src/utility/search/employe_search_delegate.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'package:demo/src/ui/treatment/treatment_add_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AnalysisProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppointmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmployeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PolyclinicProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PrescriptionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TreatmentProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesKeys.home,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

class _SearchState extends StatelessWidget {
  String? _sortValue;
  String _ascValue = "ASC";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: employes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data as List<Employe>;
              return Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      forceElevated: true,
                      elevation: 4,
                      floating: true,
                      snap: true,
                      title: Text(
                        "Search App",
                      ),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.search,
                          ),
                          onPressed: () async {
                            final result = await showSearch(
                              context: context,
                              delegate:
                                  EmployeSearchDelegate(employes: data ?? []),
                            );
                            if (result != null)
                              print(result.name! + " " + result.surname!);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.filter_list,
                          ),
                          onPressed: () {
                            showFilterDialog(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  "No data found",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<void> showFilterDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext build) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Center(
                  child: Text(
                "Filter",
              )),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 12, right: 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.sort,
                              color: Color(0xff808080),
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: Text("Sort by"),
                                items: <String>[
                                  "Name",
                                  "Age",
                                  "Date",
                                ].map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                                value: _sortValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _sortValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8, right: 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.sort_by_alpha,
                              color: Color(0xff808080),
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                items: <String>[
                                  "ASC",
                                  "DESC",
                                ].map((String value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                      ));
                                }).toList(),
                                value: _ascValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _ascValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
