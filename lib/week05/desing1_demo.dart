import 'package:flutter/material.dart';

class Desing1Demo extends StatelessWidget {
  const Desing1Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(color: Colors.red, width: 100, height: 100),
          Container(color: Colors.teal, width: 100, height: 100),
          Container(color: Colors.blue, width: 100, height: 100),
        ],
      ),
    );
  }
}