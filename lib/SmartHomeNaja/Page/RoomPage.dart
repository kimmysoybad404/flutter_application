import 'package:flutter/material.dart';

class Roompage extends StatefulWidget {
  const Roompage({super.key});

  @override
  State<Roompage> createState() => _RoompageState();
}

class _RoompageState extends State<Roompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: Text("Room"),
      ),
      body: Center(child: Text("RoomPage")),
    );
  }
}