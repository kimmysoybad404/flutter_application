import 'package:flutter/material.dart';


class Page1L extends StatefulWidget {
  const Page1L({super.key});


  @override
  State<Page1L> createState() => _Page1LState();
}


class _Page1LState extends State<Page1L> {
  bool cb = false, sw = false;


  void toggleCheckbox(bool? status) {
    setState(() {
      cb = status!;
    });
  }


  void toggleSwitch(bool? status) {
    setState(() {
      sw = status!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox & Switch demo'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: cb,
                onChanged: toggleCheckbox,
              ),
              Text('Checkbox: $cb'),
            ],
          ),
          Row(
            children: [
              Switch(
                value: sw,
                onChanged: toggleSwitch,
              ),
              Text('Switch: $sw'),
            ],
          ),
        ],
      ),
    );
  }
}

