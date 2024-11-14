import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
    const PasswordField({super.key});

    @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Senha',
        ),
      ),
    );
  }    
}

class UsarnameField extends StatelessWidget {
    const UsarnameField({super.key});

    @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Usuário',
        ),
      ),
    );
  }    
}

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Gabriel')),
      body: const Column(
        children: <Widget> [
          UsarnameField(),
          PasswordField(),
        ],
      )
    );
  }
}