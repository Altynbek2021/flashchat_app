import 'package:flashchatapp/login_page.dart';
import 'package:flashchatapp/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage("images/logo.png"),
                  size: 50,
                  color: Colors.yellow,
                ),
                Text(
                  " Flash Chat",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent,
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text("Log in")),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
