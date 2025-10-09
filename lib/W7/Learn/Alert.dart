import 'package:flutter/material.dart';


class Alert extends StatelessWidget {
  const Alert({super.key});


  void showAlert(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Alert title'),
            content: Text('Alert content'),
          );
        });
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
          onPressed: () => showAlert(context),
          child: const Text('alert'),
        ),
      ),
    );
  }
}

