import 'package:flutter/material.dart';

class Page2W7 extends StatefulWidget {
  const Page2W7({super.key});

  @override
  State<Page2W7> createState() => _Page2W7State();
}

class _Page2W7State extends State<Page2W7> {
  bool sw = false;
  double sliderValue1 = 0.5;
  double sliderValue2 = 20;
  String TextSugar = "none";
  String TypeHorC = "Hot";

  void SelectType(bool? status) {
    setState(() {
      sw = status!;
      if (sw == true) {
        TypeHorC = "Cold";
      } else {
        TypeHorC = "Hot";
      }
    });
  }

  void showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your order'),
          content: Text('$TypeHorC coffee with $TextSugar sugar'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("Your Order", style: TextStyle(fontSize: 30)),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text("Type"),
                  Spacer(),
                  Text("Hot"),
                  Switch(value: sw, onChanged: SelectType),
                  Text("Cold"),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sugar level"),
                Slider(
                  min: 0,
                  max: 100,
                  value: sliderValue2,
                  divisions: 2,
                  label: TextSugar,
                  onChanged: (value) {
                    sliderValue2 = value;
                    setState(() {
                      if (value == 0) {
                        TextSugar = "none";
                      } else if (value == 50) {
                        TextSugar = "less";
                      } else if (value == 100) {
                        TextSugar = "normal";
                      }
                    });
                  },
                ),
                Text("Normal"),
              ],
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: showAlert,
              child: Text("ORDER", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
