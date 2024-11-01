import 'package:firebase_core/firebase_core.dart';
import 'package:flashchatapp/auth_page.dart';
import 'package:flashchatapp/chatting_page.dart';
import 'package:flashchatapp/firebase_options.dart';
import 'package:flashchatapp/login_page.dart';
import 'package:flashchatapp/register_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp;
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
        AuthPage.id: (context) => const AuthPage(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ChattingPage.id: (context) => ChattingPage()
      },
    );
  }
}
