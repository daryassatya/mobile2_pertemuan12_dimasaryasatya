import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController(text: "");
  TextEditingController _passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: buildLoginForm(),
      ),
    );
  }

  Widget buildLoginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildUsernameTextField(),
        buildPasswordTextField(),
        SizedBox(height: 16),
        buildLoginButton(),
      ],
    );
  }

  Widget buildUsernameTextField() {
    return TextField(
      controller: _usernameController,
      decoration: InputDecoration(labelText: 'Username'),
    );
  }

  Widget buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
    );
  }

  Widget buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        final username = _usernameController.text;
        final password = _passwordController.text;

        context.read<LoginBloc>().add(ProsesLogin(username: username, password: password));
      },
      child: Text('Login'),
    );
  }
}
