import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    super.key,
    required this.data,
    required this.onChanged,
    required this.isPsw,
  });

  final String data;
  final Function onChanged;
  final bool isPsw;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) {
        widget.onChanged(value);
      },
      obscureText: widget.isPsw,
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
          labelText: widget.data),
    );
  }
}
