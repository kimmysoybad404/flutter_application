import 'package:flutter/material.dart';

class Ass1 extends StatefulWidget {
  const Ass1({super.key});

  @override
  State<Ass1> createState() => _Ass1State();
}

class _Ass1State extends State<Ass1> {
  String _Form = '';
  String _To = '';

  void initState() {
    super.initState();
    datenow(); // แสดงวันที่ปัจจุบันตอนเปิดแอป
  }

  void datenow() {
    DateTime now = DateTime.now();
    setState(() {
      _Form = '${now.day}/${now.month}/${now.year}';
      _To = '${now.day}/${now.month}/${now.year}';
    });
  }

  void selectFrom() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        _Form = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

  void selectTo() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );

    if (dt != null) {
      setState(() {
        _To = '${dt.day}/${dt.month}/${dt.year}';
      });
    }
  }

  void showdate() {}

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
                  onPressed: selectFrom,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('From'),
                ),
                const SizedBox(width: 20),
                Text(_Form),
              ],
            ),

            Row(
              children: [
                FilledButton.icon(
                  onPressed: selectTo,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('To'),
                ),
                const SizedBox(width: 20),
                Text(_To),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
