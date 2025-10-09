import 'package:flutter/material.dart';

class Page1W7 extends StatefulWidget {
  const Page1W7({super.key});

  @override
  State<Page1W7> createState() => _Page1W7State();
}

class _Page1W7State extends State<Page1W7> {
  String date = "";

  void selectDateStart() async {
    DateTime? dt = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
