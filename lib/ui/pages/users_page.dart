import 'package:flutter/material.dart';
import 'package:rqr_manx/data/users_repository.dart';
import 'package:rqr_manx/ui/components/add_project_button.dart';
import 'package:rqr_manx/ui/components/user_form_dialog.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<Map<String, dynamic>> userList = []; // Lista de itens de exemplo

  @override
  void initState() {
    super.initState();
    _carregaDados();
  }

  void _carregaDados() {
    UsersRepository.getAll().then((value) => {
          setState(() {
            userList = value;
          })
        });
  }

  void _onClick(BuildContext context) async {
    await UserFormDialog.show(context);
    _carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              userList[index]['name'],
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: IconButton(
              onPressed: () {
                UsersRepository.delete(userList[index]['id']);
                _carregaDados();
              },
              icon: const Icon(Icons.delete),
            ),
            onTap: () {
              // Ação ao clicar em um item da lista, se necessário
            },
          );
        },
      ),
      floatingActionButton: AddProjectButton(onClick: _onClick),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
