import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchatapp/chatting_page.dart';
import 'package:flashchatapp/input_form.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static const String id = "LoginPage";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage("images/logo.png"),
                    height: 200,
                    width: 200,
                  ),
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
                    setState(() {
                      showSpinner = true;
                    });

                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChattingPage.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      (e);
                    }
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
