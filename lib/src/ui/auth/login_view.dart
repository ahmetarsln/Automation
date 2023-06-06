import 'package:demo/src/core/app_constant.dart';
import 'package:demo/src/data/models/auth.dart';
import 'package:demo/src/ui/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: null,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthModel req = new AuthModel(
                      email: _emailController.text,
                      password: _passwordController.text);

                  provider.login(req, context);
                  print(
                      'Email: ${_emailController.text}, Password: ${_passwordController.text}');
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesKeys.register);
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
