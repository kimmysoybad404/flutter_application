import 'package:flutter/material.dart';


class ActionAlert extends StatefulWidget {
  const ActionAlert({super.key});


  @override
  State<ActionAlert> createState() => _ActionAlertState();
}


class _ActionAlertState extends State<ActionAlert> {
  void showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert title'),
          content: Text('Alert content'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pop(context);
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FilledButton(
          onPressed: showAlert,
          child: const Text('alert'),
        ),
      ),
    );
  }
}

