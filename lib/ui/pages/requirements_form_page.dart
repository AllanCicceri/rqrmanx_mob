import 'package:flutter/material.dart';
import 'package:rqr_manx/data/requirements_repository.dart';
import 'package:rqr_manx/domain/requirements_model.dart';
import 'package:rqr_manx/ui/components/custom_dropdown.dart';
import 'package:rqr_manx/ui/components/custom_textfield.dart';
import 'package:rqr_manx/ui/components/save_button.dart';

class RequirementsFormPage extends StatefulWidget {
  final int projectId;
  final Function refreshProjects;
  final int requirementId;

  RequirementsFormPage(
      {super.key,
      this.requirementId = 0,
      required this.projectId,
      required this.refreshProjects});

  @override
  State<RequirementsFormPage> createState() => _RequirementsFormPageState();
}

class _RequirementsFormPageState extends State<RequirementsFormPage> {
  TextEditingController nameCtrl = TextEditingController();

  TextEditingController descriptionCtrl = TextEditingController();

  TextEditingController hoursCtrl = TextEditingController();

  void _saveRequirement(BuildContext context) {
    RequirementsModel model = RequirementsModel(
        projectId: widget.projectId,
        name: nameCtrl.text,
        description: descriptionCtrl.text,
        hours: double.parse(hoursCtrl.text));

    model.difficulty = 0;
    model.priority = 0;
    model.type = 0;
    model.id = widget.requirementId;

    if (model.id == 0) {
      RequirementsRepository.insert(model);
    } else {
      RequirementsRepository.update(model);
    }

    Navigator.pop(context);
    widget.refreshProjects();
  }

  @override
  void initState() {
    if (widget.requirementId > 0) {
      RequirementsRepository.getById(widget.requirementId, widget.projectId)
          .then((data) {
        var model = RequirementsModel.fromJson(data);

        nameCtrl.text = model.name;
        descriptionCtrl.text = model.description;
        hoursCtrl.text = model.hours.toString();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RqrManx  ')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(title: 'Name', controller: nameCtrl),
            CustomTextField(
                title: 'Description', controller: descriptionCtrl, maxLines: 4),
            const SizedBox(height: 20),
            SizedBox(
                width: 100,
                child: CustomTextField(title: 'Hours', controller: hoursCtrl)),
            const SizedBox(height: 40),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropdown(
                      label: 'Difficulty Level',
                      items: ['low', 'medium', 'high']),
                  CustomDropdown(
                      label: 'Priority Level',
                      items: ['low', 'medium', 'high']),
                ]),
          ],
        ),
      ),
      floatingActionButton:
          SaveButton(saveRequirement: () => _saveRequirement(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
