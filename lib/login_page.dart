import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage("images/logo.png"),
                height: 200,
                width: 200,
              ),
            ),
            InputForm(data: "Enter your email"),
            SizedBox(
              height: 30,
            ),
            InputForm(data: "Enter your password"),
            SizedBox(
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      // body: TextButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: Text("Go back"),
      // ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.data,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(color: Colors.lightBlueAccent, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(color: Colors.lightBlueAccent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(color: Colors.lightBlueAccent, width: 0.0),
          ),
          labelText: data),
    );
  }
}
