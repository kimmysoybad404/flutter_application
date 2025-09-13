import 'package:flutter/material.dart';

class Assignment51 extends StatefulWidget {
  const Assignment51({super.key});

  @override
  State<Assignment51> createState() => _Assignment51State();
}

class _Assignment51State extends State<Assignment51> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Wedding Organiser',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Sevillana',
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Pre-wedding, Photo, Party',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Sevillana',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 25),
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              child: Text('Our services'),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '345 Moo 1 Tasud Chiang Rai, Thailand',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
