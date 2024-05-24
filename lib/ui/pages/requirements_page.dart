import 'package:flutter/material.dart';
import 'package:rqr_manx/data/requirements_repository.dart';
import 'package:rqr_manx/domain/navigate_to.dart';
import 'package:rqr_manx/domain/requirements_model.dart';
import 'package:rqr_manx/ui/components/add_requirement_button.dart';

class RequirementsPage extends StatefulWidget {
  final String projectId;
  RequirementsPage({super.key, required this.projectId});

  @override
  State<RequirementsPage> createState() => _RequirementsPageState();
}

class _RequirementsPageState extends State<RequirementsPage> {
  List<RequirementsModel> itens = [];

  @override
  void initState() {
    super.initState();

    RequirementsRepository.getAll(widget.projectId).then((data) {
      var list = data.map((json) => RequirementsModel.fromJson(json)).toList();
      setState(() {
        itens = list;
      });
    });
  }

  void refreshProjects() {
    RequirementsRepository.getAll(widget.projectId).then((data) {
      var list = data.map((json) => RequirementsModel.fromJson(json)).toList();
      setState(() {
        itens = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RqrManx  '),
      ),
      body: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            return ListTile(
              key: UniqueKey(),
              onTap: () {
                Navigate.toRequirementsFormPage(context,
                    requirementProject: widget.projectId,
                    requirementId: itens[index].id.toString(),
                    refreshProjects: refreshProjects);
              },
              leading: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.red, // Cor de fundo da bolinha
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[600]!, width: 2),
                ),
              ),
              title: Text(
                itens[index].name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                itens[index].description,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  RequirementsRepository.delete(itens[index].id);
                  refreshProjects();
                },
                icon: const Icon(Icons.delete),
              ),
            );
          }),
      floatingActionButton: AddRequirementButton(
        projcetId: widget.projectId,
        refreshProjects: refreshProjects,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
