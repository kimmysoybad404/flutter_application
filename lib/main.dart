import 'package:flutter/material.dart';
import 'package:flutter_application/week07/page/Ass1.dart';

void main() {
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Ass1(),
      debugShowCheckedModeBanner: false,
    );
  }
}