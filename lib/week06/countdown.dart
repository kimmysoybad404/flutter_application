import 'dart:async';
import 'package:flutter/material.dart';


class CountDown extends StatefulWidget {
  const CountDown({super.key});


  @override
  State<CountDown> createState() => _CountDownState();
}


class _CountDownState extends State<CountDown> {
  int count = 5;




  void countdown(Timer timer) {
    setState(() {
      count--;
      if (count == 0) {
        timer.cancel();
      }
    });
  }


  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) => countdown(timer));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            count.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}

