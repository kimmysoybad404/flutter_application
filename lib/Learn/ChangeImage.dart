import 'package:flutter/material.dart';
import 'dart:math';

class ChangeImage extends StatefulWidget {
  const ChangeImage({super.key});

  @override
  State<ChangeImage> createState() => _ChangeImageState();
}

class _ChangeImageState extends State<ChangeImage> {
  int ss = 0;
  int RandomNum = 0;
  int TrueNumber = 0;

  List Images = [
    {"image": "aessets/images/fff.png"},
    {"image": "aessets/images/sss.png"},
    {"image": "aessets/images/ooo.png"},
    {"image": "aessets/images/lll.png"},
    {"image": "aessets/images/hhh.png"},
  ];

  Raniamge() async {
    TrueNumber = Random().nextInt(5);
    print("TrueNum: $TrueNumber");

    do {
      RandomNum = Random().nextInt(5);
      print("RanNum: $RandomNum");
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 3000));
    } while (RandomNum != TrueNumber);

    print("✅ เจอแล้ว! RandomNum == TrueNumber ($RandomNum)");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "${Images[RandomNum]["image"]!}",
                height: 100,
                width: 100,
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: Raniamge,
              child: const Text("Random Images"),
            ),
          ],
        ),
      ),
    );
  }
}
