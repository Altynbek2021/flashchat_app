import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchatapp/chatting_page.dart';
import 'package:flashchatapp/input_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const String id = "RegisterPage";

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  String email = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go back")),
          const Hero(
            tag: "logo",
            child: Image(
              image: AssetImage("images/logo.png"),
              height: 200,
              width: 200,
            ),
          ),
          InputForm(
            isPsw: false,
            data: "Enter your email",
            onChanged: (String value) {
              email = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          InputForm(
            isPsw: true,
            data: "Enter your password",
            onChanged: (String value) {
              password = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.lightBlueAccent,
            ),
            child: TextButton(
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChattingPage.id);
                    }
                  } catch (e) {
                    (e);
                  }
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
