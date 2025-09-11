import 'package:flutter/material.dart';

class MultiChildDemo extends StatelessWidget {
  const MultiChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(color: Colors.blue, width: 100, height: 100),
            Container(color: Colors.white, width: 100, height: 100),
            Container(color: Colors.red, width: 100, height: 100),
          ],
        ),
      ),

    );
  }
}