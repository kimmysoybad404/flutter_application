import 'package:flutter/material.dart';

class ShowAlert extends StatefulWidget {
  const ShowAlert({super.key});

  @override
  State<ShowAlert> createState() => _ShowAlertState();
}

class _ShowAlertState extends State<ShowAlert> {
  void showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Alert title'),
          content: Text('Alert content'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alert Dialog')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FilledButton(onPressed: showAlert, child: const Text('alert')),
      ),
    );
  }
}
