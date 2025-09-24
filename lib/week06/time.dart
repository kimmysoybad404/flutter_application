import 'dart:async';
import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  double number = 1.00;
  late Timer timer;
  bool notst = false;
  Color gay = Colors.deepPurple;

  void countdown(Timer timer) {
    setState(() {
      number -= 0.01;
      if (number <= 0) {
        number = 0;
        timer.cancel();
        notst = false;
      }
    });
  }

  void startCountdown() {
    if (!notst) {
      notst = true;
      timer = Timer.periodic(const Duration(milliseconds: 10), countdown);
      setState(() {
        gay = Colors.grey;
      });
    }
  }

  void reset() {
    setState(() {
      timer.cancel();
      number = 1;
      gay = Colors.deepPurple;
      notst = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number.toStringAsFixed(2),
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: notst ? null :startCountdown,
                  label: Text("Start"),
                  icon: Icon(Icons.play_circle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gay,
                    foregroundColor: Colors.white,
                  ),
                ),

                const SizedBox(width: 15),

                ElevatedButton.icon(
                  onPressed: reset,
                  label: Text("Reset"),
                  icon: Icon(Icons.loop),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
