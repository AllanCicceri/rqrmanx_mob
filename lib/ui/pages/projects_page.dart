import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rqr_manx/data/projects_repository.dart';
import 'package:rqr_manx/domain/navigate_to.dart';
import 'package:rqr_manx/domain/project_model.dart';
import 'package:rqr_manx/ui/components/add_project_button.dart';
import 'package:rqr_manx/ui/components/form_dialog.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<ProjectModel> itens = [];

  void _addProject(BuildContext context) async {
    try {
      await FormDialog.show(context, null);
      getProjects();
    } catch (e) {}
  }

  void getProjects() async {
    var data = await ProjectsRepository.getAll();
    var listOfProjects =
        data.map((json) => ProjectModel.fromJson(json)).toList();
    setState(() {
      itens = listOfProjects;
    });
  }

  @override
  void initState() {
    super.initState();
    ProjectsRepository.getAll().then((data) {
      var list = data.map((json) => ProjectModel.fromJson(json)).toList();
      setState(() {
        itens = list;
      });
    });
  }

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
            onTap: () {
              Navigate.toRequirementsPage(context, itens[index].id.toString());
            },
            onLongPress: () async {
              var editModel = ProjectModel(
                  name: itens[index].name,
                  startDate: itens[index].startDate,
                  finalDate: itens[index].finalDate);
              editModel.id = itens[index].id;
              await FormDialog.show(context, editModel);
              getProjects();
            },
            leading: const Icon(
              Icons.folder_copy_outlined,
              size: 25,
            ),
            title: Text(itens[index].name,
                style: Theme.of(context).textTheme.titleSmall),
            subtitle: Text('Fim Previsto: ${itens[index].finalDate}',
                style: Theme.of(context).textTheme.bodySmall),
            trailing: IconButton(
              onPressed: () {
                ProjectsRepository.delete(itens[index].id);
                getProjects();
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
      floatingActionButton: AddProjectButton(
        onClick: _addProject,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
