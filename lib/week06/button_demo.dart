import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Column(
        children: [
          OverflowBar(
             alignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {},
          color: Colors.red,
        ),

            ],
          )
        ],
      )) 
    );
  }
}