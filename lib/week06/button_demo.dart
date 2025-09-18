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
            children: [Icon(Icon.volum_up, color: Colors.red),
            onPress],
          )
        ],
      )) 
    );
  }
}