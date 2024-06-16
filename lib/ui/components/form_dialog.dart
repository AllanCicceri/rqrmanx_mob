import 'package:flutter/material.dart';
import 'package:rqr_manx/data/projects_repository.dart';
import 'package:rqr_manx/domain/project_model.dart';

class FormDialog {
  static Future<void> show(BuildContext context, ProjectModel? model) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();
    final TextEditingController linkController = TextEditingController();

    if (model != null) {
      nameController.text = model.name;
      startDateController.text = model.startDate;
      endDateController.text = model.finalDate;
      linkController.text = model.link;
    }

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: startDateController,
                decoration: InputDecoration(labelText: 'Start Date'),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    startDateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              TextFormField(
                controller: endDateController,
                decoration: InputDecoration(labelText: 'End Date'),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    endDateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
              ),
              TextFormField(
                controller: linkController,
                decoration: InputDecoration(labelText: 'link'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String name = nameController.text;
                String startDate =
                    convertDateToSQLiteFormat(startDateController.text);
                String finalDate =
                    convertDateToSQLiteFormat(endDateController.text);
                String link = linkController.text;

                ProjectModel newModel = ProjectModel(
                    name: name,
                    startDate: startDate,
                    finalDate: finalDate,
                    link: link);

                if (model != null) {
                  newModel.id = model.id;
                }

                _saveProject(newModel);

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

void _saveProject(ProjectModel model) async {
  if (model.id == 0) {
    ProjectsRepository.insert(model);
  } else {
    ProjectsRepository.update(model);
  }
}

String convertDateToSQLiteFormat(String date) {
  // Divide a string em dia, mês e ano
  List<String> parts = date.split('-');
  String day = parts[0];
  String month = parts[1];
  String year = parts[2];

  // Retorna a data no formato 'YYYY-MM-DD'
  return '$year-$month-$day';
}
