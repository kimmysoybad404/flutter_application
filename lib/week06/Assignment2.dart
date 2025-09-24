import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
    const MaterialApp(home: ClickGames(), debugShowCheckedModeBanner: false),
  );
}

class ClickGames extends StatefulWidget {
  const ClickGames({super.key});

  @override
  State<ClickGames> createState() => _ClickGameState();
}

class _ClickGameState extends State<ClickGames> {
  double timeLeft = 1.00;
  int clicks = 0;
  Timer? timer;
  bool isRunning = false;

  void startGame() {
    setState(() {
      timeLeft = 1.00;
      clicks = 0;
      isRunning = true;
    });

    timer?.cancel();

    timer = Timer.periodic(const Duration(milliseconds: 10), (t) {
      setState(() {
        timeLeft -= 0.01;
        if (timeLeft <= 0) {
          timeLeft = 0;
          isRunning = false;
          timer?.cancel();
        }
      });
    });
  }


  void addClick() {
    if (isRunning) {
      setState(() {
        clicks++;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              timeLeft.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            Text(
              "Click = $clicks",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: addClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              icon: const Icon(Icons.touch_app, color: Colors.white),
              label: const Text(
                "Click",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: startGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text(
                "PLAY",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
