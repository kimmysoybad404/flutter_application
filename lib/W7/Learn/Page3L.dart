import 'package:flutter/material.dart';


class Page3L extends StatefulWidget {
  const Page3L({super.key});


  @override
  State<Page3L> createState() => _Page3LState();
}


class _Page3LState extends State<Page3L> {
  int gValue = 0, gValue2 = 2;


  void changeRadio(int? value) {
    //value is a radio button's value
    //whenever value matches groupValue, radio is selected
    setState(() {
      gValue = value!;
    });
  }


  void changeRadio2(int? value) {
    setState(() {
      gValue2 = value!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Radio(value: 0, groupValue: gValue, onChanged: changeRadio),
                const Text('0'),
                Radio(value: 1, groupValue: gValue, onChanged: changeRadio),
                const Text('1'),
                Radio(value: 2, groupValue: gValue, onChanged: changeRadio),
                const Text('2'),
                const Spacer(),
                Text('You choose $gValue'),
              ],
            ),
            Row(
              children: [
                Radio(value: 0, groupValue: gValue2, onChanged: changeRadio2),
                const Text('0'),
                Radio(value: 1, groupValue: gValue2, onChanged: changeRadio2),
                const Text('1'),
                Radio(value: 2, groupValue: gValue2, onChanged: changeRadio2),
                const Text('2'),
                const Spacer(),
                Text('You choose $gValue2'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

