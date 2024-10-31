import 'package:flashchatapp/auth_page.dart';
import 'package:flashchatapp/chatting_page.dart';
import 'package:flashchatapp/login_page.dart';
import 'package:flashchatapp/register_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AuthPage.id,
      routes: {
        AuthPage.id: (context) => AuthPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChattingPage.id: (context) => ChattingPage()
      },
    );
  }
}
