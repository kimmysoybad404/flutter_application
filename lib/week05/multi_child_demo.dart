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
          //children: [
           // Container(color: Colors.green, width: 100, height: 100),
           // Spacer(flex: 1,),
           // Container(color: Colors.white, width: 100, height: 100),
          //  Spacer(flex: 2,),
          //  Container(color: Colors.red, width: 100, height: 100),
          children: [
            Expanded(child: Container(color: Colors.green, width: 100, height: 100)),
            Expanded(child: Container(color: Colors.white, width: 100, height: 100)),
            Expanded(child: Container(color: Colors.red, width: 100, height: 100)),
            
          ],
        ),
      ),

    );
  }
}