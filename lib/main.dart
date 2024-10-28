import 'package:flashchatapp/auth_page.dart';
import 'package:flashchatapp/chatting_page.dart';
import 'package:flashchatapp/login_page.dart';
import 'package:flashchatapp/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'chat': (context) => const ChattingPage()
      },
    );
  }
}
