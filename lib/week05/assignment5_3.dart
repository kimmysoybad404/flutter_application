import 'dart:math';

import 'package:flutter/material.dart';

class Assignment53 extends StatefulWidget {
  const Assignment53({super.key});

  @override
  State<Assignment53> createState() => _Assignment53State();
}

class _Assignment53State extends State<Assignment53> {
  TextEditingController tcnumber = TextEditingController();
  String result = '';
  String btnText = 'Guess';
  int ranNum = Random().nextInt(10);
  int change = 3;

  void checkNum() {
    int? number = int.tryParse(tcnumber.text);
    if (number == null){
      setState(() {
        result = 'Incorrect input';

      });
      return;
    }

    if (btnText == "Replay"){
      setState(() {
        tcnumber.clear();
        result = '';
        btnText = 'Guess';
        ranNum = Random().nextInt(10);
      });
      return;
    }

    if (change != 0) {
      if (ranNum > number! && change != 0) {
        setState(() {
          
          result = "$number is too small, $change(s) left!";
          change--;
        });

        return;
      } else if (ranNum < number && change != 0) {
        setState(() {
          
          result = "$number is too large, $change(s) left!";
          change--;
        });

        return;
      } else {
        setState(() {
          result = "Correct, you win!";
          btnText = 'Replay';
          change = 3;
          ranNum = Random().nextInt(10);
        });
      }
    } else {
      setState(() {
        result = 'Sorry,you lose. The answer is $ranNum';
        btnText = 'Replay';
        change = 3;
        ranNum = Random().nextInt(10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess a number game", style: TextStyle(fontSize: 20)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tcnumber,
              decoration: const InputDecoration(hintText: 'Guess a number 0-9'),
            ),
          ),
          Text(result, style:  TextStyle(color: Colors.red),),
          FilledButton(
            onPressed: checkNum,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            child: Text(
              btnText,
              style: TextStyle(color: Colors.deepPurple[300]),
            ),
          ),
        ],
      ),
    );
  }
}
