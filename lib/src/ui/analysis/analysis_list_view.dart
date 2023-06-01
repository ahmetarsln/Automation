import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/core/custom_app_bar.dart';
import 'package:demo/src/core/custom_drawer.dart';
import 'package:demo/src/data/models/analysis.dart';
import 'package:demo/src/ui/analysis/analysis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AnalysisListView extends StatelessWidget {
  AnalysisListView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var analysis2 = <Analysis>[];

  @override
  Widget build(BuildContext context) {
    analyses().then(
      (value) {
        analysis2 = value;
      },
    );
    final analysisProvider = Provider.of<AnalysisProvider>(context);

    return Consumer<AnalysisProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: const CustomAppBar(title: "Tahliller"),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  child: Text(
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
                      leading: Icon(Icons.supervised_user_circle, size: 48),
                      title: Text(analysis2[index].patient!.name! +
                          ' ' +
                          analysis2[index].patient!.surname!),
                      subtitle: Text(analysis2[index].patient!.tc!.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              value.changeAnalysis(analysis2[index]);
                              Navigator.of(context)
                                  .pushNamed(RoutesKeys.analysisEdit);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => {
                              Navigator.of(context)
                                  .pushNamed(RoutesKeys.analysisDelete)
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: analysis2.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
