import 'package:flutter/material.dart';
import 'package:rqr_manx/domain/navigate_to.dart';
import 'package:rqr_manx/domain/requirements_model.dart';
import 'package:rqr_manx/ui/components/add_requirement_button.dart';

class RequirementsPage extends StatelessWidget {
  final List<RequirementsModel> itens = [
    RequirementsModel(
        name: 'Requisitos 1',
        description:
            'Desricao do meu requisitos. Ele será assim e assado e teraá que ser deste jeito',
        priority: 1,
        hours: 2)
  ];

  RequirementsPage({super.key});

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
                Navigate.toRequirementsFormPage(context);
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
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            );
          }),
      floatingActionButton: AddRequirementButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}