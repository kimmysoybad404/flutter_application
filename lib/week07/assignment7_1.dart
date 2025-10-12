import 'package:flutter/material.dart';

class Assignment71 extends StatefulWidget {
  const Assignment71({super.key});

  @override
  State<Assignment71> createState() => _Assignment71State();
}

class _Assignment71State extends State<Assignment71> {
  String _fromdate = '';
  String _todate = '';
  DateTime mindate = DateTime.now();
  Future<String> getTodayDate() async {
    DateTime now = DateTime.now();
    String date = '${now.day}/${now.month}/${now.year}';
    return date;
  }

  void selectFromDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        _fromdate = '${dt.day}/${dt.month}/${dt.year}';
        _todate = '${dt.day}/${dt.month}/${dt.year}';
        mindate = dt;
      });
    }
  }

  void selectToDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: mindate,
      firstDate: mindate,
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        _todate = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeDates();
  }

  void _initializeDates() async {
    String today = await getTodayDate();

    setState(() {
      _fromdate = today;
      _todate = today;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                FilledButton.icon(
                  onPressed: selectFromDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('From'),
                ),
                SizedBox(width: 10),
                Text(_fromdate),
              ],
            ),

            Row(
              children: [
                FilledButton.icon(
                  onPressed: selectToDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('To'),
                ),
                SizedBox(width: 10),
                Text(_todate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
