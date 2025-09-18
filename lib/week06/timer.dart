import 'dart:async';

import 'package:flutter/material.dart';

class TimerDemo extends StatefulWidget {
  const TimerDemo({super.key});


  @override
  State<TimerDemo> createState() => _TimerDemoState();
}


class _TimerDemoState extends State<TimerDemo> {
  String status = 'Start';


  void stop() {
    setState(() {
      status = 'Stop';
    });
  }


  @override
  void initState() {
    super.initState();
    // start timer
    Timer(const Duration(seconds: 3), stop);
    // Future.delayed(const Duration(seconds: 3), stop);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            status,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
