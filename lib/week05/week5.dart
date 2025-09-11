import 'package:flutter/material.dart';

class Week5 extends StatelessWidget {
  const Week5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, -1),
          child: Text('Single child'),
        )
      ),
    );
  }
}