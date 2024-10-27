import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Go back")),
    );
  }
}
