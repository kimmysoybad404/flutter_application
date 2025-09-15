import 'package:flutter/material.dart';
import 'dart:math';

class Guessgame extends StatefulWidget {
  const Guessgame({super.key});

  @override
  State<Guessgame> createState() => _RandomnumberState();
}

class _RandomnumberState extends State<Guessgame> {
  TextEditingController input = TextEditingController();
  late int numberrandom;
  int ogat = 3;
  String message = "";
  bool looswin = false;

  @override
  void initState() {
    super.initState();
    resetandrandom();
  }

  void resetandrandom() {
    setState(() {
      numberrandom = Random().nextInt(10);
      ogat = 3;
      message = "";
      looswin = false;
      input.clear();
    });
  }

  void click() {
    if (looswin) {
      resetandrandom();
      return;
    }

    if (input.text.isEmpty) {
      setState(() {
        message = " Please enter a number! ";
      });
      return;
    }

    int? guess = int.tryParse(input.text);
    if (guess == null) {
      setState(() {
        message = " Please enter only numbers 0-9! ";
      });
      return;
    }

    setState(() {
      if (guess == numberrandom) {
        message = "🎉 The number is $numberrandom correct, you win! 🎉";
        looswin = true;
      } else {
        ogat--;
        if (ogat > 0) {
          message = guess > numberrandom
              ? "$guess is too small  ( $ogat chance(s) left!)"
              : "$guess is too large ( $ogat chance(s) left!)";
        } else {
          message = " Sorry, you lose. The anwer is $numberrandom ";
          looswin = true;
        }
      }
      input.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 5, 0),
        title: const Text("Guess a number game"),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!looswin)
              SizedBox(
                width: 300,
                child: TextField(
                  controller: input,
                  decoration: const InputDecoration(
                    hintText: "Guess a number 0-9",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),

            const SizedBox(height: 30),

            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red, 
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: click,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: Text(
                looswin ? "Replay" : "Guess",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}