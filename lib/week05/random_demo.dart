import 'dart:math';

import 'package:flutter/material.dart';

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});
  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  TextEditingController tcMin = TextEditingController();
  TextEditingController tcMax = TextEditingController();
  String result = '';
  void genarateRandom(){
    int? min = int.tryParse(tcMin.text);
    int? max = int.tryParse(tcMax.text);
    if (min == null || max == null || min> max){
      setState(() {
        result = 'Wrong inputs';
      });
      return;
    }
    int random = min + Random().nextInt(max - min + 1);
    debugPrint(result.toString());
    setState(() {
      result = random.toString();
    });
  }

  void clear(){
    tcMin.clear();
    tcMax.clear();
    setState(() {
      result = '';
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Random Integer Number'),
            TextField(controller: tcMin, decoration: const InputDecoration(hintText: 'min')),
            TextField(controller: tcMax, decoration: InputDecoration(hintText: 'max')),
            Text(result),
            FilledButton(onPressed: genarateRandom, child: const Text('Generate')),
            FilledButton(onPressed: clear, child: Text('Clear'))

          ],
        ),
      ),
    );
  }
}
