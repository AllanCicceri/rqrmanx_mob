import 'package:flutter/material.dart';
import 'package:rqr_manx/data/users_repository.dart';
import 'package:rqr_manx/domain/navigate_to.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onLogin() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    String name = await UsersRepository.getByNameAndPass(username, password);
    if (name.isNotEmpty) {
      Navigate.toMainPage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png", width: 250, height: 250),
              SizedBox(height: 32.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: onLogin,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
