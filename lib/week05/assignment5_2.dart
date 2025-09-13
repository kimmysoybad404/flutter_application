import 'package:flutter/material.dart';

class Assignment52 extends StatefulWidget {
  const Assignment52({super.key});

  @override
  State<Assignment52> createState() => _Assignment52State();
}

class _Assignment52State extends State<Assignment52> {
  TextEditingController tcFirst = TextEditingController();
  TextEditingController tcSec = TextEditingController();
  String result = '';
  void calculate() {
    int? first = int.tryParse(tcFirst.text);
    int? sec = int.tryParse(tcSec.text);
    if (first == null || sec == null || first == String || sec == String){
      setState(() {
        result = 'Incorrect input';
      });
      
      return;
    }

    int calculated = first + sec;
    String sum = calculated.toString();
    setState(() {
        result = "Result = $sum";
      });

  }
  void clear(){
    setState(() {
      tcFirst.clear();
      tcSec.clear();
      result = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextField(
                    controller: tcFirst,
                    decoration: const InputDecoration(hintText: 'First number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('+'),
                ),
                Flexible(
                  child: TextField(
                    controller: tcSec,
                    decoration: const InputDecoration(
                      hintText: 'Second number',
                    ),
                  ),
                ),
              ],
            ),

             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(onPressed: calculate, style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)), child: Text('Calulate')),
                SizedBox(width: 10, height: 100,),
                FilledButton(onPressed: clear,style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)), child: Text('Clear')),
              ], 
            ),

             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(result, style:  TextStyle(color: Colors.red),)
              ]
            ),
          ],
        ),
      ),
    );
  }
}
