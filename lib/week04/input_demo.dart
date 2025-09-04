import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  String message = '';

  void updateMessage(String str) {
    setState(() {
      message = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Demo')),
      body: Column(
        children: [
          TextField(onChanged: (String str) => updateMessage(str)),
          Text(message),
        ],
      ),
    );
  }
}
