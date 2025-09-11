import 'package:flutter/material.dart';

class MultiChildDemo extends StatelessWidget {
  const MultiChildDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child:  Container(color: Colors.green, width: 100, height: 100),
            ),
            Container(color: Colors.yellow, width: 100, height: 150),
            Expanded(
              flex: 2,
              child:  Container(color: Colors.red, width: 100, height: 100),
            ),
            
            
          ],
        ),
      ),

    );
  }
}