import 'package:flashchatapp/login_page.dart';
import 'package:flashchatapp/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  static const String id = "auth_page";

  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "logo",
                  child: Container(
                    child: ImageIcon(
                      AssetImage("images/logo.png"),
                      size: 80,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const Text(
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
                    Navigator.pushNamed(context, LoginPage.id);
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
                  Navigator.pushNamed(context, RegisterPage.id);
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
