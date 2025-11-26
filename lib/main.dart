import 'package:flutter/material.dart';
import 'package:flutter_application/loginandre/login.dart';
import 'package:flutter_application/week07/page/Ass2.dart';
import 'package:flutter_application/week07/page/Ass3.dart';

void main() {
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}