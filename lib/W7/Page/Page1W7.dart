import 'package:flutter/material.dart';

class Page1W7 extends StatefulWidget {
  const Page1W7({super.key});

  @override
  State<Page1W7> createState() => _Page1W7State();
}

class _Page1W7State extends State<Page1W7> {
  String Date = "";
  String EndDate = "";

  void selectDateStart() async {
    DateTime? dt = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year, 1, 10),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );
    if (dt != null) {
      setState(() {
        Date = '${dt.day}/${dt.month}/${dt.year}';
        EndDate = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

  void selectDateEnd() async {
    DateTime? dt = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year, 1, 10),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );
    if (dt != null) {
      setState(() {
        EndDate = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: const Text('DatePicker Demo')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: selectDateStart,
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Form'),
                  ),
                  const SizedBox(width: 10),
                  Text(Date),
                ],
              ),
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: selectDateEnd,
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('To'),
                  ),
                  const SizedBox(width: 10),
                  Text(EndDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
