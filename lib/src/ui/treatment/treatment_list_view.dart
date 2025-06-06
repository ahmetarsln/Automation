import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/treatment.dart';
import 'package:demo/src/ui/treatment/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../core/app_constant.dart';

class TreatmentListView extends StatefulWidget {
  const TreatmentListView({super.key});

  @override
  State<TreatmentListView> createState() => _TreatmentListViewState();
}

class _TreatmentListViewState extends State<TreatmentListView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Tedaviler"),
      drawer: const CustomDrawer(),
      body: Consumer<TreatmentProvider>(
          builder: (context, provider, child) => provider.isLoading
              ? const Center(
                  child: Text("Yükleniyor"),
                )
              : _bodyWidget(provider)),
    );
  }

  Widget _bodyWidget(TreatmentProvider provider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              child: const Text(
                "Yeni Tedavi",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(RoutesKeys.treatmentNew)},
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.supervised_user_circle, size: 48),
                  title: Text(provider.treatmentList[index].notes![0]),
                  subtitle:
                      Text(provider.treatmentList[index].endDate!.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          provider
                              .changeTreatment(provider.treatmentList[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.treatmentEdit);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          provider
                              .changeTreatment(provider.treatmentList[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.treatmentDelete);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: provider.treatmentList.length,
          ),
        ),
      ],
    );
  }
}
