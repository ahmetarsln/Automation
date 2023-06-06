import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AnalysisListView extends StatefulWidget {
  const AnalysisListView({super.key});

  @override
  State<AnalysisListView> createState() => _AnalysisListViewState();
}

class _AnalysisListViewState extends State<AnalysisListView> {
  late var analysis2 = <Analysis>[];

  @override
  Widget build(BuildContext context) {
    analyses().then(
      (value) {
        setState(() {
          analysis2 = value;
        });
      },
    );

    return Scaffold(
      appBar: const CustomAppBar(title: "Tahliller"),
      drawer: const CustomDrawer(),
      body: Consumer<AnalysisProvider>(builder: (context, provider, child) {
        return provider.isLoading
            ? const Center(
                child: Text("Yükleniyor"),
              )
            : _bodyWidget(context, provider);
      }),
    );
  }

  Widget _bodyWidget(BuildContext context, AnalysisProvider provider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              child: const Text(
                "Yeni Tahlil",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(RoutesKeys.analysisNew)},
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.supervised_user_circle, size: 48),
                  title: Text(provider.analysisList[index].patient!.name! +
                      ' ' +
                      provider.analysisList[index].patient!.surname!),
                  subtitle: Text(provider.analysisList[index].finishdate!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          provider.changeAnalysis(provider.analysisList[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.analysisEdit);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          provider.changeAnalysis(provider.analysisList[index]);
                          Navigator.of(context)
                              .pushNamed(RoutesKeys.analysisDelete);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: provider.analysisList.length,
          ),
        ),
      ],
    );
  }
}
