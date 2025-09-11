import 'package:flutter/material.dart';

class Design2Demo extends StatelessWidget {
  const Design2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        

       title: const Text('My Profile', style: TextStyle(color: Colors.white),),
       centerTitle: true,
       backgroundColor: Colors.black,
       centerTitle: true,
      ),
      

    );
  }
}