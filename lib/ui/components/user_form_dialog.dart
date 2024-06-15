import 'package:flutter/material.dart';
import 'package:rqr_manx/data/users_repository.dart';
import 'package:rqr_manx/domain/user_model.dart';

class UserFormDialog {
  static Future<void> show(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String name = nameController.text;
                String pass = passController.text;

                UserModel user = UserModel(name: name, password: pass);
                _saveUser(user);

                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

void _saveUser(UserModel model) async {
  UsersRepository.insert(model);
}
