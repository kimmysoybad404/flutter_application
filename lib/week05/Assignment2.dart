import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  String output = "";

  void _sumnumber() {
    setState(() {
      if (num1.text.isEmpty || num2.text.isEmpty) {
        output = "Incorrect input";
        return;
      }

      int? n1 = int.tryParse(num1.text);
      int? n2 = int.tryParse(num2.text);
      if (n1 == null || n2 == null) {
        output = "Incorrect input";

        return;
      }

      output = "Result = ${n1 + n2}";
    });
  }

  void _Clear() {
    setState(() {
      num1.clear();
      num2.clear();
      output = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: num1,
                    decoration: InputDecoration(hintText: "First number"),
                    textAlign: TextAlign.center,
                  ),
                ),

                Spacer(),
                Text("+"),
                Spacer(),

                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: num2,
                    decoration: InputDecoration(hintText: "Second number"),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: _sumnumber,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: _Clear,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Clear", style: TextStyle(color: Colors.white)),
                ),

                Spacer(),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              output ?? '',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}