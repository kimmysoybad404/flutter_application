import 'package:flutter/material.dart';
import 'dart:async';

class Click extends StatefulWidget {
  const Click({super.key});

  @override
  State<Click> createState() => _ClickState();
}

class _ClickState extends State<Click> {
  int clickAmount = 0;
  double time = 1.00;
  bool timeRun = false; 

  void countClicked() {
    if (timeRun == false){
        return;
    }
    setState(() {      
      clickAmount += 1;
    });
  }
  
  void checkTime(Timer timer){
    setState(() {
    if (time < 0.01){
      timer.cancel();
      timeRun = false;
      time = 1.00;
      return;
    }
      time -= 0.01;
    });

  }

  void play() {
      setState(() {
        timeRun = true;
        clickAmount = 0;
        Timer.periodic(const Duration(milliseconds: 10), (timer) => checkTime(timer));
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                time.toStringAsFixed(2),
                style: TextStyle(color: Colors.red),
              ),
              Text('Click = $clickAmount', style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: countClicked,
                    icon: const Icon(Icons.ads_click),
                    iconAlignment: IconAlignment.start,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                    ),
                    label: Text('Click', style: TextStyle(fontSize: 15)),
                  ),

                  FilledButton.icon(
                    onPressed: play,
                    icon: const Icon(Icons.replay, color: Colors.black),
                    iconAlignment: IconAlignment.start,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      side: BorderSide(),
                    ),
                    label: Text(
                      'Play'.toUpperCase(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }  
}