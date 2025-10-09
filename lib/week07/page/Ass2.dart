import 'dart:ffi';

import 'package:flutter/material.dart';

class Ass2 extends StatefulWidget {
  const Ass2({super.key});

  @override
  State<Ass2> createState() => _Ass2State();
}

class _Ass2State extends State<Ass2> {
  bool sw = false;
  double slidervalue = 100;
  final List<String> sugarWords = ['none', 'less', 'normal'];

  void toggleSwitch(bool value) {
    setState(() => sw = value);
  }

  String sugarLabel(double v) {
    final idx = (v / 50).round().clamp(0, 2);
    return sugarWords[idx];
  }

  String get drinkType => sw ? 'Cold' : 'Hot';

  void showAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your order'),
          content: Text(
            '$drinkType coffee with ${sugarLabel(slidervalue)} sugar',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("MFU Coffee Shop", style: TextStyle(color: Colors.white)),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Your order", style: TextStyle(fontSize: 30)),
              Row(
                children: [
                  Text("Type", style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Text("Hot", style: TextStyle(fontSize: 20)),
                  Switch(value: sw, onChanged: toggleSwitch),
                  Text("Cold", style: TextStyle(fontSize: 20)),
                ],
              ),

              Row(
                children: [
                  Text("Sugar level", style: TextStyle(fontSize: 20)),
                  Slider(
                    min: 0,
                    max: 100,
                    value: slidervalue,
                    divisions: 2,
                    label: sugarLabel(slidervalue),
                    onChanged: (value) {
                      setState(() {
                        slidervalue = value;
                      });
                    },
                  ),
                  Text("Normal", style: TextStyle(fontSize: 20)),
                ],
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () => showAlert(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: Text("ORDER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
