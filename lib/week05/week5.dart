import 'package:flutter/material.dart';

class Week5 extends StatelessWidget {
  const Week5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          child: Text('Singlechild'),
          color: Colors.amber,
          width: 100,
          height: 50,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}