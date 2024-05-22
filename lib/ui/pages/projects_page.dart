import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rqr_manx/domain/navigate_to.dart';
import 'package:rqr_manx/domain/project_model.dart';

class ProjectsPage extends StatelessWidget {
  final List<ProjectModel> itens = [
    ProjectModel(
        name: 'Projecto 1',
        startDate: DateTime.now(),
        finalDate: DateTime.now().add(const Duration(days: 30)))
  ];
  ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('RqrManx  '),
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.folder,
              size: 30,
            ),
            title: Text(itens[index].name,
                style: Theme.of(context).textTheme.titleSmall),
            subtitle: Text(
                'Fim Previsto: ${formatter.format(itens[index].finalDate)}',
                style: Theme.of(context).textTheme.bodySmall),
            trailing: IconButton(
              onPressed: () {
                Navigate.toRequirementsPage(context);
              },
              icon: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
          );
        },
      ),
    );
  }
}
