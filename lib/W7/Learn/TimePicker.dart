import 'package:flutter/material.dart';


class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({super.key});


  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}


class _TimePickerDemoState extends State<TimePickerDemo> {
  String _time = '';


  void selectTime() async {
    TimeOfDay? td = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (td != null) {
      setState(() {
        _time = '${td.hour}:${td.minute}';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TimePicker Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(_time),
            FilledButton.icon(
              onPressed: selectTime,
              icon: const Icon(Icons.access_time),
              label: const Text('Select'),
            ),
          ],
        ),
      ),
    );
  }
}

